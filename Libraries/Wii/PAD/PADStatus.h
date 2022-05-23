//
// Created by johno on 7/3/2020.
//

#ifndef PROJECTMCODES_PADSTATUS_H
#define PROJECTMCODES_PADSTATUS_H


#include "../../../Globals/stdtypes.h"
#include "PADButtons.h"

struct PADStatus {
    PADButtons button;
    s8  stickX;
    s8  stickY;
    s8  substickX;
    s8  substickY;
    u8  triggerLeft;
    u8  triggerRight;
    u8  analogA;
    u8  analogB;
    s8  err;
}__attribute__((packed, aligned(2)));


#define PAD_ERR_NONE            0
#define PAD_ERR_NO_CONTROLLER   -1
#define PAD_ERR_NOT_READY       -2
#define PAD_ERR_TRANSFER        -3


//array of 4
#define PREVIOUS_PADS ((PADStatus*) 0x804f67b0)

#endif //PROJECTMCODES_PADSTATUS_H
