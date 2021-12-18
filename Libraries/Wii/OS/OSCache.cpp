//
// Created by johno on 7/17/2020.
//

#include "OSCache.h"

void invalidateDataCache(void* startAddress, u32 size) {
    _DCInvalidateRange(startAddress, size);
}

void flushDataCache(void* startAddress, u32 size) {
    _DCFlushRange(startAddress, size);
}

void invalidateInstructionCache(void* startAddress, u32 size) {
    _ICInvalidateRange(startAddress, size);
}