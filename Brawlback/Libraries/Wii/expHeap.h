#pragma once

#include "heapCommon.h"

// Memory allocation direction
enum {
    MEM_EXPHEAP_ALLOC_DIR_FRONT,    // Allocate from front
    MEM_EXPHEAP_ALLOC_DIR_REAR      // Allocate from back
};

// Memory allocation mode
enum {
    //uses the first block it finds that is big enough
    MEM_EXPHEAP_ALLOC_MODE_FIRST = 0,
    //looks for free block that is closest to requested size
    MEM_EXPHEAP_ALLOC_MODE_NEAR = 1
};

struct MEMiExpHeapMBlockHead {
    u16 signature; //Signature

	union                                // Attribute
    {
        u16                      val;
        struct
        {
            u16                  allocDir  : 1;   // Memory allocation direction
            u16                  alignment : 7;   // Alignment
            u16                  groupID   : 8;   // Group ID
        }
        fields;
    }
    attribute;
    u32 blockSize;
    
    MEMiExpHeapMBlockHead* pMBHeadPrev; //Previous block
    MEMiExpHeapMBlockHead* pMBHeadNext; //Next block
};

struct MEMiExpMBlockList {
    MEMiExpHeapMBlockHead* head;
    MEMiExpHeapMBlockHead* tail;
};

struct MEMiExpHeapHead {
    MEMiExpMBlockList mbFreeList;
    MEMiExpMBlockList mbUsedList;
    
    u16 groupID; //Current group ID (lower 8 bits only)
    
    union                                // Attribute
    {
        u16                val;
        struct
        {
            u16            _reserved          : 14;
            u16            useMarginOfAlign   :  1; // If this attribute value is set, gaps in memory that occur during alignment will be reused as empty regions.
                                                    //  
            u16            allocMode          :  1; // Memory allocation mode
        }
        fields;
    }
    feature;
};



#define MEMCreateExpHeapEx ((MEMHeapHandle (*)(void* startAddress, u32 size, u16 optFlag)) 0x80204688)
#define MEMDestroyExpHeap ((void* (*)(MEMHeapHandle heap)) 0x80204738)
#define MEMAllocFromExpHeapEx ((void* (*)(MEMHeapHandle heap, u32 size, int alignment)) 0x80204768)
#define MEMFreeToExpHeap ((void (*)(MEMHeapHandle heap, void* memBlock)) 0x80204818)
#define MEMGetAllocatableSizeForExpHeapEx ((u32 (*)(MEMHeapHandle heap, int alignment)) 0x802048e4)

//typedef void (*MEMHeapVisitor)(void* memBlock, MEMHeapHandle heap, u32 userParam);

//void MEMiDumpExpHeap(MEMHeapHandle heap);

MEMHeapHandle createExpHeap(void* startAddress, u32 size, u16 optFlag = 0);
void* destroyExpHeap(MEMHeapHandle heap);
void* allocFromExpHeap(MEMHeapHandle heap, u32 size, int alignment = 4);
//u32 MEMResizeForMBlockExpHeap(MEMHeapHandle heap, void* memBlock, u32 size);
void freeToExpHeap(MEMHeapHandle heap, void* memBlock);
//u32 MEMGetTotalFreeSizeForExpHeap(MEMHeapHandle heap);
u32 getFreeSize(MEMHeapHandle heap, int alignment = 4);
//bool MEMiIsEmptyExpHeap(MEMHeapHandle heap);
//u16 MEMSetAllocModeForExpHeap(MEMHeapHandle heap, u16 mode);
//u16 MEMGetAllocModeForExpHeap(MEMHeapHandle heap);
//BOOL        MEMUseMarginOfAlignmentForExpHeap(MEMHeapHandle heap, BOOL reuse);
//u16         MEMSetGroupIDForExpHeap(MEMHeapHandle heap, u16 groupID);
//u16         MEMGetGroupIDForExpHeap(MEMHeapHandle heap);
//void MEMVisitAllocatedForExpHeap(MEMHeapHandle heap, MEMHeapVisitor visitor, u32 userParam);
//u32         MEMGetSizeForMBlockExpHeap(const void* memBlock);
//u16         MEMGetGroupIDForMBlockExpHeap(const void* memBlock);
//u16         MEMGetAllocDirForMBlockExpHeap(const void* memBlock);
//u32         MEMAdjustExpHeap(MEMHeapHandle heap);