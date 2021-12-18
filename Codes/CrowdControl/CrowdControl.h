//
// Created by Ilir on 2021-12-13.
//

#ifndef PROJECTMCODES_CROWDCONTROL_H
#define PROJECTMCODES_CROWDCONTROL_H


#include "Assembly.h"
#include "Debug.h"
#include "Wii/EXI/EXI.h"
#include "Memory.h"
#include "Wii/PAD/PADStatus.h"
#include "Brawl/GF/GameFrame.h"

enum CCEffect
{
    EFFECT_NOT_CONNECTED = 0,
    EFFECT_NONE = 1,
    EFFECT_UNKNOWN = 2,
    EFFECT_KILL = 3,
    EFFECT_GIVE_STOCKS = 4,
    EFFECT_REMOVE_STOCKS = 5,
    EFFECT_SPAWN_ITEM_REGULAR = 6,
    EFFECT_SPAWN_ITEM_POKEMON = 7,
    EFFECT_SPAWN_ITEM_ASSIST = 8,
};

#endif //PROJECTMCODES_CROWDCONTROL_H
