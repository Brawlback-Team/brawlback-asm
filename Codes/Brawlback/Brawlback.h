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
#include "brawlback-exi-structures/ExiStructures.h"


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

struct PlayerSettingsImpl
{
    PlayerSettings _playerSettings;
};

struct GameSettingsImpl
{
    GameSettings _gameSettings;
};

struct PreserveBlockImpl
{
    PreserveBlock _preserveBlock;
};

struct BrawlbackPadImpl {
    BrawlbackPad _brawlbackPad;

    BrawlbackPadImpl()
    {
        _brawlbackPad.buttons = 0;
        _brawlbackPad.stickX = 0;
        _brawlbackPad.stickY = 0;
        _brawlbackPad.cStickX = 0;
        _brawlbackPad.cStickY = 0;
        _brawlbackPad.LTrigger = 0;
        _brawlbackPad.RTrigger = 0;
    }
};

struct PlayerFrameDataImpl {
    PlayerFrameData _playerFrameData;

    // do these impact the size of the struct?
    // wouldn't the vtable ptr screw with it being interpreted on gameside???
    // (since the gameside structs don't have these ctors)
    PlayerFrameDataImpl() {
        _playerFrameData.frame = 0;
        _playerFrameData.playerIdx = 0;
        _playerFrameData.pad = BrawlbackPadImpl()._brawlbackPad;
    }
    PlayerFrameDataImpl(u32 _frame, u8 _playerIdx)
    {
        _playerFrameData.frame = _frame;
        _playerFrameData.playerIdx = _playerIdx;
        _playerFrameData.pad = BrawlbackPadImpl()._brawlbackPad;
    }
};

struct FrameDataImpl {
    FrameData _frameData;

    FrameDataImpl()
    {
        _frameData.randomSeed = 0;
        for (int i = 0; i < MAX_NUM_PLAYERS; i++) {
            _frameData.playerFrameDatas[i] = PlayerFrameDataImpl()._playerFrameData;
        }
    }
    FrameDataImpl(u32 frame)
    {
        _frameData.randomSeed = 0;
        for (u8 i = 0; i < MAX_NUM_PLAYERS; i++) {
            _frameData.playerFrameDatas[i] = PlayerFrameDataImpl(frame, i)._playerFrameData;
        }
    }
};

struct RollbackInfoImpl {
    RollbackInfo _rollbackInfo;
    //vector<PreserveBlock> preserveBlocks;
};

void fillOutGameSettings(GameSettingsImpl* settings);
void MergeGameSettingsIntoGame(GameSettingsImpl* settings);

namespace FrameLogic {
    void SaveState(u32 frame);
}
namespace FrameAdvance {
    int getFramesToAdvance();
}

#endif