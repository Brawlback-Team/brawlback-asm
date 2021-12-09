//
// Created by dareb on 7/18/2020.
//

#ifndef PROJECTMCODES_AIACT_H
#define PROJECTMCODES_AIACT_H

#include "Brawl/AI/aiInput.h"
#include "aiStat.h"
#include "AICEPac.h"

struct aiInput;
struct AICEPac;
struct aiStat;
struct aiScriptData {
    // 0x00
    float variables[24];
    // 0x60
    AICEPac* AIScriptPac;
    
    // 0x64
    int* constPtr;

    // 0x68
    int* currentInstruction;

    char _spacer2[0x70 - 0x68 - 4];

    // 0x70
    aiInput* ftInputPtr;

    // 0x74
    aiStat* scriptValues;

    // 0x78
    unsigned short aiScript;
    // 0x7A
    unsigned short nextScript;
    // 0x7C
    unsigned short intermediateCurrentAiScript;
    // 0x7E
    unsigned short intermediateNextAiScript;
    char _spacer3[0xAC - 0x7E - 2];

    // 0xAC
    unsigned int framesSinceScriptChanged;
};



#endif //PROJECTMCODES_AIACT_H
