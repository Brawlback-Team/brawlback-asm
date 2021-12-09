//
// Created by johno on 11/2/2020.
//

#include "gfMemoryPool.h"

void* gfMemoryPool::alloc(size_t size, u32 alignment) {
    return _alloc_GF_MEMORY_POOL(this, size, alignment);
}
