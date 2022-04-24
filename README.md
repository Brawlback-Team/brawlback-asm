# Brawl Rollback Codes
Repo for Building the C++ Binaries, GCT and Virtual SD Card (sd.raw) used for Brawl Rollback

This repo comes with both a vBrawl and Project+ code setup and uses Fracture's C++ framework to compile C++ codes, DukeItOut's GCTRM to assemble ASM files into a GCT and Bird's MakeSD to assemble the sd.raw used to load files such as codes and modified assets.

ASM source is found in *GCTRM*. The ASM used in each setup is defined in a RSBE01.txt and a BOOST.txt (for extra codes that don't fit the RSBE01.txt).

C++ Source is found in the *Codes* folder

## Setup

This build does not come with Project+ assets, it only includes the Project+ source code. You will have to extract the pf folder from the Project+ download and place it in *SDCard/Project+*.

Duplicate the file located at `MakeSD/SAMPLE-Config.ini` and rename the copy to `Config.ini`

Set SD_CARD_PATH in `MakeSD/Config.ini` to the path of the sd.raw used by your configuration of Dolphin

Set CMAKE_BUILD_DIR in `MakeSD/Config.ini` to the path that cmake builds to (default should be `.\build\Output`)

## Build and Run

To compile the C++ codes, refer to https://github.com/Fracture17/ProjectMCodes/tree/master/notes/guides or https://www.youtube.com/watch?v=oGg2dgYN1Do

To assemble the ASM for both Brawl and Project+, copy the compiled C++ binaries as well as make the sd.raw, run *CreateSD.bat*.

Then using Dolphin, launch using one of the relevant launchers in the *Launchers* folder (make sure Brawl is set as the default ISO and insert SD card is checked in Config->Wii)

## ASM Tutorials

To learn PowerPC ASM, see: https://mariokartwii.com/showthread.php?tid=1114 <br />

As well as https://github.com/WhiteTPoison5/brawlback-wiki for more resources

## Acknowledgements

Credit to [Bird](https://github.com/jlambert360) and [Syvkal](http://forums.kc-mm.com/index.php?topic=79470) for MakeSD

DukeItOut for GCTRM

[Fracture](https://github.com/Fracture17/ProjectMCodes) for the C++ Framework and [fudgepop01](https://github.com/Fracture17/ProjectMCodes/tree/master/Codes/SuperTraining) for tutorials and great code examples

The PMDT and P+DT as well as all those who have contributed code in the Project+ Source


