//
// Created by johno on 7/17/2020.
//

#ifndef PROJECTMCODES_OSCACHE_H
#define PROJECTMCODES_OSCACHE_H

#include "stddef.h"

void invalidateDataCache(void* startAddress, u32 size);
void flushDataCache(void* startAddress, u32 size);
void invalidateInstructionCache(void* startAddress, u32 size);

//Invalidates data cache
#define _DCInvalidateRange ((void (*)(void* startAddress, u32 size)) 0x801d76bc)

//Flushes data cache
#define _DCFlushRange ((void (*)(void* startAddress, u32 size)) 0x801d76e8)

//Invalidates instruction cache
#define _ICInvalidateRange ((void (*)(void* startAddress, u32 size)) 0x801d77cc)

#endif //PROJECTMCODES_OSCACHE_H
