# Brawl Rollback ASM
Repo for Building the GCT and Virtual SD Card (sd.raw) Needed for Brawl Rollback

This repo comes with both a vBrawl and Project+ code setup and uses DukeItOut's GCTRM to assemble ASM files into a GCT and Bird's MakeSD to assemble the sd.raw used to load files such as codes and modified assets.

(it will soon also incorporate Fracture's C++ framework setup)

ASM source is found in *Build/GCTRM*. The ASM used in each setup is defined in a RSBE01.txt and a BOOST.txt (for extra codes that don't fit the RSBE01.txt).

## Setup

This build does not come with Project+ assets, it only includes the Project+ source code. You will have to extract the pf folder from the Project+ download and place it in *Build/Project+*.

Set SD_CARD_PATH in *MakeSD/Config.ini* to the path of the sd.raw used by your configuration of Dolphin

## Build and Run

To assemble the ASM for both Brawl and Project+ as well as make the sd.raw, run *CreateSD.bat*. 

Then using Dolphin, launch using one of the relevant launchers in the *Launchers* folder (make sure Brawl is set as the default ISO and insert SD card is checked in Config->Wii)

## ASM Tutorials

To learn PowerPC ASM, see: https://mariokartwii.com/showthread.php?tid=1114 <br />

As well as https://github.com/WhiteTPoison5/brawlback-wiki for more resources

## Acknowledgements

Credit to jlambert360 (Bird) and Syvkal for MakeSD

DukeItOut for GCTRM

The PMDT and P+DT as well as all those who have contributed code in the Project+ Source


