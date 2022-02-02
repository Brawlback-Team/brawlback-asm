#include "EXIPacket.h"

#include "Assembly.h"
#include "Debug.h"
#include "Wii/EXI/EXI.h"
#include "CLibs/cstring.h"
#include "Wii/OS/OSInterrupt.h"

// Adapted code from Pine

EXIPacket::EXIPacket(u8 EXIStatus, void* source, u32 size) {
    // enough for the EXIStatus byte + size of the packet
    u32 new_size = sizeof(EXIStatus) + size;

    u8* new_packet = (u8*)malloc(new_size, 32);

    // copy EXIStatus byte into packet
    memcpy(new_packet, &EXIStatus, sizeof(EXIStatus));

    if (source) {
        // copy actual packet into our buffer
        memcpy(new_packet + sizeof(EXIStatus), source, size);
    }

    // set our size/src ptr so the Send() function knows how much/what to sendexi
    this->size = new_size;
    this->source = new_packet;
}

EXIPacket::~EXIPacket() {
    free(this->source);
}

void EXIPacket::Send() {
    _OSDisableInterrupts();
    writeEXI(this->source, this->size, EXIChannel::slotB, EXIDevice::device0, EXIFrequency::EXI_32MHz);
    _OSEnableInterrupts();
}

void EXIPacket::Receive() {
    _OSDisableInterrupts();
    readEXI(this->source, this->size, EXIChannel::slotB, EXIDevice::device0, EXIFrequency::EXI_32MHz);
    _OSEnableInterrupts();
}