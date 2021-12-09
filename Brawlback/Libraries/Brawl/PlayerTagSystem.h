//
// Created by johno on 6/24/2020.
//

#ifndef CSSCUSTOMCONTROLS_PLAYERTAGSYSTEM_H
#define CSSCUSTOMCONTROLS_PLAYERTAGSYSTEM_H


#include "PlayerTag.h"


struct PlayerTagSystem {
    char _spacer[0xE0];

    //0xE0
    PlayerTag tags[120];
};


#define PLAYER_TAG_SYSTEM ((PlayerTagSystem*)(0x90172d40))

#endif //CSSCUSTOMCONTROLS_PLAYERTAGSYSTEM_H
