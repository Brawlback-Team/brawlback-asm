//
// Created by johno on 9/24/2020.
//

#ifndef PROJECTMCODES_PLAY_H
#define PROJECTMCODES_PLAY_H

#include <Brawl/MU/muReplayTask.h>
#include "ReplayPlayer.h"
#include "Wii/mtRand.h"
#include "Debug.h"
#include "Brawl/GF/gfPadSystem.h"
#include "Brawl/GF/GameFrame.h"
#include "PlaybackFileSyncer.h"
#include "Brawl/IP/ipSwitch.h"
#include "Brawl/GF/gfFileIOManager.h"



void playGameStart();


void playFileLoad(gfFileIORequest* fileIoRequest);


bool playFrameStart();


void startPlayback();

void stopPlayback();


void playFighters();

void setGameInfoForReplay(muReplayTask& replayTask);

#define REPLAY_BUFFER_START ((u8*) 0x91301c00)

#endif //PROJECTMCODES_PLAY_H
