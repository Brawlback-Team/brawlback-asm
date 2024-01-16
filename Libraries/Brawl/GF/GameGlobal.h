//
// Created by johno on 6/24/2020.
//

#ifndef CSSCUSTOMCONTROLS_GAMEGLOBAL_H
#define CSSCUSTOMCONTROLS_GAMEGLOBAL_H

#include "../PlayerTagSystem.h"
#include "../gmGlobalModeMelee.h"
#include "GameFrame.h"


//has a bunch of pointers to stuff
struct GameGlobal {
    //0
    GameFrame* gameFrame;

    char _spacer[8 - 4];
    //0x8
    gmGlobalModeMelee* globalModeMelee;

    char _spacer2[0x18 - 0x8 - 4];
    void* gmResultInfo;

    //0x24
    //button setting thing

    // u8 spacer[offsetOfThisField - offsetOfPrevField - sizeOfPrevField]

    char _spacer3[0x28 - 0x18 - 4];
    //0x28
    PlayerTagSystem* playerTagSystem;
};



//array of 8 bools
//4 for GC, 4 for Wii
//Ptr path is GameGlobal + 0x24] + 0x820
//modified with get and setRumbleSetting
#define PORT_RUMBLE_SETTINGS ((bool*)(0x9017be60))

#define GAME_GLOBAL ((const GameGlobal*)(0x90181300))


#endif //CSSCUSTOMCONTROLS_GAMEGLOBAL_H
