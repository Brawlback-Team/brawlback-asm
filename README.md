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
