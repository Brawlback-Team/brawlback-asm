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
4. Create the *.GCT files by dragging BRAWLBACK-ONLINE.txt and BRAWLBACK-ONLINE-DEV.txt onto GCTRealMate and placing the GCT files at the root of the sd-card folder.
5. Copy the files from the sd-card folder into the SD card, with the folder vBrawl at its root. Optionally, place any number of files from the \<ISO root>\/DATA/files folder into the pf folder (this will improve load times).
6. Sync ("Convert Folder to File Now") the virtual SD card.
7. Launch the game in dev mode using the BRAWLBACK-ONLINE-DEV.elf, and otherwise with BRAWLBACK-ONLINE.elf.

# Differences between DEV launcher and normal launcher
The BRAWLBACK-ONLINE-DEV launcher simply launches the BRAWLBACK-ONLINE-DEV.gct file from the SD card, rather than the other gct file. This gct file includes all codes in BrawlbackDevEnv.asm.

# Acknowledgements
- DukeItOut for GCTRM
- [Sammi Husky](https://github.com/Sammi-Husky) for Syringe and [fudgepop01](https://github.com/Fracture17/ProjectMCodes/tree/master/Codes/SuperTraining) for tutorials and great code examples
- Everyone involved with BrawlHeaders, as well as open_rvl for their header implementations
- The PMDT and P+DT teams, as well as all those who have contributed code to Project+.
- Everyone listed in the *.asm files for their contributions related to gecko codes for this project.
