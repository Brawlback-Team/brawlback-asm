//TODO: verify that compiling this file results in calls to these functions being overriden by functions at 
//listed memory addresses (instead of linking in libc.a implementations)

#include "Memory.h"

#define system_memmove ((void* const (*)(void* dest, const void* source, size_t size)) 0x803f602c)
#define system_memset ((void* (*)(void* data, int value, size_t size)) 0x8000443c)
#define system_memcmp ((int (*)(const void* a, const void* b, size_t size)) 0x803f6150)

extern "C" void* memmove(void* dest, const void* source, size_t size) {
	return system_memmove(dest, source, size);
}

extern "C" void* memcpy(void* dest, const void* source, size_t size) {
	return system_memmove(dest, source, size);
}

extern "C" void* memset(void* data, int value, size_t size) {
	return system_memset(data, value, size);
}

//returns <0 if a < b, 0 if a == b
extern "C" int memcmp(const void* a, const void* b, size_t size) {
    return system_memcmp(a, b, size);
}

extern "C" void* malloc(size_t size) {
	return allocFromExpHeap(mainHeap, size, 4);
}

extern "C" void free(void* ptr) {
	freeToExpHeap(mainHeap, ptr);
}