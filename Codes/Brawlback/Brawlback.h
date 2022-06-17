#ifndef __BRAWLBACK
#define __BRAWLBACK

#include "Assembly.h"
#include "Debug.h"
#include "Wii/EXI/EXI.h"
#include "Memory.h"

#include "Wii/OS/OSInterrupt.h"

#include "Wii/PAD/PADStatus.h"
#include "Brawl/GF/GameFrame.h"
#include "Brawl/GF/gfPadSystem.h"
#include "Brawl/FT/ftManager.h"
#include "Brawl/gmGlobalModeMelee.h"
#include "Wii/mtRand.h"
#include "Wii/OS/OSTime.h"
#include "EXIPacket.h"
#include "Utility/Utility.h"
#include "brawlback-common/ExiStructures.h"


//  toggles for netplay logic and rollback logic
#define NETPLAY_IMPL
#define ROLLBACK_IMPL
// ^ if you disable rollbacks, make sure to also disable the ROLLBACK_IMPL flag in BrawlbackUtility.cpp on the dolphin side
// ------------------------------------

// make sure this is the same as the one in BrawlbackUtility.cpp on dolphin side

#define MAX_REMOTE_PLAYERS 3

#define getGfSceneManager ((void* (*)()) 0x8002d018)
#define setNextSeq ((void (*)(void* gfSceneManager, const char* name, int unk)) 0x8002d640)
#define setNextScene ((void (*)(void* gfSceneManager, const char* name, int unk)) 0x8002d5ac)

#define changeNextScene ((void (*)(void* gfSceneManager)) 0x8002d020)
#define setupMelee ((void (*)(void* unk1, u32 unk2)) 0x806dce94)

// r3 - 0x90ff50a0
#define exitScMelee ((u32 (*)(void* unk1)) 0x806d483c)

// r3 - 0x90ff42e0
#define setNextSqVsMelee ((void (*)(void* unk1)) 0x806dcaf0)
// r3 - 0x90ff3e40
#define setNextSqNetAnyOkiraku ((void (*)(void* unk1)) 0x806f2320)

#define updateGame (( void (*)(gfPadSystem* pad_system) ) 0x8002a4f8)

inline void updateGamePadSystem() { updateGame(PAD_SYSTEM); }

u32 getCurrentFrame();

void fillOutGameSettings(GameSettings& settings);
void MergeGameSettingsIntoGame(GameSettings& settings);

namespace FrameLogic {
    void SaveState(u32 frame);
}
namespace FrameAdvance {
    int getFramesToAdvance();
}

#endif