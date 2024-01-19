#include "mem_exp_hooks.h"
#include <MEM/mem_expHeap.h>

namespace MemExpHooks {
    MEMHeapHandle mainHeap;
    void initializeMemory(void* heapAddress, unsigned int heapSize) {
        mainHeap = MEMCreateExpHeapEx(heapAddress, heapSize, 0);
    }
    void* mallocExp(size_t size) {
        return MEMAllocFromExpHeapEx(mainHeap, size, 4);
    }
    void freeExp(void* ptr) {
        MEMFreeToExpHeap(mainHeap, ptr);
    }
    unsigned int getFreeSize(MEMHeapHandle heap, int alignment) {
        return MEMGetAllocatableSizeForExpHeapEx(heap, alignment);
    }
}