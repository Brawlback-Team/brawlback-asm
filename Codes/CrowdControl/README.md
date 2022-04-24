# Crowd Control

This WIP project is designed to interact with the [Crowd Control](https://crowdcontrol.live/) Twitch extension which allows 
viewers to affect the game in exchange for channel points or bits.

[Demo](https://streamable.com/6mkjce)

## Setup for Developing

Follow the root of this repo for instructions on how to build.

Please use the included Dolphin ([Source](https://github.com/ilazoja/dolphin) in case needs to be modified or built for
other platforms) as it is used to communicate with the game as well as interact with Crowd Control.

Download the [Crowd Control SDK](https://forum.warp.world/t/how-to-setup-and-use-the-crowd-control-sdk/5121) and 
load the PPlusCrowdControl.cs to test effects.

## Make Your Own Effects

Adding your own effects is easy! Just need to setup a new effect in PPlusCrowdControl.cs and then handle the effect
in CrowdControl.cpp.

## Acknowledgements

[FaultyPine](https://github.com/FaultyPine/brawlback-asm) for sending/receiving data to/from Dolphin using Exi

[fudgepop01](https://github.com/Fracture17/ProjectMCodes/tree/master/Codes/SuperTraining) for the item spawning code
