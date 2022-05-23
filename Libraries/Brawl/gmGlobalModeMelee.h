//
// Created by johno on 7/2/2020.
//

#ifndef PROJECTMCODES_GMGLOBALMODEMELEE_H
#define PROJECTMCODES_GMGLOBALMODEMELEE_H

#include "stdtypes.h"

struct gmGlobalModeMelee {
    char _spacer[0x1B];

    u8 stageID;

    char _spacer2[0x320 - 0x1B - sizeof(stageID)];
}__attribute__((packed, aligned(2)));


static_assert(sizeof(gmGlobalModeMelee) == 0x320, "gmGlobalModeMelee has incorrect size");

#define GM_GLOBAL_MODE_MELEE ((gmGlobalModeMelee*) 0x90180f20)


#endif //PROJECTMCODES_GMGLOBALMODEMELEE_H
