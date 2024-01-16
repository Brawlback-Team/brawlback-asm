#pragma once

#include "Assembly.h"
#include "stdtypes.h"
#include "Wii/expHeap.h"

#define MAIN_HEAP_ADDRESS ((void*) 0x93604000)
#define MAIN_HEAP_SIZE (0x4000)
extern MEMHeapHandle mainHeap;

//creates the memory buffer used by malloc
//Called first thing after codes are loaded
//Build system has to be modified if the name is changed
extern "C" void _INITIALIZE_MEMORY_(void* heapAddress, u32 heapSize);


#define FAKE_GF_POOL_ID (0xFF)
