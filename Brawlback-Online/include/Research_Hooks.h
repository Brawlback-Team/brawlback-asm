#pragma once
#include <types.h>
#include <OS/OSInterrupt.h>
#include <OS/OSError.h>
#include <StaticAssert.h>
#include <ExiStructures.h>

#include "EXI_hooks.h"
#include "utils.h"
#include "exi_packet.h"
extern bool shouldTrackAllocs;

namespace Research {
    extern unsigned int allocSizeTracker;
    extern char allocHeapName[30];

    void StartSceneMelee();
    void dump_gfMemoryPool_hook();
    void DumpGfMemoryPoolHook(char** r30_reg_val, unsigned int addr_start, unsigned int addr_end, unsigned int mem_size, unsigned char id);
    void ProcessGameAllocation(unsigned char* allocated_addr, unsigned int size, char* heap_name);
    void ProcessGameFree(unsigned char* address, char* heap_name);
    void alloc_gfMemoryPool_hook();
    void AllocGfMemoryPoolBeginHook(char** internal_heap_data, unsigned int size, unsigned int alignment);
    void allocGfMemoryPoolEndHook();
    void free_gfMemoryPool_hook();
    void FreeGfMemoryPoolHook(char** internal_heap_data, unsigned char* address);
}

namespace ResearchHooks {
    void InstallHooks();
}