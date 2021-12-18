//
// Created by johno on 7/17/2020.
//

#ifndef PROJECTMCODES_EXI_H
#define PROJECTMCODES_EXI_H

#include "stddef.h"
#include "Memory.h"
#include "Wii/OS/OSCache.h"

//I don't understand the specifics of these yet, but I can just copy UnclePunch's transfer logic and it should work
//Untested so far

enum class EXITransfer {
    read = 0,
    write = 1,
    //not sure how it reads and writes
    readWrite = 2
};

enum class EXIChannel {
    slotA = 0,
    slotB = 1,
    serialPort2 = 2
};

//not really sure how devices are distinguished
enum class EXIDevice {
    device0 = 0,
    device1 = 1,
    device2 = 2
};

enum class EXIFrequency {
    EXI_1MHz = 0,
    EXI_2MHz = 1,
    EXI_4MHz = 2,
    EXI_8MHz = 3,
    EXI_16MHz = 4,
    EXI_32MHz = 5,
};

typedef s32 (*EXICallback)(EXIChannel chn, s32 dev);

//can make these default to the standard chanels and stuff
void writeEXI(void* source, u32 size, EXIChannel channel, EXIDevice device, EXIFrequency frequency);
void readEXI(void* destination, u32 size, EXIChannel channel, EXIDevice device, EXIFrequency frequency);

void setupEXIDevice(EXIChannel channel, EXIDevice device, EXIFrequency frequency);
void removeEXIDevice(EXIChannel channel);

//These all return false if they fail, true if the succeed

bool attachEXIDevice(EXIChannel channel, EXICallback callback=nullptr);
bool detachEXIDevice(EXIChannel channel);
bool lockEXIDevice(EXIChannel channel, EXIDevice device, EXICallback callback = nullptr);
bool unlockEXIDevice(EXIChannel channel);
bool selectEXIDevice(EXIChannel channel, EXIDevice device, EXIFrequency frequency);
bool deselectEXIDevice(EXIChannel channel);

bool transferDataEXI(EXIChannel channel, void* data, u32 size, EXITransfer transferType, EXICallback callback = nullptr);

bool syncEXITransfer(EXIChannel channel);


//I think this means that whatever device is on the specified channel is "attached"
#define _EXIAttach ((bool (*)(EXIChannel channel, EXICallback callback)) 0x801e4b7c)
#define _EXIDetach ((bool (*)(EXIChannel channel)) 0x801e4c94)

//locks the channel on the device
//I assume it's like a mutex
#define _EXILock ((bool (*)(EXIChannel channel, EXIDevice device, EXICallback callback)) 0x801e54e0)
#define _EXIUnlock ((bool (*)(EXIChannel channel)) 0x801e4c94)

#define _EXISelect ((bool (*)(EXIChannel channel, EXIDevice device, EXIFrequency frequency)) 0x801e4d4c)
#define _EXIDeselect ((bool (*)(EXIChannel channel)) 0x801e4e7c)

#define _EXI_DMA ((bool (*)(EXIChannel channel, void* data, u32 size, EXITransfer transferType, EXICallback callback)) 0x801e4604)

#define _EXISync ((bool (*)(EXIChannel channel)) 0x801e46fc)


#endif //PROJECTMCODES_EXI_H
