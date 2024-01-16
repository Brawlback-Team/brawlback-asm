//
// Created by johno on 7/2/2020.
//

#ifndef PROJECTMCODES_GMGLOBALMODEMELEE_H
#define PROJECTMCODES_GMGLOBALMODEMELEE_H

#include "stdtypes.h"

struct gmPlayerData {
    u8 slotID;          // [0x98] Supposedly? (slotID)       
    u8 playerType;      // [0x99] 00 = human, 02 = CPU, Disconnected = 03
    char _sp1[0x8];
    u8 startPoint;
    char _sp2[0x33];
    u8 unk1;            // [0xD5] 0x3C has paused enabled?
    u8 unk2;            // [0xD6] player order/standing?

    char _sp3[0x5C - sizeof(slotID) - sizeof(playerType) - 0x8 - sizeof(startPoint) - 0x33 - sizeof(unk1) - sizeof(unk2)];
}__attribute__((packed, aligned(2)));
static_assert(sizeof(gmPlayerData) == 0x5C, "gmPlayerData has incorrect size");


struct gmGlobalModeMelee {
    char _spacer[0x1B];

    u8 stageID;             // 0x1B
    char _sp2[0x7C];
    gmPlayerData playerData[4];

    char _spacer2[0x320 - 0x1B - sizeof(stageID) - 0x7C - (sizeof(gmPlayerData)*4)];
}__attribute__((packed, aligned(2)));
static_assert(sizeof(gmGlobalModeMelee) == 0x320, "gmGlobalModeMelee has incorrect size");

//153 0x99
//245 0xF5 
//337 0x151
//429 0x1AD

// 213 0xD5
// 305 0x131
// 391 0x18D
// 489 0x1E9



#define GM_GLOBAL_MODE_MELEE ((gmGlobalModeMelee*) 0x90180f20)


#endif //PROJECTMCODES_GMGLOBALMODEMELEE_H