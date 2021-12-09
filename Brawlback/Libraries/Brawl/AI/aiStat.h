//
// Created by dareb on 8/5/2020.
//

#ifndef PROJECTMCODES_AISTAT_H
#define PROJECTMCODES_AISTAT_H


#include <Brawl/AI/aiInput.h>

struct aiInput;
struct aiStat {
    double calcArrivePosX(double time);
    double calcArrivePosY(double time);

    char _spacer[0x4C];

    // 0x4C
    aiInput * input;
    char _spacer2[0xAC - 0x4C - 4];

    // 0xAC
    int opponentCharacter;
};

#define _calcArraivePosX_aiStat ((double (*)(double time, aiStat * stat)) 0x80916884)
#define _calcArraivePosY_aiStat ((double (*)(double time, aiStat * stat)) 0x809168c8)

#endif //PROJECTMCODES_AISTAT_H
