//
// Created by johno on 11/26/2020.
//

#ifndef PROJECTMCODES_SETUP_H
#define PROJECTMCODES_SETUP_H

#include "Assembly.h"
#include "Memory.h"
#include "stdtypes.h"

//These structs are puposly inaccurate
//The arrays are not actually empty, they are created after compilation
//This is done because the true size is not known until then
//The location of each struct is immediatly after the previous, from top to bottom

struct MEMORY_HEAP_INFO {
    void* heapAddress;
    u32 heapSize;
};

struct INJECTIONS {
    struct _injection {
        u32 injectionAddress;
        u32 injectedFunctionAddress;
        u32 returnBranchAddress;
    };

    int numInjections;
    _injection injections[];
};

struct STARTUPS {
    typedef void (*startupFunction)();

    int numStartups;
    startupFunction startupFunctions[];
};


struct STRING_WRITES {
    struct _write {
        void* targetAddress;
        void* dataAddress;
        u32 dataSize;
    };

    u32 numWrites;
    _write writes[];
};

struct _DATA_WRITE {
    char* targetAddress;
    u16 dataSize;
    u16 repeats;
    u8 data[];
};

static_assert(sizeof(_DATA_WRITE) == 8);


struct INITIALIZATION_INFO {
    MEMORY_HEAP_INFO* memoryHeapInfo;
    STARTUPS* startups;
    STRING_WRITES* stringWrites;
    _DATA_WRITE* dataWrites;
    INJECTIONS* injections;
};


extern "C" void setup(bool firstTime);

void performInjection(INJECTIONS::_injection& injection, bool shouldInvalidate);

#endif //PROJECTMCODES_SETUP_H
