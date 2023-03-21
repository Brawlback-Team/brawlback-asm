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
#include <Brawl/GF/GameGlobal.h>
#include "Brawl/gmGlobalModeMelee.h"
#include "Brawl/GF/gfApplication.h"
#include "Brawl/SC/scMelee.h"
#include "Wii/mtRand.h"
#include "Wii/OS/OSTime.h"
#include "EXIPacket.h"
#include "Utility/Utility.h"
#include "brawlback-common/ExiStructures.h"


//  toggles for netplay logic and rollback logic
#if 1
#define NETPLAY_IMPL
#define ROLLBACK_IMPL
#endif
// ^ if you disable rollbacks, make sure to also disable the ROLLBACK_IMPL flag in BrawlbackUtility.cpp on the dolphin side
// ------------------------------------

//#define ROLLBACK_TESTING
 

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

#define getGamePadStatus (( int (*) (gfPadSystem* pad_system, int port, gfPadGamecube* dst) ) 0x8002ac54)
#define getPadInput ( ( void (*) (void* pad_config, u32 playerIdx, gfPadGamecube* current_inputs, u32* pad_status) ) 0x8004a468)
#define getPadCofigInstance ( (void* (*) ()) 0x80048548)
#define getIpSwitchInstance ( (void* (*) ()) 0x8004a750)

#define setPause ( ( void (*) (gfApplication* application, bool isPaused, int unk) ) 0x80016900)

#define getRankftManager ( ( int (*) (void* ftmanager, u32 idx) ) 0x80815b2c)
#define getRankftEntry ( ( u8 (*) (ftEntry* ftentry) ) 0x8081fd70)

// dump Heap Infos
#define dumpAll ( (void (*) ()) 0x80024a50)
#define dumpList ( (void (*) ()) 0x80024b08)
#define dump ( ( void (*) (void* heap) ) 0x800260b4)

inline void updateGamePadSystem() { updateGame(PAD_SYSTEM); }

u32 getCurrentFrame();

void fillOutGameSettings(GameSettings& settings);
void MergeGameSettingsIntoGame(GameSettings& settings);
extern bool canRollback;
extern u32 frameCounter;
extern bool shouldTrackAllocs;
extern bool doDumpList;
namespace FrameLogic {
    void SaveState(u32 frame);
    void GetInputsForFrame(u32 frame, FrameData* inputs);
    void FixFrameDataEndianness(FrameData* fd);
}
namespace FrameAdvance {
    u32 getFramesToAdvance();
}

// TODO: put this in the submodule and pack it
struct GameReport {
    f64 damage[MAX_NUM_PLAYERS];
    s32 stocks[MAX_NUM_PLAYERS];
    s32 frame_duration;
};

#endif