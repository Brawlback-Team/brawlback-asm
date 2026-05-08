#include "exi_packet.h"
#include <memory.h>
#include <OS/OSError.h>
#include "mem_exp_hooks.h"
#include "EXI_hooks.h"
#include <gf/gf_memory_pool.h>
#include <sr/sr_common.h>
u8 EXIPacket::getCmd() { return this->cmd; }

EXIPacket::EXIPacket() {
    u8 EXICmd = EXICommand::CMD_UNKNOWN;
    // enough for the EXICmd byte + size of the packet
    unsigned int new_size = sizeof(EXICmd);

    u8* new_packet = (u8*)gfMemoryPool::alloc(g_HeapInfos[Heaps::SavestateHeap].m_memoryPool, new_size, 4);
    if (!new_packet) {
        OSReport("Failed to alloc %u bytes! Heap space available: %u\n", size, MemExpHooks::getFreeSize(MemExpHooks::mainHeap, 4));
        return;
    }

    // copy EXICmd byte into packet
    memmove(new_packet, &EXICmd, sizeof(EXICmd));

    // set our size/src ptr so the Send() function knows how much/what to send
    this->size = new_size;
    this->source = new_packet;
    this->cmd = EXICmd; 
}
EXIPacket::EXIPacket(u8 EXICmd) { 
    unsigned int new_size = sizeof(EXICmd);

    u8* new_packet = (u8*)gfMemoryPool::alloc(g_HeapInfos[Heaps::SavestateHeap].m_memoryPool, new_size, 4);
    if (!new_packet) {
        OSReport("Failed to alloc %u bytes! Heap space available: %u\n", size, MemExpHooks::getFreeSize(MemExpHooks::mainHeap, 4));
        return;
    }

    // copy EXICmd byte into packet
    memmove(new_packet, &EXICmd, sizeof(EXICmd));

    // set our size/src ptr so the Send() function knows how much/what to send
    this->size = new_size;
    this->source = new_packet;
    this->cmd = EXICmd;
}

EXIPacket::EXIPacket(u8 EXICmd, void* source, unsigned int size) {
    if (!source) size = 0; if (size <= 0) source = NULL; //sanity checks

    // enough for the EXICmd byte + size of the packet
    unsigned int new_size = sizeof(EXICmd) + size;

    u8* new_packet = (u8*)gfMemoryPool::alloc(g_HeapInfos[Heaps::SavestateHeap].m_memoryPool, new_size, 32);
    if (!new_packet) {
        OSReport("Failed to alloc %u bytes! Heap space available: %u\n", size, MemExpHooks::getFreeSize(MemExpHooks::mainHeap, 4));
        return;
    }

    // copy EXICmd byte into packet
    memmove(new_packet, &EXICmd, sizeof(EXICmd));

    if (source) {
        // copy actual packet into our buffer
        memmove(new_packet + sizeof(EXICmd), source, size);
    }

    // set our size/src ptr so the Send() function knows how much/what to send
    this->size = new_size;
    this->source = new_packet;
    this->cmd = EXICmd;
}

EXIPacket::~EXIPacket() {
    if (this->source) {
        gfMemoryPool::gfPoolFree((u32)this->source);
    }
}

bool EXIPacket::Send() {
    bool success = false;
    if (!this->source || this->size <= 0) {
        OSReport("Invalid EXI packet source or size! source: %x  size: %u\n", source, size);
    }
    else {
        EXIHooks::writeEXI(this->source, this->size, EXI_CHAN_1, 0, EXI_FREQ_32HZ);
        success = true;
    }
    return success;
}

void EXIPacket::CreateAndSend(unsigned char EXICmd, void* source, unsigned int size) {
    // enough for the EXICmd byte + size of the packet
    unsigned int new_size = sizeof(EXICmd) + size;
    unsigned char* new_packet = (unsigned char*)gfMemoryPool::alloc(g_HeapInfos[Heaps::SavestateHeap].m_memoryPool, new_size, 32);

    // copy EXICmd byte into packet
    memmove(new_packet, &EXICmd, sizeof(EXICmd));
    if (source != (unsigned char*)0x0) {
        // copy actual packet into our buffer
        memmove(new_packet + sizeof(EXICmd), source, size);
    }
    EXIHooks::writeEXI(new_packet, new_size, EXI_CHAN_1, 0, EXI_FREQ_32HZ);
    gfMemoryPool::gfPoolFree((u32)new_packet);
} 