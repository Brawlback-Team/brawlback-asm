#include "EXIPacket.h"

#include "Assembly.h"
#include "Debug.h"
#include "Wii/EXI/EXI.h"
#include "CLibs/cstring.h"
#include "Wii/OS/OSInterrupt.h"


EXIPacket::EXIPacket(u8 EXICmd, void* source, u32 size) {    
    // enough for the EXICmd byte + size of the packet
    u32 new_size = sizeof(EXICmd) + size;

    u8* new_packet = (u8*)malloc(new_size, 32);

    // copy EXICmd byte into packet
    memcpy(new_packet, &EXICmd, sizeof(EXICmd));

    if (source) {
        // copy actual packet into our buffer
        memcpy(new_packet + sizeof(EXICmd), source, size);
    }

    // set our size/src ptr so the Send() function knows how much/what to send
    this->size = new_size;
    this->source = new_packet;
}

EXIPacket::~EXIPacket() {
    //free(this->source); // do I need to do this? Probably... or does other things take care of that mem for me?
}

void EXIPacket::Send() {
    _OSDisableInterrupts();
    writeEXI(this->source, this->size, EXIChannel::slotB, EXIDevice::device0, EXIFrequency::EXI_32MHz);
    _OSEnableInterrupts();
}