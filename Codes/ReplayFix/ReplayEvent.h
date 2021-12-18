//
// Created by johno on 7/24/2020.
//

#ifndef PROJECTMCODES_REPLAYEVENT_H
#define PROJECTMCODES_REPLAYEVENT_H


#include <Wii/PAD/PADButtons.h>
#include "stddef.h"
#include "Brawl/gmGlobalModeMelee.h"


enum class ReplayEventID: u8 {
    gameStart = 0,
    frameStart = 1,
    preFrame = 2,
    frameEnd = 3,
    gameEnd = 4,
    load = 5
};


struct ReplayEvent {
    u16 size;
    ReplayEventID id;
};


struct ReplayFrameEndEvent: ReplayEvent {
    ReplayFrameEndEvent();
    u32 frameNum;
    u32 randSeed;
};


struct ReplayFrameStartEvent: ReplayEvent {
    ReplayFrameStartEvent();

    u32 frameNum;
    u32 randomSeed;
};


struct ReplayGameEndEvent: ReplayEvent {
    ReplayGameEndEvent();
};


struct ReplayGameStartEvent: ReplayEvent {
    ReplayGameStartEvent();

    gmGlobalModeMelee meleeInfo;
    u32 randSeed;
};


struct ReplayLoadEvent: ReplayEvent {
    ReplayLoadEvent();

    u16 loadHash;
};


struct ReplayPreFrameFighterEvent: ReplayEvent {
    ReplayPreFrameFighterEvent();

    //u32 frame;
    u8 port;
    //bool isSubFighter;
    PADButtons buttons;
    char stickX;
    char stickY;
    char cStickX;
    char cStickY;
    char LTrigger;
    char RTrigger;
};

#endif //PROJECTMCODES_REPLAYEVENT_H
