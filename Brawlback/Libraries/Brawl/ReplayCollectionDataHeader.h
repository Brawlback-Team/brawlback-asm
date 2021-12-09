//
// Created by johno on 11/1/2020.
//

#ifndef PROJECTMCODES_REPLAYCOLLECTIONDATAHEADER_H
#define PROJECTMCODES_REPLAYCOLLECTIONDATAHEADER_H

#include <Wii/OSTime.h>

//My name, may also apply to other collection types
//This header goes before replay data, and must be correct or game will think replay is corrupted
//Used to set nteSection
//This is after it has been unencrypted
struct ReplayCollectionDataHeader {
    //0x0
    long long WiiID;
    //0x8
    OSTime time;
    //0x10
    //Use 0xDEADBEEF as this value when computing hash
    u32 CRC32Hash;
    //0x14
    //globalRumble | ((WiiDistubutionType << 5) & 0xFF)
    u8 setting;
    //0x15
    //2 for replays
    u8 dataType = 2;
    //0x16
    u8 stateType = 0;
    //0x17
    const u8 magic = 0xDB;
    //0x18
    //Data size before compression, not including this header
    size_t originalDataSize;
    //0x1C
    //Data size after compression, not including this header
    size_t compressedDataSize;
};

static_assert(sizeof(ReplayCollectionDataHeader) == 0x20, "ReplayCollectionDataHeader has incorrect size");

#endif //PROJECTMCODES_REPLAYCOLLECTIONDATAHEADER_H
