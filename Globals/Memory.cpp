#include "Memory.h"

MEMHeapHandle mainHeap;

extern "C" void _INITIALIZE_MEMORY_(void* heapAddress, u32 heapSize) {
	mainHeap = createExpHeap(heapAddress, heapSize);
}



INJECTION("fakeGFPoolAlloc1", 0x800249e4, R"(
    cmpwi r3, 0xFF
    bne fakeGFPoolAlloc1_END
    mr r3, r4
    li r4, 32
    #is normal branch on purpose
    b malloc
    #never returns here

fakeGFPoolAlloc1_END:
    lis r6, 0x8049
)");


INJECTION("fakeGFPoolAlloc2", 0x80024a00, R"(
    cmpwi r3, 0xFF
    bne fakeGFPoolAlloc2_END
    mr r3, r4
    mr r4, r5
    #is normal branch on purpose
    b malloc
    #never returns here

fakeGFPoolAlloc2_END:
    lis r6, 0x8049
)");


INJECTION("fakeGFPoolFree", 0x8002632c, R"(
    #mainHeap is the last thing in memory, so anything with a higher address belongs to it
    SETREG r4 mainHeap
    cmplw r3, r4
    ble fakeGFPoolFree_END
    #is normal branch on purpose
    b free
    #never returns here

fakeGFPoolFree_END:
    stwu sp, -0x20(sp)
)");