//
// Created by dareb on 8/5/2020.
//

#ifndef PROJECTMCODES_FTENTRYMANAGER_H
#define PROJECTMCODES_FTENTRYMANAGER_H

struct ftEntryManager {
    // found @ 8082391c
    // 0x0
    // pointer to the arrayVector data
    ftEntry ftEntryArray[9];
    // 0x4
    // max capacity?
    int ftEntryCount;
    // 0x8
    void * vtable1;
    // 0xC
    void * vtable2;
};


#endif //PROJECTMCODES_FTENTRYMANAGER_H
