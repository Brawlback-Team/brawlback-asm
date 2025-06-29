# Brawlback ASM
Syriinge plugin for both online and offline Brawlback experiences.

# Requirements
* This repo. Remember to pull with recursive submodules.
* GCTRealMate. Can be retrieved from the P+ files.

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
3. Create an SD.raw file using [Dolphin](https://dolphin-emu.org/docs/guides/virtual-sd-card-guide/#Creating_a_Virtual_SD_Card).
4. Put a folder vBrawl into the root of the SD card. Nest within this folder some folders: \<SD root\>/pf/plugins, \<SD root\>/pf/module, and \<SD root\>/Source. Optionally, place any number of files from the \<ISO root>\/DATA/files folder into the pf folder (this will improve load times).
5. Place the Brawlback module (`Brawlback-Online.rel`) into pf/plugins.
6. Place the syriinge core module (`sy_core.rel`) into pf/module.
7. Place GCTRealMate and RSBE01.txt into the \<SD root>\
6. Place Hooktype.asm, FilePatchCode.asm, BrawlbackUtils.asm, and Syringe.asm in \<SD root\>/Source and drag RSBE01.txt on top of GCTRealMate to rebuild the GCT file (or run `GCTRealMate RSBE01.txt` or equivalent).
8. Sync ("Convert Folder to File Now") the virtual SD card.
9. Launch the game using the BrawlbackLauncher.elf.

# Acknowledgements
- DukeItOut for GCTRM
- [Sammi Husky](https://github.com/Sammi-Husky) for Syringe and [fudgepop01](https://github.com/Fracture17/ProjectMCodes/tree/master/Codes/SuperTraining) for tutorials and great code examples
- Everyone involved with BrawlHeaders, as well as open_rvl for their header implementations
- The PMDT and P+DT teams, as well as all those who have contributed code to Project+.
