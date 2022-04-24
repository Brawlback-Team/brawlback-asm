//
// Created by johno on 7/2/2020.
//

#ifndef PROJECTMCODES_IPSWITCH_H
#define PROJECTMCODES_IPSWITCH_H


#include "Inputs.h"


struct IpSwitch {
    struct padStatus {
        Inputs input;
        //negative = left, positive = right
        char stickX;
        //negative = down, positive = up
        char stickY;
    };

    char _spacer[8];
    //8
    padStatus pads[4];
    char _spacer2[0x1C - 0x18];
    //0x1C
    int pauseFlag;
    //0x20
    //this needs to be set for shadows to appear
    //probably other stuff too
    int gameFlag;

    //0x24
    //not sure how these work exactly
    u32 controllerFLags;
};

#define IP_SWITCH ((IpSwitch* const) 0x805bc060)


#endif //PROJECTMCODES_IPSWITCH_H
