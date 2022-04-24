//
// Created by johno on 7/20/2020.
//

#ifndef PROJECTMCODES_IPPADCONFIG_H
#define PROJECTMCODES_IPPADCONFIG_H


#include "stddef.h"

//custom controls
struct ipPadConfig {
    char _spacer[0xB5];

    //0xFF if player does not exist or is AI
    //+ 0x10 if in replay
    //goes from 0 to 7, although after 4 seems to not be used (only checked versus though)
    u8 playerNum2PadNum[4];
};


#define IP_PAD_CONFIG ((ipPadConfig*) 0x805b7480)

#endif //PROJECTMCODES_IPPADCONFIG_H
