#pragma once
#include "EXI/EXIBios.h"
#include "EXI/EXICommon.h"
#include "memoryFuncs.h"
#include "MEM/mem_expHeap.h"
#include "OS/OSCache.h"
#include "mem_exp_hooks.h"
#include "BrawlbackTypes.h"

namespace EXIHooks {
    void writeEXI(void* source, u32 size, EXIChannel channel, u32 device, EXIFreq frequency);
    void readEXI(void* destination, u32 size, EXIChannel channel, u32 device, EXIFreq frequency);

    void setupEXIDevice(EXIChannel channel, u32 device, EXIFreq frequency);
    void removeEXIDevice(EXIChannel channel);

    //These all return false if they fail, true if the succeed

    bool attachEXIDevice(EXIChannel channel, EXICallback callback = 0);
    bool detachEXIDevice(EXIChannel channel);
    bool lockEXIDevice(EXIChannel channel, u32 device, EXICallback callback = 0);
    bool unlockEXIDevice(EXIChannel channel);
    bool selectEXIDevice(EXIChannel channel, u32 device, EXIFreq frequency);
    bool deselectEXIDevice(EXIChannel channel);
    bool syncEXITransfer(EXIChannel channel);
}