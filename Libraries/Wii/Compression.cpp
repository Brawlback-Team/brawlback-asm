//
// Created by johno on 9/28/2020.
//

#include "Compression.h"


u32 compressLZ(const void* source, u32 size, void* dest) {
    char* tempWork = new char[CX_LZ_COMPRESS_WORK_SIZE];
    u32 result = _CXCompressLZImpl(static_cast<const u8*>(source), size, static_cast<u8*>(dest), tempWork);
    delete[] tempWork;
    return result;
}

void uncompressLZ(const void* source, void* dest) {
    _CXUncompressLZ(source, dest);
}