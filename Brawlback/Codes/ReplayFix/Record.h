//
// Created by johno on 9/24/2020.
//

#ifndef PROJECTMCODES_RECORD_H
#define PROJECTMCODES_RECORD_H

#include "ReplayEvent.h"
#include "Assembly.h"
#include "Memory.h"
//#include "AsyncFileIO.h"
#include "Brawl/FT/ftManager.h"
#include "Wii/mtRand.h"
#include "Debug.h"
#include "Brawl/GF/gfFileIORequest.h"

#include "Tests/test_ReplayFix.h"

#include "ReplayRecorder.h"
#include "Wii/Compression.h"
#include "Brawl/GF/gfCryptoESP.h"


void recordGameStart(char* recordReplayPath);


void recordMeleeInfo();

void recordLoadEvent(gfFileIORequest* fileIoRequest);


void recordFrameEnd();

void recordFrameStart();

void startRecording();


void stopRecording();


void recordFighterInfo();

#define REPLAY_BUFFER_START ((u8*) 0x91301c00)


#include "Assembly.h"
#include "Brawl/SO/soModuleAccessor.h"
#include "Brawl/FT/ftControllerModuleImpl.h"
#include "Wii/FILE/SD.h"
#include "Brawl/gmGlobalModeMelee.h"
#include "Memory.h"
#include "Brawl/MU/muReplayTask.h"
#include "CLibs/cstring.h"
#include "Brawl/GF/gfFileIO.h"
#include "Brawl/IP/ipSwitch.h"
#include "Wii/PAD/PADStatus.h"
#include "Brawl/GF/gfPadSystem.h"
#include "Brawl/GF/GameGlobal.h"
#include "Brawl/GF/gfApplication.h"
#include "Wii/OS/OSError.h"
#include "Wii/OS/OSThread.h"
#include "Brawl/GF/gfFileIOHandle.h"

#endif //PROJECTMCODES_RECORD_H
