#pragma once

#include "list.h"
#include "Wii/OS/OSMutex.h"

// Header common among heaps
struct MEMiHeapHead {
	u32       signature;

	MEMLink   link;
	MEMList   childList;

	void* heapStart;      // Heap start address
	void* heapEnd;        // Heap end (+1) address
	OSMutex   mutex;          // For exclusive use between threads

	union                     // Attribute
	{
		u32       val;
		struct
		{
			u32   _reserved : 24;
			u32   optFlag : 8; // Option flag.
		}
		fields;
	}
	attribute;
};

typedef MEMiHeapHead* MEMHeapHandle;   // Type to represent heap handle