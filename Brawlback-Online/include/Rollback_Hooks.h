#pragma once
#include <gf/gf_pad_system.h>
#include "ExiStructures.h"
#include "exi_packet.h"
#include <sy_core.h>
#include <gf/gf_archive.h>
#include <ft/ft_entry.h>
#include <ft/ft_data_provider.h>
#include <vector.h>
#include <sr/sr_common.h>
#include <OS/OSError.h>
#include <gf/gf_file_io_manager.h>
#if 1
#define NETPLAY_IMPL
#define ROLLBACK_IMPL
#endif

#define SYRINGE_VECTOR_DEBUG 0

// Custom vector that always allocates from Syringe heap
template <typename T>
class SyringeVector {
    T* arr;
    int capacity;
    int current;

    bool ensure_capacity(int min_capacity)
    {
        if (min_capacity <= capacity && arr != nullptr) {
            return true;
        }

        int new_capacity = (capacity > 0 ? capacity : 1);
        while (new_capacity < min_capacity) {
            new_capacity *= 2;
        }

        T* temp = new (Heaps::SavestateHeap) T[new_capacity];
        if (!temp) {
#if SYRINGE_VECTOR_DEBUG
            OSReport("[SyringeVector] alloc failed cap=%d elem=%d\\n", new_capacity, (int)sizeof(T));
#endif
            return false;
        }

        if (arr != nullptr && current > 0) {
            memcpy(temp, arr, (size_t)current * sizeof(T));
        }

#if SYRINGE_VECTOR_DEBUG
        OSReport(
            "[SyringeVector] ensure old_ptr=%x new_ptr=%x old_cap=%d new_cap=%d elem=%d\n",
            (u32)arr,
            (u32)temp,
            capacity,
            new_capacity,
            (int)sizeof(T)
        );
#endif
        if (arr != nullptr) {
            delete[] arr;
        }
        arr = temp;
        capacity = new_capacity;
        return true;
    }

public:
    SyringeVector()
    {
        arr = nullptr;
        capacity = 0;
        current = 0;
#if SYRINGE_VECTOR_DEBUG
        OSReport("[SyringeVector] ctor alloc ptr=%x cap=%d elem=%d\n", (u32)arr, capacity, (int)sizeof(T));
#endif
    }

    ~SyringeVector()
    {
#if SYRINGE_VECTOR_DEBUG
        OSReport("[SyringeVector] dtor free ptr=%x cap=%d size=%d\n", (u32)arr, capacity, current);
#endif
        if (arr != nullptr) {
            delete[] arr;
        }
    }

    // Deleted copy constructor and assignment to prevent shallow copies
    SyringeVector(const SyringeVector&) = delete;
    SyringeVector& operator=(const SyringeVector&) = delete;

    void clear()
    {
    #if SYRINGE_VECTOR_DEBUG
        OSReport("[SyringeVector] clear free ptr=%x cap=%d\n", (u32)arr, capacity);
    #endif
        if (arr != nullptr) {
            delete[] arr;
        }
        arr = nullptr;
        capacity = 0;
        current = 0;
        ensure_capacity(1);
    #if SYRINGE_VECTOR_DEBUG
        OSReport("[SyringeVector] clear alloc ptr=%x cap=%d elem=%d\n", (u32)arr, capacity, (int)sizeof(T));
    #endif
    }

    void push(T data)
    {
        if (!ensure_capacity(current + 1)) {
            return;
        }

        memcpy(&arr[current], &data, sizeof(T));
#if SYRINGE_VECTOR_DEBUG
        OSReport("[SyringeVector] push [%d] ptr=%x data_ptr=%x sizeof=%d\n",
            current, (u32)&arr[current], (u32)&data, (int)sizeof(T));
#endif
        current++;
    }

    void push(T data, int index)
    {
        if (index < 0) {
            return;
        }

        if (!ensure_capacity(index + 1)) {
            return;
        }

        if (index == current)
        {
            push(data);
        }
        else
        {
            arr[index] = data;
            if (index >= current) {
                current = index + 1;
            }
        }
    }

    void erase(int index) {
        if (index < 0 || index >= current || arr == nullptr)
        {
            return;
        }

        T* temp = new (Heaps::SavestateHeap) T[capacity];
        if (!temp) {
            return;
        }

        if (index > 0) {
            memcpy(temp, arr, (size_t)index * sizeof(T));
        }

        int trailingCount = current - index - 1;
        if (trailingCount > 0) {
            memcpy(&temp[index], &arr[index + 1], (size_t)trailingCount * sizeof(T));
        }

        delete[] arr;
        arr = temp;
        current--;
    }

    T get(int index)
    {
        if (index < current)
            return arr[index];
    }

    void pop() { current--; }

    int size() { return current; }

    int getcapacity() { return capacity; }

    void setsize(int new_size)
    {
        if (new_size < 0)
        {
            return;
        }

        if(new_size > capacity)
        {
            if (!ensure_capacity(new_size)) {
                return;
            }
        }
        current = new_size;
    }

    void assign(size_t count, const T& value) {
        clear();
        int targetCount = (int)count;
        if (targetCount <= 0) {
            return;
        }

        if (!ensure_capacity(targetCount)) {
            return;
        }

        for (size_t i = 0; i < count; ++i) {
            arr[i] = value;
        }
        current = targetCount;
    }

    T* data() { return arr; }

    T& operator[](int index)
    {
        return arr[index];
    }
};

struct SavestateRegionInfo {
    bu32 address;
    bu32 size;
    char nameBuffer[30];
    u8 nameSize;
};

struct AllocationRegionEntry {
    bu32 address;
    bu32 size;
    char nameBuffer[30];
    u8 nameSize;
};

struct AllocationRegionDataHeader {
    bu32 regionCount;
};

struct StartLoopPayloadInfo {
    bu32 payloadSize;
    bu32 exiMaxPayloadBytes;
};

struct LoadStatePayloadHeader {
    bu32 regionCount;
};

static inline int AllocationRegionPayloadSize(bu32 regionCount)
{
    return sizeof(AllocationRegionDataHeader) + (regionCount * sizeof(AllocationRegionEntry));
}

static const int START_FRAME = 240;


namespace FrameLogic {
    // Variables
    extern u32 advanceFrames;
    extern u8 port;
    extern bool rollbackOn;
    extern bool networkChecked;
    extern SyringeVector<SavestateRegionInfo> activeRegions;

    // Hooks
    void beginFrame();
    void endMainLoop();
    void startFrameLoop();
    void getInputs();
    void getNetworkMode();
    __attribute__((naked)) void startFrameLoop2();
    __attribute__((naked)) void fixFrameLoop();
    void dump_gfMemoryPool_hook(void* pool);
    void dump_gfMemoryPool_hook2();
    void beginningOfFrameLoop();
    void push_gfFileIOManager_hook(gfFileIOManager* mgr, gfFileIORequest* req);
}

namespace Util {
    void printGameInputs(const gfPadStatus& pad);
    void printFrameData(const FrameData& fd);
    BrawlbackPad GamePadToBrawlbackPad(const gfPadStatus& pad);
    void PopulatePlayerFrameData(PlayerFrameData& pfd, bu8 port, bu8 pIdx);
    void InjectBrawlbackPadToPadStatus(gfPadStatus* gamePad, const BrawlbackPad& pad, int port);
}

namespace RollbackHooks {
    void InstallHooks(CoreApi* api);
}