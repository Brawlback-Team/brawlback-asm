//
// Created by dareb on 8/8/2020.
//

#ifndef PROJECTMCODES_SOCOLORBLENDMODULE_H
#define PROJECTMCODES_SOCOLORBLENDMODULE_H

struct soColorBlendModule {
    char _spacer[0x14A];
    // 0x14A
    unsigned char red;
    unsigned char green;
    unsigned char blue;
    unsigned char alpha;
    char _spacer3;
    // 0x14F
    unsigned char isEnabled;
};


#endif //PROJECTMCODES_SOCOLORBLENDMODULE_H
