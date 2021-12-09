//
// Created by johno on 10/29/2020.
//

#ifndef PROJECTMCODES_STAGEINFO_H
#define PROJECTMCODES_STAGEINFO_H

#include "stddef.h"
#include "Wii/PAD/PADButtons.h"


struct StageInfo {
    u8 stageID;
    PADButtons buttons;
    u8 groupID;
}__attribute__((packed));

static_assert(sizeof(StageInfo) == 4, "StageInfo is wrong size");

#endif //PROJECTMCODES_STAGEINFO_H
