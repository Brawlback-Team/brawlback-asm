#pragma once
#include <MEM/mem_heapCommon.h>

namespace MemExpHooks {
    extern MEMHeapHandle mainHeap;
    void initializeMemory(void* heapAddress, unsigned int heapSize);
    void* mallocExp(size_t size);
    void freeExp(void* ptr);
    unsigned int getFreeSize(MEMHeapHandle heap = mainHeap, int alignment = 4);
}