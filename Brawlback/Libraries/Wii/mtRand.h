//
// Created by johno on 7/22/2020.
//

#ifndef PROJECTMCODES_MTRAND_H
#define PROJECTMCODES_MTRAND_H


#include "stddef.h"

//pretty sure mt stands for math
struct mtRand {


    char _spacer[4];

    //4
    u32 seed;
};


//This is used when calling the default random functions
#define DEFAULT_MT_RAND ((mtRand*) 0x805a00b8)
//This is another mtRand object that exists for some reason
#define OTHER_MT_RAND ((mtRand*) 0x805a0420)


#endif //PROJECTMCODES_MTRAND_H
