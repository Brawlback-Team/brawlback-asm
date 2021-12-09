//
// Created by johno on 9/28/2020.
//

#ifndef PROJECTMCODES_COMPRESSION_H
#define PROJECTMCODES_COMPRESSION_H


#include <stddef.h>


#define CX_LZ_COMPRESS_WORK_SIZE (0x2400)

//Used for replays
//dest should be the same size as source
//returns size of dest
//If dest would be bigger than source, it doesn't do anything and returns 0
u32 compressLZ(const void* source, u32 size, void* dest);

//Used for replays
//Should be word aligned
void uncompressLZ(const void* source, void* dest);


#define _CXUncompressLZ ((void (*)(const void* source, void* dest)) 0x80206018)
#define _CXCompressLZImpl ((u32 (*)(const u8* source, u32 size, u8* dest, void* work)) 0x80204fc8)

#endif //PROJECTMCODES_COMPRESSION_H
