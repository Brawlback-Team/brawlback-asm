<<<<<<< HEAD
# Brawlback ASM
Syriinge plugin for both online and offline Brawlback experiences.

# Requirements
* This repo. Remember to pull with recursive submodules.

# Instructions
1. From the root of this repository, run
    ```
    $ python3 ./bbk.py setup
    ```
    (or whatever you need to run a python3.10 script).
    If it asks you to install dependencies with pip, just follow the instructions it gives you.

    This will retrieve:
    - copies of clang and lld built from the [kuribo-llvm fork](https://github.com/DotKuribo/llvm-project),
    - and [elf2rel](https://github.com/Sammi-Husky/elf2rel/) binaries.

2. Run `make`.
3. Place the Brawlback module (`Brawlback-Online.rel`) into pf/plugins.
4. Place the syriinge core module (`sy_core.rel`) into pf/module.
5. Place Loader.asm in \<mod root\>/Source, add the line `.include Source/Loader.asm` to \<mod root\>/RSBE01.txt, and drag that file on top of GCTRealMate.exe to rebuild the GCT file (or run `GCTRealMate RSBE01.txt` or equivalent).
6. Open Brawlback Dolphin and set the expanded memory for MEM2 to max.
7. Sync ("Convert Folder to File Now") the virtual SD card.
8. Launch the game using the mod launcher of your choice from step 5.

# Acknowledgements
- DukeItOut for GCTRM
- [Sammi Husky](https://github.com/Sammi-Husky) for Syriinge and [fudgepop01](https://github.com/Fracture17/ProjectMCodes/tree/master/Codes/SuperTraining) for tutorials and great code examples
- Everyone involved with BrawlHeaders, as well as open_rvl for their header implementations
- The PMDT and P+DT teams, as well as all those who have contributed code to Project+.
=======
# Brawl Rollback Codes
Repo for Building the C++ Binaries, GCT and Virtual SD Card (sd.raw) used for Brawl Rollback

This repo comes with both a vBrawl and Project+ code setup and uses Fracture's C++ framework to compile C++ codes, DukeItOut's GCTRM to assemble ASM files into a GCT and Bird's MakeSD to assemble the sd.raw used to load files such as codes and modified assets.

ASM source is found in *GCTRM*. The ASM used in each setup is defined in a RSBE01.txt and a BOOST.txt (for extra codes that don't fit the RSBE01.txt).

C++ Source is found in the *Codes* folder

## Setup

This build does not come with Project+ assets, it only includes the Project+ source code. You will have to extract the pf folder from the Project+ download and place it in *SDCard/Project+*.

Get submodule for EXI structures: `git submodule update --init --recursive`

### Install DevKitProdevkitPro (Linux)
For Windows we redistribute the devkitpro build tools in the BuildSystem/ folder of this repo. On other platforms, you must install the toolchain yourself.

Follow the installation instructions here: https://devkitpro.org/wiki/Getting_Started

You will want the following packages:

- devkitPPC
- wii-dev
- gamecube-dev

Using dkp-pacman the command will be `sudo dkp-pacman -S wii-dev gamecube-dev devkitppc` once dkp-pacman is installed.

## Build and Run

To compile the C++ codes, refer to https://github.com/Fracture17/ProjectMCodes/tree/master/notes/guides or https://www.youtube.com/watch?v=oGg2dgYN1Do

Then using Dolphin, make sure an SD Card \*.raw file is selected under *Settings->Wii->SD Card Path* and the *SDCard* folder is selected under *Settings->Wii->SD Sync Folder*.
Launch using one of the relevant launchers in the *Launchers* folder (make sure Brawl is set as the default ISO and insert SD card is checked in *Config->Wii*)

### Build on Linux from command line
```
# set DEVKITPPC environment variable to wherever your dev kit tools are installed (probably /opt/devkitpro/devkitPPC)
export DEVKITPPC=/opt/devkitpro/devkitPPC

# configure cmake with toolchain file
cmake -B build/ -S . -DCMAKE_TOOLCHAIN_FILE=./CMake/PPCToolchain.cmake -DBRAWLBACK=1
cmake --build build/
```

## ASM Tutorials

To learn PowerPC ASM, see: https://mariokartwii.com/showthread.php?tid=1114 <br />

As well as https://github.com/WhiteTPoison5/brawlback-wiki for more resources

## Acknowledgements

DukeItOut for GCTRM

[Fracture](https://github.com/Fracture17/ProjectMCodes) for the C++ Framework and [fudgepop01](https://github.com/Fracture17/ProjectMCodes/tree/master/Codes/SuperTraining) for tutorials and great code examples

Kapedani for decompiling and restructuring the build system Fracture built.

The PMDT and P+DT as well as all those who have contributed code in the Project+ Source


>>>>>>> origin/master
