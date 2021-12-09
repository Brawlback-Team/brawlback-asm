#include "expHeap.h"

MEMHeapHandle createExpHeap(void* startAddress, u32 size, u16 optFlag) {
	return MEMCreateExpHeapEx(startAddress, size, optFlag);
}

void* destroyExpHeap(MEMHeapHandle heap) {
	return MEMDestroyExpHeap(heap);
}

void* allocFromExpHeap(MEMHeapHandle heap, u32 size, int alignment) {
	return MEMAllocFromExpHeapEx(heap, size, alignment);
}

void freeToExpHeap(MEMHeapHandle heap, void* memBlock) {
	MEMFreeToExpHeap(heap, memBlock);
}

u32 getFreeSize(MEMHeapHandle heap, int alignment) {
	return MEMGetAllocatableSizeForExpHeapEx(heap, alignment);
}