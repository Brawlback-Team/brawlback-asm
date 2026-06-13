#pragma once
#include "EXI/EXIBios.h"

namespace EXIHooks {
    void writeEXI(void* source, unsigned int size, EXIChannel channel, unsigned int device, EXIFreq frequency);
    void readEXI(void* destination, unsigned int size, EXIChannel channel, unsigned int device, EXIFreq frequency);
    bool wasLastReadSuccessful();
    bool wasLastWriteSuccessful();

    bool setupEXIDevice(EXIChannel channel, unsigned int device, EXIFreq frequency);
    void removeEXIDevice(EXIChannel channel);

    //These all return false if they fail, true if the succeed

    bool attachEXIDevice(EXIChannel channel, EXICallback callback = 0);
    bool detachEXIDevice(EXIChannel channel);
    bool lockEXIDevice(EXIChannel channel, unsigned int device, EXICallback callback = 0);
    bool unlockEXIDevice(EXIChannel channel);
    bool selectEXIDevice(EXIChannel channel, unsigned int device, EXIFreq frequency);
    bool deselectEXIDevice(EXIChannel channel);
    bool syncEXITransfer(EXIChannel channel);
}