//
// Created by johno on 11/1/2020.
//

#ifndef PROJECTMCODES_GFCOLLECTIONIO_H
#define PROJECTMCODES_GFCOLLECTIONIO_H

#include "gfFileIOHandle.h"


//I think this is also a gfTask
struct gfCollectionIO {
    //0x44
    //Also seems to be gfFileIOHandle?
    //The source ptr is copied to data
    //Used to get name of replays

    //0x48
    //Another gfFileIOHandle

    //0x50
    //gfMemoryPool index
    //equals 0x2B (43: MenuRsource) for replays
    //Used in readRequest as the pool to allocate from

    char _spacer[0x58];
    //0x58
    gfFileIOHandle handle;
    //0x5C
    //byte, seems to be is finished flag? 0 if not finished

    char _spacer2[0x60 - 0x58 - sizeof(handle)];

    //0x60
    //seems to be _proccessSummary error code.  Defaults to -1, 0 if no errors
    int summaryErrorCode;

    char _spacer3[0xE4 - 0x60 - sizeof(summaryErrorCode)];

    //0xE4
    void* data;
    //0xE8
    size_t dataSize;
    //0xEC
    //Not sure exactly what this is, but it's 5 for replays and 0 when replay data doesn't get loaded
    //If 0, replay is treated as corrupted
    //Also seen 7 when getting list of replay files
    int dataType;

    char _spacer4[0xF4 - 0xEC - sizeof(dataType)];

    //Everything after here seems to be its own object, but I can't find its name
    //0xF0
    //Some sort of data type thing
    //4 when reading list of replay files, 6 when actually reading a replay file
    //Seen it used to decide if should lock mutex, was 1 and did use it
    //0xF4
    //0 for VF, 1 for SD
    int fileSystemType;
    //0xF8
    //1 for photos, 2 for replays
    int collectionType;
    //0xFC
    //File name of collection, doesn't include path
    //Actual buffer size should be significantly larger
    char collectionName[40];
};

static_assert(sizeof(gfCollectionIO) % 4 == 0, "gfCollectionIO misaligned");
static_assert(sizeof(gfCollectionIO) == 0xFC + sizeof(gfCollectionIO::collectionName), "gfCollectionIO incorrect size");

#endif //PROJECTMCODES_GFCOLLECTIONIO_H
