//
// Created by johno on 7/2/2020.
//

#ifndef PROJECTMCODES_GFFILEIO_H
#define PROJECTMCODES_GFFILEIO_H


#include "stdtypes.h"
#include "stddef.h"

struct gfFileIO {
    //0
    const char* filepath;
    //4
    //0 for w, 1 for a (for writing)
    int openMode;
    //8
    //leave 0 for reads, gets set after read
    //might also mean position in file
    size_t size;
    //0xC
    //used when writing
    void* source;
    //0x10
    //used when reading
    //Also seems to accept gfMemoryPool ptrs
    //Maybe have to set flags for it to work
    void* destination;
    //0x14
    int thing = 0xC80;

    gfFileIO(const char* filePath, int openMode, size_t size, void* source, void* destination);

    int readSDFile();
    int writeSDFile();
}__attribute__((packed));


static_assert(sizeof(gfFileIO) == 0x18, "gfFileIO is not right size");



#define _readSDFile_gfFileIO ((int (*)(gfFileIO* self)) 0x8001cbf4)
#define _writeSDFile_gfFileIO ((int (*)(gfFileIO* self)) 0x8001d740)

#endif //PROJECTMCODES_GFFILEIO_H
