//
// Created by johno on 7/2/2020.
//

#ifndef PROJECTMCODES_MUCOLLECTION_H
#define PROJECTMCODES_MUCOLLECTION_H


//Seems to also be refered to as "Resource"
struct muCollection {
    char _spacer[0x1D10];

    //0x1D10
    //usually -1, set to 0 when loading replay or it will just hang
    //not sure if used for anything else
    u32 startReplayFlag;
};


#endif //PROJECTMCODES_MUCOLLECTION_H
