
#ifndef PROJECTMCODES_AIWEAPONMGR_H
#define PROJECTMCODES_AIWEAPONMGR_H

#include "Brawl/IT/BaseItem.h"
#include "../Weapon.h"

struct Weapon;

// size: 0x64
struct aiWeaponManagerEntry {
    // increments once for each article/item spawned throughout the match
    // 0x0
    int itemNo;
    // 0x4
    itemIdName id;
    // 0x6
    // 0x7B = article
    // 0x1B = 
    // 0x00 = someone holding it
    short source;

    // 0x7
    // 0 = oArticle
    // 1 = thrown item
    // 4 = pickup item
    char type;
    // when this 0 it resets to 0x10
    // it will copy 1Cycle positions to 2Cycle and 
    // copy current positions to 1Cycle positions
    // 0x8
    char cycleTimer;
    // 0xC
    int unk1;

    // 0x10
    float xPos2Cycle;
    // 0x14
    float yPos2Cycle;
    // 0x18
    float zPos2Cycle;

    // 0x1C
    float xPos1Cycle;
    // 0x20
    float yPos1Cycle;
    // 0x24
    float zPos1Cycle;

    // 0x28
    float xPos;
    // 0x2C
    float yPos;
    // 0x30
    float zPos;

    char spacer2[0x58 - 0x30 - 4];
    
    // how long the weapon has been active
    // 0x58
    int framesAlive;

    char spacer_size[0x64 - 0x58 - 4];
};

// size: 0x1920
struct aiWeaponManager {
    aiWeaponManagerEntry entries[0x1920 / sizeof(aiWeaponManagerEntry)];
};

#endif //PROJECTMCODES_AIWEAPONMGR_H