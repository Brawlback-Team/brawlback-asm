//
// Created by johno on 7/17/2020.
//

#ifndef PROJECTMCODES_IPHUMAN_H
#define PROJECTMCODES_IPHUMAN_H

#include "stddef.h"


struct IpHuman {
    //0x0
    //0 based, + 0x10 if replay
    int playerNum;

    char _spacer[0x10 - 4];
    //0x10
    float stickX;
    //0x14
    float stickY;
};


#endif //PROJECTMCODES_IPHUMAN_H
