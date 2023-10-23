#include "EXI_hooks.h"
#include <string.h>
#include <OS/OSError.h>
#include "utils.h"
namespace EXIHooks {
    void writeEXI(void* data, unsigned int size, EXIChannel channel, unsigned int device, EXIFreq frequency) {
        //need to make new buffer to ensure data is aligned to cache block
        void* alignedData = MEMAllocFromExpHeapEx(MemExpHooks::mainHeap, size, 32);
        memmove(alignedData, data, size);
        DCFlushRange(alignedData, size);
        setupEXIDevice(channel, device, frequency);
        EXIDma(channel, alignedData, size, 1, NULL);
        syncEXITransfer(channel);
        removeEXIDevice(channel);

        MemExpHooks::freeExp(alignedData);
    }

    void readEXI(void* destination, unsigned int size, EXIChannel channel, unsigned int device, EXIFreq frequency) {
        void* alignedDestination = MEMAllocFromExpHeapEx(MemExpHooks::mainHeap, size, 32);

        setupEXIDevice(channel, device, frequency);
        EXIDma(channel, alignedDestination, size, 0, NULL);
        syncEXITransfer(channel);
        removeEXIDevice(channel);
        DCFlushRange(alignedDestination, size);

        memmove(destination, alignedDestination, size);

        MemExpHooks::freeExp(alignedDestination);
    }
    void setupEXIDevice(EXIChannel channel, unsigned int device, EXIFreq frequency) {
        attachEXIDevice(channel);
        lockEXIDevice(channel, device);
        selectEXIDevice(channel, device, frequency);
    }

    void removeEXIDevice(EXIChannel channel) {
        deselectEXIDevice(channel);
        unlockEXIDevice(channel);
        detachEXIDevice(channel);
    }

    bool attachEXIDevice(EXIChannel channel, EXICallback callback) {
        return EXIAttach(channel, callback);
    }

    bool detachEXIDevice(EXIChannel channel) {
        return EXIDetach(channel);
    }

    bool lockEXIDevice(EXIChannel channel, unsigned int device, EXICallback callback) {
        return EXILock(channel, device, callback);
    }

    bool unlockEXIDevice(EXIChannel channel) {
        return EXIUnlock(channel);
    }

    bool selectEXIDevice(EXIChannel channel, unsigned int device, EXIFreq frequency) {
        return EXISelect(channel, device, frequency);
    }

    bool deselectEXIDevice(EXIChannel channel) {
        return EXIDeselect(channel);
    }

    bool syncEXITransfer(EXIChannel channel) {
        return EXISync(channel);
    }
}