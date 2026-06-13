#include "EXI_hooks.h"
#include "mem_exp_hooks.h"
#include <memory.h>
#include <gf/gf_memory_pool.h>
#include <sr/sr_common.h>

namespace {
    static const unsigned int kMaxExiTransferBytesPerRead = 0x1000;
    static bool s_lastReadSuccess = true;
    static bool s_lastWriteSuccess = true;
}

namespace EXIHooks {
    void writeEXI(void* data, unsigned int size, EXIChannel channel, unsigned int device, EXIFreq frequency) {
        s_lastWriteSuccess = false;
        if (!data || size == 0) {
            return;
        }

        //need to make new buffer to ensure data is aligned to cache block
        void* alignedData = gfMemoryPool::alloc(g_HeapInfos[Heaps::SavestateHeap].m_memoryPool, size, 32);
        if (!alignedData) {
            return;
        }
        memmove(alignedData, data, size);
        DCFlushRange(alignedData, size);
        if (!setupEXIDevice(channel, device, frequency)) {
            gfMemoryPool::gfPoolFree((u32)alignedData);
            return;
        }
        if (!EXIDma(channel, alignedData, size, 1, NULL)) {
            removeEXIDevice(channel);
            gfMemoryPool::gfPoolFree((u32)alignedData);
            return;
        }
        if (!syncEXITransfer(channel)) {
            removeEXIDevice(channel);
            gfMemoryPool::gfPoolFree((u32)alignedData);
            return;
        }
        removeEXIDevice(channel);

        gfMemoryPool::gfPoolFree((u32)alignedData);
        s_lastWriteSuccess = true;
    }

    void readEXI(void* destination, unsigned int size, EXIChannel channel, unsigned int device, EXIFreq frequency) {
        s_lastReadSuccess = false;
        if (!destination || size == 0) {
            return;
        }

        // Fail-safe default so callers don't consume stale stack/heap bytes
        // when EXI transfer fails or is partial.
        memset(destination, 0, size);

        unsigned int bufferSize = size;
        if (bufferSize > kMaxExiTransferBytesPerRead) {
            bufferSize = kMaxExiTransferBytesPerRead;
        }

        void* alignedDestination = gfMemoryPool::alloc(g_HeapInfos[Heaps::SavestateHeap].m_memoryPool, bufferSize, 32);
        if (!alignedDestination) {
            return;
        }

        unsigned char* destinationBytes = (unsigned char*)destination;
        if (!setupEXIDevice(channel, device, frequency)) {
            gfMemoryPool::gfPoolFree((u32)alignedDestination);
            return;
        }

        unsigned int offset = 0;
        while (offset < size) {
            unsigned int chunkSize = size - offset;
            if (chunkSize > bufferSize) {
                chunkSize = bufferSize;
            }

            if (!EXIDma(channel, alignedDestination, chunkSize, 0, NULL)) {
                break;
            }
            if (!syncEXITransfer(channel)) {
                break;
            }
            DCFlushRange(alignedDestination, chunkSize);
            memmove(destinationBytes + offset, alignedDestination, chunkSize);

            offset += chunkSize;
        }

        removeEXIDevice(channel);
        gfMemoryPool::gfPoolFree((u32)alignedDestination);
        s_lastReadSuccess = (offset == size);
    }

    bool wasLastReadSuccessful() {
        return s_lastReadSuccess;
    }

    bool wasLastWriteSuccessful() {
        return s_lastWriteSuccess;
    }
    bool setupEXIDevice(EXIChannel channel, unsigned int device, EXIFreq frequency) {
        if (!attachEXIDevice(channel)) {
            return false;
        }
        if (!lockEXIDevice(channel, device)) {
            detachEXIDevice(channel);
            return false;
        }
        if (!selectEXIDevice(channel, device, frequency)) {
            unlockEXIDevice(channel);
            detachEXIDevice(channel);
            return false;
        }
        return true;
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