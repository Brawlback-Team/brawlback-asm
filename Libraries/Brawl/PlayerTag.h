//
// Created by johno on 6/24/2020.
//

#ifndef CSSCUSTOMCONTROLS_PLAYERTAG_H
#define CSSCUSTOMCONTROLS_PLAYERTAG_H

//size is 0x124
struct PlayerTag {
    //name is in UTF-16
    //0x0
    char name[0xC];
    //0xC
    bool rumble;

    char _spacer[0x10 - 0xD];
    //0x10
    unsigned int creationTime;
    //0x14
    char GCSettings[0xC];

    char _spacer2[0x124 - 0x20];
};


#endif //CSSCUSTOMCONTROLS_PLAYERTAG_H
