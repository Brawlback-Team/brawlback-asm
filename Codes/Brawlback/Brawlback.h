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


//  toggles for netplay logic and rollback logic
#define NETPLAY_IMPL
#define ROLLBACK_IMPL
// ^ if you disable rollbacks, make sure to also disable the ROLLBACK_IMPL flag in BrawlbackUtility.cpp on the dolphin side
// ------------------------------------

// make sure this is the same as the one in BrawlbackUtility.cpp on dolphin side
#define MAX_ROLLBACK_FRAMES 5

#define MAX_REMOTE_PLAYERS 3
#define MAX_NUM_PLAYERS 4


#define NAMETAG_SIZE 8
#define DISPLAY_NAME_SIZE 31
#define CONNECT_CODE_SIZE 10

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


enum PlayerType : u8
{
    PLAYERTYPE_LOCAL = 0x0,
    PLAYERTYPE_REMOTE = 0x1,
};

struct PlayerSettings
{
    u8 charID;
    u8 charColor;
    PlayerType playerType;
    u8 controllerPort;
    u16 nametag[NAMETAG_SIZE];
    u8 displayName[DISPLAY_NAME_SIZE];
    u8 connectCode[CONNECT_CODE_SIZE];
};

struct GameSettings
{
    u8 localPlayerIdx;
    u8 numPlayers;
    u16 stageID;
    u32 randomSeed;
    PlayerSettings playerSettings[MAX_NUM_PLAYERS];
};

struct PreserveBlock {
    u32 address;
    u32 length;
};

#pragma pack(push, 2)

struct BrawlbackPad {
    unsigned short buttons;
    char stickX;
    char stickY;
    char cStickX;
    char cStickY;
    char LTrigger;
    char RTrigger;

    BrawlbackPad() {
        buttons = 0;
        stickX = 0;
        stickY = 0;
        cStickX = 0;
        cStickY = 0;
        LTrigger = 0;
        RTrigger = 0;
    }
};
#pragma pack(pop)

#pragma pack(push, 4)

struct PlayerFrameData {
    u32 frame;
    u8 playerIdx;
    BrawlbackPad pad;

    PlayerFrameData() {
        frame = 0;
        playerIdx = 0;
        pad = BrawlbackPad();
    }
    PlayerFrameData(u32 frame, u8 playerIdx) {
        frame = frame;
        playerIdx = playerIdx;
        pad = BrawlbackPad();
    }
};

struct FrameData {
    u32 randomSeed;
    PlayerFrameData playerFrameDatas[MAX_NUM_PLAYERS];
    FrameData() {
        randomSeed = 0;
        for (int i = 0; i < MAX_NUM_PLAYERS; i++) {
            playerFrameDatas[i] = PlayerFrameData();
        }
    }
    FrameData(u32 frame) {
        randomSeed = 0;
        for (u8 i = 0; i < MAX_NUM_PLAYERS; i++) {
            playerFrameDatas[i] = PlayerFrameData(frame, i);
        }
    }
};

struct RollbackInfo {
    bool isUsingPredictedInputs;
    u32 beginFrame; // frame we realized we have no remote inputs
    u32 endFrame; // frame we received new remote inputs, and should now resim with those
    FrameData predictedInputs;

    bool pastFrameDataPopulated;
    FrameData pastFrameDatas[MAX_ROLLBACK_FRAMES];

    bool hasPreserveBlocks;
    //vector<PreserveBlock> preserveBlocks;
};

#pragma pack(pop)

void fillOutGameSettings(GameSettings* settings);
void MergeGameSettingsIntoGame(GameSettings* settings);

namespace FrameLogic {
    void SaveState(u32 frame);
}
namespace FrameAdvance {
    int getFramesToAdvance();
}

#endif