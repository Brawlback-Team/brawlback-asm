#pragma once
#include <MEM/mem_heapCommon.h>

namespace MemExpHooks {
    extern MEMHeapHandle mainHeap;
    void initializeMemory(void* heapAddress, u32 heapSize);
    void* mallocExp(size_t size);
    void freeExp(void* ptr);
    u32 getFreeSize(MEMHeapHandle heap = mainHeap, int alignment = 4);
}