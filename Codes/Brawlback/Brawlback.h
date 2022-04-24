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



#define MAX_ROLLBACK_FRAMES 7
#define FRAME_DELAY 2

#define MAX_REMOTE_PLAYERS 3
#define MAX_NUM_PLAYERS 4


#define NAMETAG_SIZE 8
#define DISPLAY_NAME_SIZE 31
#define CONNECT_CODE_SIZE 10


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
}; //__attribute__((packed, aligned(4)));

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

struct RollbackInfo {
    bool isUsingPredictedInputs;
    u32 beginFrame; // frame we realized we have no remote inputs
    u32 endFrame; // frame we received new remote inputs, and should now resim with those
    FrameData predictedInputs;

    bool pastFrameDataPopulated;
    FrameData pastFrameDatas[MAX_ROLLBACK_FRAMES];

    bool hasPreserveBlocks;
    vector<PreserveBlock> preserveBlocks;
};

void fillOutGameSettings(GameSettings* settings);
void MergeGameSettingsIntoGame(GameSettings* settings);
namespace Match {
    bool IsInMatch();
}
namespace FrameLogic {
    void SaveState(u32 frame);
}
namespace FrameAdvance {
    int getFramesToAdvance();
}

#endif