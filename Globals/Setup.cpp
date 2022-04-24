//
// Created by johno on 11/26/2020.
//

#include "Setup.h"

INJECTION("setup", 0x80017504, R"(
    SAVE_REGS
    li r3, 0
    bl setup
    RESTORE_REGS
    stw r0, 0x100(r23)
)");


INJECTIONS* injections;

#define OSReport ((void (*)(const char* text, ...)) 0x801d8600)

//Changing this name requires changing the build system
extern "C" void _INITIALIZE_(INITIALIZATION_INFO* initializationInfo) {
    auto heapInfo = initializationInfo->memoryHeapInfo;

    _INITIALIZE_MEMORY_(heapInfo->heapAddress, heapInfo->heapSize);

    OSReport("SPECIFIED HEAP ADDR: %08x\n", heapInfo->heapAddress);
    OSReport("SPECIFIED HEAP SIZE: %08x\n", heapInfo->heapSize);
    OSReport("INITIAL FREE SIZE: %08x\n", getFreeSize(mainHeap));

    auto startups = initializationInfo->startups;
    for(int i = 0; i < startups->numStartups; i++) {
        startups->startupFunctions[i]();
    }

    auto stringWrites = initializationInfo->stringWrites;
    for(int i = 0; i < stringWrites->numWrites; i++) {
        auto write = stringWrites->writes[i];
        memcpy(write.targetAddress, write.dataAddress, write.dataSize);
    }

    auto dataWrites = initializationInfo->dataWrites;
    while(dataWrites->targetAddress != nullptr) {
        for(int i = 0; i < dataWrites->repeats; i++) {
            memcpy(dataWrites->targetAddress + (dataWrites->dataSize * i), dataWrites->data, dataWrites->dataSize);
        }
        int alignedDataSize = dataWrites->dataSize + 4 - dataWrites->dataSize % 4;
        dataWrites = (_DATA_WRITE*) (((char*) dataWrites) + alignedDataSize + 8);
    }

    injections = initializationInfo->injections;
    setup(true);
}


extern "C" void setup(bool firstTime) {
    for(int i = 0; i < injections->numInjections; i++) {
        performInjection(injections->injections[i], firstTime);
    }
}


u32 makeBranchInstruction(u32 targetAddress, u32 startAddress) {
    int offset = targetAddress - startAddress;
    u32 maskedOffset = ((1 << 26) - 1) & offset;
    u32 branchInstruction = maskedOffset | 0x48000000;
    return branchInstruction;
}

void invalidateCache(u32 address) {
    asm volatile ( R"(
        dcbst 0, %0
        sync
        icbi 0, %0
        isync)"
    :
    : "r" (address)
    );
}

void performInjection(INJECTIONS::_injection& injection, bool shouldInvalidate) {
    auto branchInstruction = makeBranchInstruction(injection.injectedFunctionAddress, injection.injectionAddress);
    *((u32*) injection.injectionAddress) = branchInstruction;
    if(shouldInvalidate) {
        invalidateCache(injection.injectionAddress);
    }

    auto returnBranchInstruction = makeBranchInstruction(injection.injectionAddress + 4, injection.returnBranchAddress);
    *((u32*) injection.returnBranchAddress) = returnBranchInstruction;
    if(shouldInvalidate) {
        invalidateCache(injection.returnBranchAddress);
    }
}