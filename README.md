# Brawlback ASM
Syriinge plugin for both online and offline Brawlback experiences.

# Requirements
* This repo. Remember to pull with recursive submodules.
* Syriinge module (follow the README instructions [here](https://github.com/Sammi-Husky/Syriinge)).
* A compiler compatible with Syriinge plugins, preferably the Clang fork found [here](https://github.com/DotKuribo/llvm-project).

# Instructions
1. Place the compiler in tools/MWCC4_2, or some other folder and specify the folder in the makefile.
2. Enter the root of this repo and enter the command `make` into your terminal of choice.
3. Place the modules created into pf/plugins.
4. Place the Syriinge module into pf/module.

# Acknowledgements
DukeItOut for GCTRM

[Sammi Huski](https://github.com/Sammi-Husky) for Syriinge and [fudgepop01](https://github.com/Fracture17/ProjectMCodes/tree/master/Codes/SuperTraining) for tutorials and great code examples

Everyone involved with BrawlHeaders, as well as open_rvl for their header implementations

The PMDT and P+DT as well as all those who have contributed code in the Project+ Source