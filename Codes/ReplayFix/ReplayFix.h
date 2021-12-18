//
// Created by johno on 7/1/2020.
//

#ifndef PROJECTMCODES_REPLAYFIX_H
#define PROJECTMCODES_REPLAYFIX_H


#include "Record.h"
#include "Play.h"

#include "ReplayEvent.h"
#include "Assembly.h"
#include "Memory.h"
#include "Brawl/FT/ftManager.h"
#include "Wii/mtRand.h"
#include "Debug.h"
#include "Wii/OS/OSTime.h"
#include "CLibs/cstring.h"
#include "Brawl/SC/scMelee.h"
#include "Brawl/GF/gfFileIOHandle.h"
#include "Brawl/GF/gfCollectionIO.h"
#include "Brawl/GF/gfMemoryPool.h"

//#include "Tests/test_ReplayFix.cpp"

//#define REPLAY_BUFFER_START ((u8*) 0x91301c00)

#define REPLAY_MENU_INSTANCE_MEMORY_POOL ((gfMemoryPool*) 0x92e90100)

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

#endif //PROJECTMCODES_REPLAYFIX_H
