//
// Created by johno on 7/17/2020.
//

#include "EXI.h"


void writeEXI(void* data, u32 size, EXIChannel channel, EXIDevice device, EXIFrequency frequency) {
    //need to make new buffer to ensure data is aligned to cache block
    void* alignedData = malloc(size, 32);
    memcpy(alignedData, data, size);

    flushDataCache(alignedData, size);
    setupEXIDevice(channel, device, frequency);
    transferDataEXI(channel, alignedData, size, EXITransfer::write);
    syncEXITransfer(channel);
    removeEXIDevice(channel);

    free(alignedData);
}

void readEXI(void* destination, u32 size, EXIChannel channel, EXIDevice device, EXIFrequency frequency) {
    void* alignedDestination = malloc(size, 32);

    setupEXIDevice(channel, device, frequency);
    transferDataEXI(channel, alignedDestination, size, EXITransfer::read);
    syncEXITransfer(channel);
    removeEXIDevice(channel);
    flushDataCache(alignedDestination, size);

    memcpy(destination, alignedDestination, size);
    free(alignedDestination);
}

void setupEXIDevice(EXIChannel channel, EXIDevice device, EXIFrequency frequency) {
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
    return _EXIAttach(channel, callback);
}

bool detachEXIDevice(EXIChannel channel) {
    return _EXIDetach(channel);
}

bool lockEXIDevice(EXIChannel channel, EXIDevice device, EXICallback callback) {
    return _EXILock(channel, device, callback);
}

bool unlockEXIDevice(EXIChannel channel) {
    return _EXIUnlock(channel);
}

bool selectEXIDevice(EXIChannel channel, EXIDevice device, EXIFrequency frequency) {
    return _EXISelect(channel, device, frequency);
}

bool deselectEXIDevice(EXIChannel channel) {
    return _EXIDeselect(channel);
}

bool transferDataEXI(EXIChannel channel, void* data, u32 size, EXITransfer transferType, EXICallback callback) {
    return _EXI_DMA(channel, data, size, transferType, callback);
}

bool syncEXITransfer(EXIChannel channel) {
    return _EXISync(channel);
}