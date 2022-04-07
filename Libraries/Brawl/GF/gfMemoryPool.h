//
// Created by johno on 11/2/2020.
//

#ifndef PROJECTMCODES_GFMEMORYPOOL_H
#define PROJECTMCODES_GFMEMORYPOOL_H

#include "stdtypes.h"

struct gfMemoryPool {
    void* alloc(size_t size, u32 alignment=0x20);
};


#define _alloc_GF_MEMORY_POOL ((void* (*)(gfMemoryPool* pool, size_t size, u32 alignment)) 0x80025c58)


#endif //PROJECTMCODES_GFMEMORYPOOL_H
