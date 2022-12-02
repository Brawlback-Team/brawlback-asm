//
// Created by dareb on 7/25/2020.
//

#ifndef PROJECTMCODES_FTOWNER_H
#define PROJECTMCODES_FTOWNER_H

#include "Brawl/AI/aiInput.h"
#include "Fighter.h"

struct staleMoveEntry {
    unsigned int num;
    unsigned int attack;
    unsigned int didConnect;
};

struct ftOwnerData {
    // 0x0
    int team;
    char _spacer[0x110 - 4];
    // 0x110
    int ftKind;
    char _spacer2[0xC40 - 0x110 - 4];

//    char _spacer2[0x9E8 - 0x110 - 4];
//
//    int* _moveset;
//    int currentMove
//
//    char _spacer3[0xC4C - 0x10C - 4];

    // 0xC40
    int currStaleQueueNum;
    char _spacer3[0xC50 - 0xC40 - 4];

    // 0xC50
    staleMoveEntry staleMoveQueue[9];
};

struct aiInput;
struct ftOwner {
    double getDamage();
    void setDamage(double newValue, int shouldLog);
    bool isCpu();
    int getStockCount();
    void setStockCount(int newValue);

    // 0x0
    ftOwnerData* ownerDataPtr;
    // 0x4
    aiInput* ftInputPtr;
};

#define _getDamage_ftOwner ((double (*)(ftOwner * owner)) 0x8081c264)
#define _setDamage_ftOwner ((void (*)(double newValue, ftOwner * owner, int shouldLog)) 0x8081bdcc)
#define _isOperationCpu_ftOwner ((bool (*)(ftOwner * self)) 0x8081bdb0)
#define _getStockCount_ftOwner ((int (*)(ftOwner * self)) 0x8081c540)
#define _setStockCount_ftOwner ((void (*)(ftOwner * self, int newValue)) 0x8081c528)
#endif //PROJECTMCODES_FTOWNER_H
