#include "Memory.h"

MEMHeapHandle mainHeap;

#define system_memmove ((void* const (*)(void* dest, const void* source, size_t size)) 0x803f602c)
#define system_memset ((void* (*)(void* data, int value, size_t size)) 0x8000443c)
#define system_memcmp ((int (*)(const void* a, const void* b, size_t size)) 0x803f6150)


extern "C" void _INITIALIZE_MEMORY_(void* heapAddress, u32 heapSize) {
	mainHeap = createExpHeap(heapAddress, heapSize);
}

extern "C" void* memmove(void* dest, const void* source, size_t size) {
	return system_memmove(dest, source, size);
}

extern "C" void* memcpy(void* dest, const void* source, size_t size) {
	return system_memmove(dest, source, size);
}

extern "C" void* memset(void* data, int value, size_t size) {
	return system_memset(data, value, size);
}

extern "C" int memcmp(const void* a, const void* b, size_t size) {
    return system_memcmp(a, b, size);
}

extern "C" void* malloc(size_t size) {
	return allocFromExpHeap(mainHeap, size, 32);
}

extern "C" void free(void* ptr) {
	freeToExpHeap(mainHeap, ptr);
}

// void* operator new(size_t n) {
// 	return malloc(n);
// }

// void operator delete(void* p) {
// 	free(p);
// }

// void operator delete(void* p, size_t size) {
//     free(p);
// }

// void* operator new[](size_t s) {
// 	return malloc(s);
// }

// void operator delete[](void* p) {
// 	free(p);
// }

// void operator delete[](void* p, size_t size) {
// 	delete[]((char*)p);
// }


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