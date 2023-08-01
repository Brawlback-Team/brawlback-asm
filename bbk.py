#!/usr/bin/env python3

import io
import os
import sys
import stat
from typing import BinaryIO
import zipfile
import logging
import shutil
import tempfile
import tarfile
import platform
from functools import partial
from pathlib import Path
import urllib.request


def _import_err(e: ImportError):
    sys.stderr.write(
        f"missing python modules: {e}\n"
        "run `python3 -m pip install --user -r tools/requirements.txt` to install prerequisites.\n"
    )
    sys.exit(1)


try:
    import click
    import requests
    from rich.console import Console
    from rich.text import Text
    from rich.logging import RichHandler
    from rich.progress import TaskID, Progress
except ImportError as e:
    _import_err(e)

CONSOLE = Console()

LOG = logging.getLogger("rich")
logging.basicConfig(
    level="INFO",
    format="%(message)s",
    datefmt="[%X]",
    handlers=[RichHandler(console=CONSOLE, rich_tracebacks=True)],
)


DEFAULT_TOOLS_PATH = "tools"

# good old revo zip (https://cdn.discordapp.com/attachments/727918646525165659/1129759991696457728/GC_WII_COMPILERS.zip) rehosted on my s3
MWCC_PACK_URI = "https://dol-rvl-toolchains.s3.amazonaws.com/GC_WII_COMPILERS.zip"
TOOLCHAINS_URI = "https://dol-rvl-toolchains.s3.amazonaws.com"
KURIBO_LLVM_VER = "377c67cd575495a2f818733e42b4913c4b365d65"
ELF2REL_VER = "b44c71434a68489061ab2550166f354a58faff14"


def system_arch() -> str:
    """canonicalize host processor architecture"""
    arch = platform.machine()
    if arch == "x86_64":
        return "x86_64"
    elif arch == "arm64":
        return "aarch64"
    else:
        LOG.error(f"unsupported architecture {arch}")
        sys.exit(1)


def target_triple() -> str:
    arch = system_arch()
    system = platform.system()
    if system == "Darwin":
        return f"{arch}-apple-darwin"
    elif system == "Linux":
        return f"{arch}-unknown-linux"
    elif system == "Windows":
        return f"{arch}-pc-windows-msvc"


def download_url(progress: Progress, task_id: TaskID, url: str, dest_file: BinaryIO):
    LOG.debug(f"downloading {url}")
    response = urllib.request.urlopen(url)
    # nb: breaks if the response doesn't contain Content-Length
    progress.update(task_id, total=int(response.info()["Content-Length"]))
    progress.start_task(task_id)
    for data in iter(partial(response.read, 32768), b""):
        dest_file.write(data)
        progress.update(task_id, advance=len(data))

    LOG.debug("downloaded {path}")


@click.group()
def cli():
    """Tools to build Brawlback's code patches."""
    pass


@cli.command()
@click.option("--redownload/--no-redownload")
def setup(redownload: bool):
    """Set up build dependencies and fetch necessary tools."""
    tools_path = Path(DEFAULT_TOOLS_PATH)
    if not tools_path.exists() or not tools_path.is_dir():
        LOG.error(f"tools directory ({tools_path}) is missing")
        sys.exit(1)

    mwcc_dir = tools_path / "mwcc"
    kuribo_dir = tools_path / "llvm"
    elf2rel = tools_path / "elf2rel"
    if redownload:
        shutil.rmtree(mwcc_dir)
        shutil.rmtree(kuribo_dir)
        elf2rel.unlink(missing_ok=True)

    host_arch = target_triple()

    CONSOLE.print("--- downloading toolchain manifest", style="magenta")
    r = requests.get(f"{TOOLCHAINS_URI}/toolchains.json")
    toolchains_manifest = r.json()

    CONSOLE.print("--- fetching MWCC toolchain", style="magenta")

    if not mwcc_dir.exists() or not mwcc_dir.is_dir():
        mwcc_dir.mkdir()

        r = requests.get(MWCC_PACK_URI)
        z = zipfile.ZipFile(io.BytesIO(r.content))
        z.extractall(mwcc_dir)

    CONSOLE.print("--- fetching llvm toolchain", style="magenta")
    if not kuribo_dir.exists() or not kuribo_dir.is_dir():
        if not (kuribo_vers := toolchains_manifest.get("kuribo-llvm")):
            LOG.error("toolchain mirror missing kuribo-llvm")
            sys.exit(1)

        if not (kuribo_arches := kuribo_vers.get(KURIBO_LLVM_VER)):
            LOG.error(
                f"toolchain mirror missing required kuribo-llvm version {KURIBO_LLVM_VER}"
            )
            sys.exit(1)

        if not (kuribo_uri := kuribo_arches.get(host_arch)):
            LOG.error(
                f"toolchain mirror missing a kuribo-llvm build for your computer's architecture ({host_arch})"
            )
            sys.exit(1)

        LOG.info(f"found required kuribo-llvm toolchain ({kuribo_uri})")
        with Progress() as progress:
            with tempfile.TemporaryFile() as df:
                download_url(
                    progress,
                    progress.add_task("downloading kuribo-llvm"),
                    f"{TOOLCHAINS_URI}/{kuribo_uri}",
                    df,
                )
                df.seek(0)

                tf = tarfile.open(fileobj=df)
                members = tf.getmembers()
                decompress_task = progress.add_task(
                    "decompressing kuribo-llvm archive", total=len(members)
                )
                for member in members:
                    # strip off wrapping
                    member.name = "/".join(member.name.split("/")[1:])
                    tf.extract(member, path=kuribo_dir)
                    progress.update(decompress_task, advance=1)

    CONSOLE.print("--- fetching elf2rel", style="magenta")
    if not elf2rel.exists() or not elf2rel.is_file():
        if not (elf2rel_vers := toolchains_manifest.get("sammihusky-elf2rel")):
            LOG.error("toolchain mirror missing Sammi-Husky elf2rel")
            sys.exit(1)

        if not (elf2rel_arches := elf2rel_vers.get(ELF2REL_VER)):
            LOG.error(
                f"toolchain mirror missing required elf2rel version {ELF2REL_VER}"
            )
            sys.exit(1)

        if not (elf2rel_uri := elf2rel_arches.get(host_arch)):
            LOG.error(
                f"toolchain mirror missing an elf2rel build for your computer's architecture ({host_arch})"
            )
            sys.exit(1)

        LOG.info(f"found elf2rel binary ({elf2rel_uri})")
        with Progress() as progress:
            with open(elf2rel, "wb") as f:
                download_url(
                    progress,
                    progress.add_task("downloading elf2rel"),
                    f"{TOOLCHAINS_URI}/{elf2rel_uri}",
                    f,
                )

        if os.name == "posix":
            LOG.info("fixing up elf2rel permissions")
            elf2rel.chmod(elf2rel.stat().st_mode | stat.S_IEXEC)


if __name__ == "__main__":
    cli()
