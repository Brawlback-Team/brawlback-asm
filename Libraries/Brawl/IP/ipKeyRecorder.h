//
// Created by johno on 11/2/2020.
//

#ifndef PROJECTMCODES_IPKEYRECORDER_H
#define PROJECTMCODES_IPKEYRECORDER_H


#include "Brawl/gmGlobalModeMelee.h"

//Thing in begining of replay files that has match setup info
struct ipKeyRecorder {
    const char MAGIC[4] = {'P', 'R', '0', '5'};
    

    //0x18
    gmGlobalModeMelee settings;
};


#define IP_KEY_RECORDER ((ipKeyRecorder*) 0x91301c00)


#endif //PROJECTMCODES_IPKEYRECORDER_H
