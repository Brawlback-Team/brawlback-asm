//
// Created by johno on 6/5/2020.
//

#ifndef CSSCUSTOMCONTROLS_MUSELCTCHRLIST_H
#define CSSCUSTOMCONTROLS_MUSELCTCHRLIST_H


class MuSelctChrList {
public:
    char spacer1[0x44];
    //0x44
    //changes as soon as movement starts
    int listPosition;

    //0x48
    //waits until movement is finished to change
    int slowListPosition;

    char spacer2[0x50 - 0x4C];
    //0x50
    //PLAYER #
    //null terminated
    char playerStr[9];

    char _spacer5[0x60 - 0x59];

    //0x60
    //Not actually part of Brawl, I used it for maintaining menu state for old CSS controls
    //Now used to tell old codes if they should turn on or not
    bool inNormalTagMenu;

    char spacer3[0x6C - 0x61];
    //0x6C
    int listSize;
    //0x70
    //index in CSS list 2 index in true tag list
    short listIndex2TagIndex[120];

    char _spacer6[0x164 - 0x70 - 120 * 2];
    //0x164
    //array of tag indices selected by other ports
    //index of tag in tag array, not index in CSS menu
    //Does not include its own tag
    //-1 if no tag selected
    //in first come order, not adjusted when early tags are removed
    //automatically updated
    int otherSelectedTagIndices[4];
}__attribute__((packed, aligned(4)));


#endif //CSSCUSTOMCONTROLS_MUSELCTCHRLIST_H
