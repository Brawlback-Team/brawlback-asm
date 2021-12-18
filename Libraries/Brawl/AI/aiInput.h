//
// Created by johno on 7/17/2020.
//

#ifndef PROJECTMCODES_FTINPUT_H
#define PROJECTMCODES_FTINPUT_H

#include "Brawl/IP/Inputs.h"
#include "Brawl/AI/aiScriptData.h"
#include "Brawl/AI/aiParam.h"
#include "Brawl/FT/ftEntry.h"

struct aiScriptData;
struct ftEntry;

// size: 0x274
struct aiInput {
    char _spacer[0x0D];

    //0xD
    Inputs buttons;

    // 0x10
    float leftStickX;
    float leftStickY;
    char _spacer3[0x2C - 0x18];

    // 0x2C
    int fighterId;
    // 0x30
    int charId;
    // 0x34
    aiInput* childAi;

    char _spacer4[0x40 - 0x34 - 4];
    // 0x40
    char swingChkByte1;
    // 0x41
    char swingChkByte2;
    // 0x42
    char cpuIdx;
    char _spacer5[0x44 - 0x42 - 1];

    // 0x44
    aiScriptData* aiActPtr;

    // 0x48
    int aiMd;
    char _spacer6[0x58 - 0x48 - 4];

    // 0x58
    short aiThing;
    char _spacer7[0x84 - 0x58 - 2];

    // 0x84
    int aiItemTarget;

    char _spacer8[0x90 - 0x84 - 4];
    // 0x90
    aiParam aiParamPtr;

    char _spacer9[0x110 - 0x90 - sizeof(aiParam)];
    // 0x110
    char aiTarget;
    char _spacer10[0x144 - 0x110 - 1];

    // 0x144
    ftEntry* ftEntryPtr;
};


static_assert(sizeof(aiInput) == 0x148);

#endif //PROJECTMCODES_FTINPUT_H
