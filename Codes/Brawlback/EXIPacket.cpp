#include "EXIPacket.h"

#include "Assembly.h"
#include "Debug.h"
#include "Wii/EXI/EXI.h"
#include "Wii/OS/OSInterrupt.h"

EXICommand EXIPacket::getCmd() { return this->cmd; }

EXIPacket::EXIPacket() : EXIPacket(EXICommand::CMD_UNKNOWN, nullptr, 0) { }
EXIPacket::EXIPacket(u8 EXICmd) : EXIPacket(EXICmd, nullptr, 0) { }

EXIPacket::EXIPacket(u8 EXICmd, void* source, u32 size) {
    if (!source) size = 0; if (size <= 0) source = nullptr; //sanity checks

    // enough for the EXICmd byte + size of the packet
    u32 new_size = sizeof(EXICmd) + size;

    u8* new_packet = (u8*)allocFromExpHeap(mainHeap, new_size, 32);

    // copy EXICmd byte into packet
    memcpy(new_packet, &EXICmd, sizeof(EXICmd));

    if (source) {
        // copy actual packet into our buffer
        memcpy(new_packet + sizeof(EXICmd), source, size);
    }

    // set our size/src ptr so the Send() function knows how much/what to send
    this->size = new_size;
    this->source = new_packet;
    this->cmd = (EXICommand)EXICmd;
}

EXIPacket::~EXIPacket() {
    if (this->source) {
        free(this->source);
    }
}

bool EXIPacket::Send() {
    _OSDisableInterrupts();
    bool success = false;
    if (!this->source || this->size <= 0) {
        OSReport("Invalid EXI packet source or size!\n");
    }
    else {
        writeEXI(this->source, this->size, EXIChannel::slotB, EXIDevice::device0, EXIFrequency::EXI_32MHz);
        success = true;
    }

    _OSEnableInterrupts();
    return success;
}