//
// Created by johno on 7/1/2020.
//

#ifndef PROJECTMCODES_SOCONTROLLERIMPL_H
#define PROJECTMCODES_SOCONTROLLERIMPL_H


#include "../IP/Inputs.h"

//An array of these is created when the soControllerModule is constructed
//Ike has 10, but only seems to use 1?
struct soControllerImpl {
    char _spacer[8];
    //0x8
    float stickX;
    //0xC
    float stickY;
    char _spacer2[0x46 - 0x10];
    //0x46
    Inputs inputs;
    char _spacer3[2];
    //0x4A
    Inputs prevInputs;
};


#endif //PROJECTMCODES_SOCONTROLLERIMPL_H
