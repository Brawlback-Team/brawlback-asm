//
// Created by johno on 6/25/2020.
//

#ifndef CSSCUSTOMCONTROLS_MUSELCHARPLAYERAREA_H
#define CSSCUSTOMCONTROLS_MUSELCHARPLAYERAREA_H


#include "MuSelctChrList.h"
#include "MuSelctChrNameEntry.h"

struct muSelCharPlayerArea {
    char _spacer[0x1C8];

    //0x1C8
    //index into tag array
    int currentTagIndex;

    char _spacer2[0x1FC - 0x1C8 - 4];

    //0x1FC
    MuSelctChrList muSelctChrList;

    //0x370
    MuSelctChrNameEntry muSelctChrNameEntry;

    void openNameList();
};

#define _openNameList ((void (*)(muSelCharPlayerArea* self)) 0x8069b340)



#endif //CSSCUSTOMCONTROLS_MUSELCHARPLAYERAREA_H
