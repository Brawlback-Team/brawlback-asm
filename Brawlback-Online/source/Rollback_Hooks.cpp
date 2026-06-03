#include "Rollback_Hooks.h"
#include "sy_core.h"
#include <modules.h>
#include <cstring>
#include "EXI_Hooks.h"
#include "utils.h"
#include <OS/OS.h>
#include <gf/gf_memory_pool.h>
#include <gf/gf_file_io_manager.h>
#include <gf/gf_application.h>
#include <OS/OSThread.h>
#include <sr/sr_common.h>
#include <ft/ft_manager.h>
#include <ut/ut_list.h>
#include <gf/gf_heap_manager.h>
#include <gf/gf_frame.h>
#include <gf/gf_scene.h>
#include <gf/gf_3d_scene.h>
#include <ip/ip_switch.h>
#include <sc/sc_melee.h>
#include <mem_exp_hooks.h>
#include <snd/snd_system.h>
#include <gf/gf_task_scheduler.h>
#define ROLLBACK_HOOKS_LOGGING 0
#if ROLLBACK_HOOKS_LOGGING
#define RBK_LOG(...) OSReport(__VA_ARGS__)
#else
#define RBK_LOG(...) do { } while (0)
#endif

bu32 gameProc(void* gfGameApplication, bu32 unk);
const char* ignoreHeaps = "Syringe SavestateHeap Sound Thread";
void FUN_800737e4(sndSystem* g_sndSystem);

namespace Util {
    void printInputs(const BrawlbackPad& pad) {
        
        RBK_LOG(" -- BB Pad --\n");
        RBK_LOG("StickX: %hhu ", pad.stickX);
        RBK_LOG("StickY: %hhu ", pad.stickY);
        RBK_LOG("CStickX: %hhu ", pad.cStickX);
        RBK_LOG("CStickY: %hhu\n", pad.cStickY);
        RBK_LOG("Buttons: ");
        RBK_LOG("Buttons: 0x%x", pad.buttons);
        RBK_LOG("holdButtons: 0x%x\n", pad.holdButtons);
        RBK_LOG(" ---------\n");
        
    }

    void printGameInputs(const gfPadStatus& pad) {
        
        RBK_LOG(" -- Game Pad --\n");
        RBK_LOG(" LAnalogue: %u    RAnalogue %u\n", pad.m_lTriggerAnalog, pad.m_rTriggerAnalog);
        RBK_LOG("StickX: %hhu ", pad.m_stickX);
        RBK_LOG("StickY: %hhu ", pad.m_stickY);
        RBK_LOG("CStickX: %hhu ", pad.m_subStickX);
        RBK_LOG("CStickY: %hhu\n", pad.m_subStickY);
        RBK_LOG("Buttons: ");
        RBK_LOG("B1: 0x%x ", pad.m_buttonsCurrentFrame);
        RBK_LOG("B2: 0x%x ", pad.m_buttonsCurrentFrame2);
        RBK_LOG("B3: 0x%x \n", pad.m_buttonsPressedThisFrame);
        RBK_LOG(" ---------\n");
        
    }
    void InjectBrawlbackPadToPadStatus(gfPadStatus* gamePad, const BrawlbackPad& pad, int port) {
        gamePad->m_controllerType = gfPadType::PadType::GCC;
        gamePad->m_error = gfPadError::NONE;
        gamePad->m_buttonsCurrentFrame.bits = pad._buttons;
        gamePad->m_buttonsCurrentFrame2.bits = pad.buttons;
        gamePad->m_buttonsReleasedThisFrame.bits = pad.releasedButtons;
        gamePad->m_buttonsHeld.bits = pad.holdButtons;
        gamePad->m_buttonsPressedThisFrame.bits = pad.rapidFireButtons;
        gamePad->m_buttonsPressedThisFrame2.bits = pad.newPressedButtons;
        gamePad->m_lTriggerAnalog = pad.LAnalogue;
        gamePad->m_rTriggerAnalog = pad.RAnalogue;
        gamePad->_0x36 = pad.LTrigger;
        gamePad->_0x37 = pad.RTrigger;
        gamePad->m_subStickX = pad.cStickX;
        gamePad->m_subStickY = pad.cStickY;
        gamePad->m_stickX = pad.stickX;
        gamePad->m_stickY = pad.stickY;
    }
    BrawlbackPad GamePadToBrawlbackPad(const gfPadStatus& pad) {
        BrawlbackPad ret = BrawlbackPad();
        ret._buttons = pad.m_buttonsCurrentFrame.bits;
        ret.buttons = pad.m_buttonsCurrentFrame2.bits;
        // *(ret.newPressedButtons-0x2) = (int)*(pad+0x14);
        ret.holdButtons = pad.m_buttonsHeld.bits;
        ret.rapidFireButtons = pad.m_buttonsPressedThisFrame.bits;
        ret.releasedButtons = pad.m_buttonsReleasedThisFrame.bits;
        ret.newPressedButtons = pad.m_buttonsPressedThisFrame2.bits;
        ret.LAnalogue = pad.m_lTriggerAnalog;
        ret.RAnalogue = pad.m_rTriggerAnalog;
        ret.LTrigger = pad._0x36;
        ret.RTrigger = pad._0x37;
        ret.cStickX = pad.m_subStickX;
        ret.cStickY = pad.m_subStickY;
        ret.stickX = pad.m_stickX;
        ret.stickY = pad.m_stickY;

        // OSReport("BUTTONS======\n");
        // OSReport("Buttons: 0x%x\n", pad._buttons);
        // OSReport("Buttons: 0x%x\n", pad.buttons);
        // OSReport("Buttons holdButtons: 0x%x\n", pad.holdButtons);
        // OSReport("Buttons rapidFireButtons: 0x%x\n", pad.rapidFireButtons);
        // OSReport("Buttons releasedButtons: 0x%x\n", pad.releasedButtons);
        // OSReport("Buttons newPressedButtons: 0x%x\n", pad.newPressedButtons);

        return ret;
    }
}
namespace FrameLogic {
    typedef void* (*GfMemoryPoolAllocFn)(void* heapAddr, size_t size, int align);
    typedef void (*GfMemoryPoolFreeFn)(u32 address);
    typedef void* (*IosAllocInternalFn)(int heapId, int size, u32 align);
    typedef int (*IosFreeFn)(int heapId, u32 address);
    typedef void (*GfPadSystemUpdateLowFn)(gfPadSystem* padSystem);
    typedef bu32 (*GameProcFn)(void* gfGameApplication, bu32 unk);

    static GfMemoryPoolAllocFn g_originalGfMemoryPoolAlloc = 0;
    static GfMemoryPoolFreeFn g_originalGfMemoryPoolFree = 0;
    static IosAllocInternalFn g_originalIosAllocInternal = 0;
    static IosFreeFn g_originalIosFree = 0;
    static GfPadSystemUpdateLowFn g_originalGfPadSystemUpdateLow = 0;
    static GameProcFn g_originalGameProc = 0;

    // Tracking mode toggle:
    // - false: incremental alloc/free tracking (current behavior)
    // - true: rebuild tracked regions via gfHeapManager::dumpAll() every frame
    static bool useDumpAllTrackingEachFrame = false;

    // Debug toggle for emitting pad inputs every simulated frame.
    static bool printInputsEveryFrame = true;

    u32 advanceFrames = 1;
    u8 port = 0;
    bool rollbackOn = false;
    bool networkChecked = false;
    bool dumpAllCaptureInProgress = false;
    bool initialRegionCaptureComplete = false;
    bool regionMutationInProgress = false;
    bool gameLogicStepInProgress = true;
    void* allocationRegionPacketBuffer = 0;
    size_t allocationRegionPacketCapacity = 0;
    SyringeVector<SavestateRegionInfo> activeRegions;

    // Generation counter incremented once per beginningOfFrameLoop call.
    // Each gfFileIORequest is tagged with the generation at push time so that
    // on rollback we can distinguish requests from before vs after the restore point.
    static u32 currentGeneration = 0;

    struct FileIORequestEntry {
        gfFileIORequest* req;
        u32 generation;
    };
    static const int kMaxTrackedRequests = 128; // matches utQueue capacity
    static FileIORequestEntry trackedRequests[kMaxTrackedRequests];
    static int trackedRequestCount = 0;

    struct AddressRange {
        bu32 start;
        bu32 size;
    };

    static const int kMaxTrackedFileIORanges = 1 + 2 + 128 + 128;
    static AddressRange trackedFileIORanges[kMaxTrackedFileIORanges];
    static int trackedFileIORangeCount = 0;

    // Keep START_LOOP chunks below a conservative transport-safe threshold.
    static const int kMaxExiPayloadBytesPerTransfer = 0x1000;

    static void SendAllocationRegionsDynamic();

    static void AddTrackedRequest(gfFileIORequest* req)
    {
        if (!req) {
            return;
        }
        // Keep the first-seen generation while the request stays queued.
        for (int i = 0; i < trackedRequestCount; i++) {
            if (trackedRequests[i].req == req) {
                return;
            }
        }
        if (trackedRequestCount >= kMaxTrackedRequests) {
            return;
        }
        trackedRequests[trackedRequestCount].req = req;
        trackedRequests[trackedRequestCount].generation = currentGeneration;
        trackedRequestCount++;
    }

    static u32 GetTrackedGeneration(gfFileIORequest* req)
    {
        for (int i = 0; i < trackedRequestCount; i++) {
            if (trackedRequests[i].req == req) {
                return trackedRequests[i].generation;
            }
        }
        return 0;
    }

    static bool IsRequestInQueue(gfFileIORequestQueue* queue, gfFileIORequest* req)
    {
        if (!queue) {
            return false;
        }
        for (u16 i = 0; i < queue->getCount(); i++) {
            if (queue->getRequest(i) == req) {
                return true;
            }
        }
        return false;
    }

    static bool IsRequestInAnyQueue(gfFileIORequest* req)
    {
        if (!g_gfFileIOManager) {
            return false;
        }
        return IsRequestInQueue(g_gfFileIOManager->getQueue1(), req) || IsRequestInQueue(g_gfFileIOManager->getQueue2(), req);
    }

    static bool IsRequestInQueue1(gfFileIORequest* req)
    {
        if (!g_gfFileIOManager) {
            return false;
        }
        return IsRequestInQueue(g_gfFileIOManager->getQueue1(), req);
    }

    static bool IsRequestInQueue2(gfFileIORequest* req)
    {
        if (!g_gfFileIOManager) {
            return false;
        }
        return IsRequestInQueue(g_gfFileIOManager->getQueue2(), req);
    }

    static void PruneTrackedRequestsNotInQueues()
    {
        int writeIndex = 0;
        for (int i = 0; i < trackedRequestCount; i++) {
            gfFileIORequest* req = trackedRequests[i].req;
            if (req && IsRequestInAnyQueue(req)) {
                if (writeIndex != i) {
                    trackedRequests[writeIndex] = trackedRequests[i];
                }
                writeIndex++;
            }
        }
        trackedRequestCount = writeIndex;
    }

    static void TrackQueuedRequests(gfFileIORequestQueue* queue)
    {
        if (!queue) {
            return;
        }

        u16 count = queue->getCount();
        for (u16 i = 0; i < count; i++) {
            AddTrackedRequest(queue->getRequest(i));
        }
    }

    // Refresh request->generation mapping by observing both queues.
    // This avoids hooking gfFileIOManager::push directly.
    static void RefreshTrackedRequestGenerations()
    {
        if (!g_gfFileIOManager) {
            trackedRequestCount = 0;
            return;
        }

        PruneTrackedRequestsNotInQueues();
        TrackQueuedRequests(g_gfFileIOManager->getQueue1());
        TrackQueuedRequests(g_gfFileIOManager->getQueue2());
    }

    // Settle a single in-flight request before loadstate.
    // If it has been dispatched to IOS (bit 1 of _unkFlags set) but the
    // callback hasn't fired yet (bit 0 clear), spin until IOS writes its
    // payload; then free the request.  If not yet dispatched, just free.
    // _unkFlags is at offset 0x17: bit 0 = callback done, bit 1 = dispatched.
    static void WaitForRequestThenFree(gfFileIORequest* req)
    {
        volatile u8* unkFlags = (volatile u8*)((bu32)req + 0x17);
        if ((*unkFlags >> 1) & 1) {
            // Dispatched to IOS — wait for the callback to write its payload.
            int timeout = 1000000;
            while (!(*unkFlags & 1) && timeout-- > 0) {}
            if (!(*unkFlags & 1)) {
                RBK_LOG("DrainFileIO: IOS callback timeout for request %p\n", req);
            }
        }
        // Guard against update() having freed the request while we waited.
        if (IsRequestInAnyQueue(req)) {
            g_gfFileIOManager->freeRequest(req);
        }
    }

    static void AddSnapshotRequest(gfFileIORequest* snapshot[], u32 snapshotGens[], int& count, gfFileIORequest* req)
    {
        if (!req || count >= kMaxTrackedRequests) {
            return;
        }

        for (int i = 0; i < count; i++) {
            if (snapshot[i] == req) {
                return;
            }
        }

        snapshot[count] = req;
        snapshotGens[count] = GetTrackedGeneration(req);
        count++;
    }

    // Before restoring game state, settle all queued IO requests.
    // Requests whose push generation is after rollbackTargetGeneration are from
    // "the future" relative to the restore point and are cancelled outright.
    // Requests from at or before the restore point wait for IOS to finish writing
    // their data so callbacks cannot corrupt the freshly-restored memory.
    static void DrainFileIO(u32 rollbackTargetGeneration)
    {
        if (!g_gfFileIOManager) {
            trackedRequestCount = 0;
            return;
        }

        RefreshTrackedRequestGenerations();

        // Snapshot both queues before we start freeing (freeRequest mutates them).
        static gfFileIORequest* snapshot[kMaxTrackedRequests];
        static u32 snapshotGens[kMaxTrackedRequests];
        int count = 0;

        gfFileIORequestQueue* queue1 = g_gfFileIOManager->getQueue1();
        if (queue1) {
            for (u16 i = 0; i < queue1->getCount() && count < kMaxTrackedRequests; i++) {
                AddSnapshotRequest(snapshot, snapshotGens, count, queue1->getRequest(i));
            }
        }

        gfFileIORequestQueue* queue2 = g_gfFileIOManager->getQueue2();
        if (queue2) {
            for (u16 i = 0; i < queue2->getCount() && count < kMaxTrackedRequests; i++) {
                AddSnapshotRequest(snapshot, snapshotGens, count, queue2->getRequest(i));
            }
        }

        for (int i = 0; i < count; i++) {
            gfFileIORequest* req = snapshot[i];
            if (!IsRequestInAnyQueue(req)) {
                continue; // already freed by update()
            }
            if (snapshotGens[i] > rollbackTargetGeneration) {
                // Request was submitted after the restore point — cancel it.
                g_gfFileIOManager->freeRequest(req);
            } else {
                // Request predates the restore point — let IOS finish writing.
                WaitForRequestThenFree(req);
            }
        }

        trackedRequestCount = 0;
    }

    static bool IsMeleeSceneActive()
    {
        gfSceneManager* sceneManager = gfSceneManager::getInstance();
        if (!sceneManager || !sceneManager->m_currentScene || !sceneManager->m_currentScene->m_sceneName) {
            return false;
        }

        return strcmp(sceneManager->m_currentScene->m_sceneName, "scMelee") == 0;
    }

    static bool ShouldTrackHeapName(const char* heap_name)
    {
        if (!heap_name) {
            return false;
        }

        if (strstr(ignoreHeaps, heap_name) != nullptr) {
            return false;
        }
        
        return true;
    }

    static bool IsAddressInRange(bu32 address, bu32 rangeStart, bu32 rangeSize)
    {
        if (rangeStart == 0 || rangeSize == 0) {
            return false;
        }

        bu32 rangeEnd = rangeStart + rangeSize;
        if (rangeEnd <= rangeStart) {
            return false;
        }

        return address >= rangeStart && address < rangeEnd;
    }

    static void ClearTrackedFileIORanges()
    {
        trackedFileIORangeCount = 0;
    }

    static void AddTrackedFileIORange(bu32 address, bu32 size)
    {
        if (!IsAddressInRange(address, address, size)) {
            return;
        }

        if (trackedFileIORangeCount >= kMaxTrackedFileIORanges) {
            return;
        }

        trackedFileIORanges[trackedFileIORangeCount].start = address;
        trackedFileIORanges[trackedFileIORangeCount].size = size;
        trackedFileIORangeCount++;
    }

    static void CaptureQueuedFileIORequestRanges(gfFileIORequestQueue* queue)
    {
        if (!queue) {
            return;
        }

        AddTrackedFileIORange((bu32)queue, sizeof(gfFileIORequestQueue));

        // gfFileIORequestQueue::m_queue is at offset 0x18.
        utQueue<gfFileIORequest*, 128>* requestQueue = *(utQueue<gfFileIORequest*, 128>**)((bu32)queue + 0x18);
        if (!requestQueue || requestQueue->getCount() == 0) {
            return;
        }

        u32 queueSize = requestQueue->size();
        for (u32 i = 0; i < queueSize; i++) {
            gfFileIORequest* request = requestQueue->m_elements[i];
            if (request) {
                AddTrackedFileIORange((bu32)request, sizeof(gfFileIORequest));
            }
        }
    }

    static void RefreshTrackedFileIORanges()
    {
        ClearTrackedFileIORanges();

        if (!g_gfFileIOManager) {
            return;
        }

        AddTrackedFileIORange((bu32)g_gfFileIOManager, sizeof(gfFileIOManager));

        gfFileIORequestQueue* queue1 = g_gfFileIOManager->getQueue1();
        gfFileIORequestQueue* queue2 = g_gfFileIOManager->getQueue2();

        CaptureQueuedFileIORequestRanges(queue1);
        CaptureQueuedFileIORequestRanges(queue2);
    }
    

    static bool IsSensibleAllocationRange(bu32 address, bu32 size)
    {
        if (address == 0 || size == 0) {
            return false;
        }

        // Guard against bogus capture values from clobbered registers.
        if (size > 0x10000000U) {
            return false;
        }

        bu32 end = address + size;
        if (end <= address) {
            return false;
        }

        return true;
    }
    static bool ShouldTrackRange(bu32 address, bu32 size)
    {
        if (!IsSensibleAllocationRange(address, size)) {
            return false;
        }

        for (int i = 0; i < trackedFileIORangeCount; i++) {
            bu32 trackedStart = trackedFileIORanges[i].start;
            bu32 trackedSize = trackedFileIORanges[i].size;
            bu32 trackedEnd = trackedStart + trackedSize;
            bu32 rangeEnd = address + size;
            if (trackedEnd <= trackedStart || rangeEnd <= address) {
                continue;
            }
            if (address < trackedEnd && trackedStart < rangeEnd) {
                return false;
            }
        }

        return true;
    }

    static bool HasActiveRegion(bu32 address, bu32 size)
    {
        int regionCount = activeRegions.size();
        for (int i = 0; i < regionCount; i++) {
            if (activeRegions[i].address == address && activeRegions[i].size == size) {
                return true;
            }
        }
        return false;
    }

    static bool HasActiveRegionAddress(bu32 address)
    {
        int regionCount = activeRegions.size();
        for (int i = 0; i < regionCount; i++) {
            if (activeRegions[i].address == address) {
                return true;
            }
        }
        return false;
    }

    static void AddManualRegionIfMissing(bu32 address, bu32 size, const char* name)
    {
        if (!name || !IsSensibleAllocationRange(address, size) || HasActiveRegion(address, size)) {
            return;
        }

        SavestateRegionInfo regionInfo;
        regionInfo.address = address;
        regionInfo.size = size;

        size_t nameLen = strlen(name);
        if (nameLen > 29) {
            nameLen = 29;
        }
        memcpy(regionInfo.nameBuffer, name, nameLen);
        regionInfo.nameBuffer[nameLen] = '\0';
        regionInfo.nameSize = (u8)nameLen;

        activeRegions.push(regionInfo);
    }

    static void RemoveActiveRegionByAddress(bu32 address)
    {
        int regionCount = activeRegions.size();
        for (int i = 0; i < regionCount; i++) {
            if (activeRegions[i].address == address) {
                int lastIndex = regionCount - 1;
                if (i != lastIndex) {
                    activeRegions[i] = activeRegions[lastIndex];
                }
                activeRegions.setsize(lastIndex);
                return;
            }
        }
    }

    static bu32 GetAllocatedBlockSize(void* allocatedAddress)
    {
        if (!allocatedAddress) {
            return 0;
        }

        bu32 address = (bu32)allocatedAddress;
        bu32 blockMetadata = *(bu32*)(address - 0xC);
        if (!blockMetadata) {
            return 0;
        }

        return *(bu32*)(blockMetadata + 0x4);
    }

    static void TrackAllocation(void* heapAddr, void* allocatedAddress)
    {
        if (!allocatedAddress || !heapAddr) {
            return;
        }

        const char* heapName = *(const char**)heapAddr;
        bu32 address = (bu32)allocatedAddress;
        bu32 size = GetAllocatedBlockSize(allocatedAddress);

        if (!ShouldTrackHeapName(heapName) || !ShouldTrackRange(address, size) || HasActiveRegionAddress(address)) {
            return;
        }

        SavestateRegionInfo regionInfo;
        regionInfo.address = address;
        regionInfo.size = size;

        size_t nameLen = strlen(heapName);
        if (nameLen > 29) {
            nameLen = 29;
        }
        memcpy(regionInfo.nameBuffer, heapName, nameLen);
        regionInfo.nameBuffer[nameLen] = '\0';
        regionInfo.nameSize = (u8)nameLen;

        activeRegions.push(regionInfo);
    }

    static bu32 AlignUp(bu32 value, bu32 alignment)
    {
        if (alignment == 0) {
            return value;
        }

        bu32 mask = alignment - 1;
        if ((alignment & mask) != 0) {
            return value;
        }

        bu32 alignedValue = (value + mask) & ~mask;
        if (alignedValue < value) {
            return value;
        }

        return alignedValue;
    }

    static void TrackIosAllocation(void* allocatedAddress, bu32 requestedSize, u32 alignment)
    {
        if (!allocatedAddress) {
            return;
        }

        bu32 address = (bu32)allocatedAddress;
        bu32 effectiveAlignment = alignment < 0x20 ? 0x20 : alignment;
        bu32 effectiveSize = AlignUp(requestedSize, 0x20);

        if (effectiveAlignment > 0x20) {
            effectiveSize = AlignUp(effectiveSize, effectiveAlignment);
        }

        if (!ShouldTrackRange(address, effectiveSize) || HasActiveRegionAddress(address)) {
            return;
        }

        AddManualRegionIfMissing(address, effectiveSize, "IOS");
    }

    static bool ShouldRunDynamicRegionTracking()
    {
        if (useDumpAllTrackingEachFrame) {
            return false;
        }

        // Ignore allocations that happen outside the game simulation step
        // (e.g. render-only allocations) so rollback tracking only captures
        // memory that can affect deterministic game state.
        if (!rollbackOn || !initialRegionCaptureComplete || dumpAllCaptureInProgress || regionMutationInProgress || !gameLogicStepInProgress) {
            return false;
        }

        return true;
    }

    static void* alloc_gfMemoryPool_hook(void* heapAddr, size_t size, int align)
    {
        if (!g_originalGfMemoryPoolAlloc) {
            return 0;
        }

        void* allocatedAddress = g_originalGfMemoryPoolAlloc(heapAddr, size, align);
        if (!ShouldRunDynamicRegionTracking()) {
            return allocatedAddress;
        }

        regionMutationInProgress = true;
        TrackAllocation(heapAddr, allocatedAddress);
        regionMutationInProgress = false;
        return allocatedAddress;
    }

    static bool DidPadStateChange(const gfPadStatus& a, const gfPadStatus& b)
    {
        if (a.m_buttonsCurrentFrame.bits != b.m_buttonsCurrentFrame.bits) return true;
        if (a.m_buttonsCurrentFrame2.bits != b.m_buttonsCurrentFrame2.bits) return true;
        if (a.m_buttonsHeld.bits != b.m_buttonsHeld.bits) return true;
        if (a.m_buttonsPressedThisFrame.bits != b.m_buttonsPressedThisFrame.bits) return true;
        if (a.m_buttonsReleasedThisFrame.bits != b.m_buttonsReleasedThisFrame.bits) return true;
        if (a.m_stickX != b.m_stickX || a.m_stickY != b.m_stickY) return true;
        if (a.m_subStickX != b.m_subStickX || a.m_subStickY != b.m_subStickY) return true;
        if (a.m_lTriggerAnalog != b.m_lTriggerAnalog || a.m_rTriggerAnalog != b.m_rTriggerAnalog) return true;
        return false;
    }

    static void PrintInputsForCurrentFrame()
    {
        if (!printInputsEveryFrame || !g_gfPadSystem) {
            return;
        }

        const gfPadStatus& p1 = g_gfPadSystem->m_systemPads[0];
        const gfPadStatus& p2 = g_gfPadSystem->m_systemPads[1];

        OSReport(
            "[RBK][Input] P1 btn=%x hold=%x press=%x stick=(%d,%d) c=(%d,%d) trg=(%u,%u) | "
            "P2 btn=%x hold=%x press=%x stick=(%d,%d) c=(%d,%d) trg=(%u,%u)\n",
            p1.m_buttonsCurrentFrame2.bits,
            p1.m_buttonsHeld.bits,
            p1.m_buttonsPressedThisFrame.bits,
            (int)p1.m_stickX,
            (int)p1.m_stickY,
            (int)p1.m_subStickX,
            (int)p1.m_subStickY,
            (unsigned int)p1.m_lTriggerAnalog,
            (unsigned int)p1.m_rTriggerAnalog,
            p2.m_buttonsCurrentFrame2.bits,
            p2.m_buttonsHeld.bits,
            p2.m_buttonsPressedThisFrame.bits,
            (int)p2.m_stickX,
            (int)p2.m_stickY,
            (int)p2.m_subStickX,
            (int)p2.m_subStickY,
            (unsigned int)p2.m_lTriggerAnalog,
            (unsigned int)p2.m_rTriggerAnalog
        );
    }

    static bu32 gameProc_hook(void* gfGameApplication, bu32 unk)
    {
        if (!g_originalGameProc) {
            return 1;
        }

        gameLogicStepInProgress = true;
        bu32 result = g_originalGameProc(gfGameApplication, unk);
        return result;
    }

    static void free_gfMemoryPool_hook(u32 address)
    {
        if (!g_originalGfMemoryPoolFree) {
            return;
        }

        g_originalGfMemoryPoolFree(address);
        if (address == 0 || !ShouldRunDynamicRegionTracking()) {
            return;
        }

        regionMutationInProgress = true;
        RemoveActiveRegionByAddress(address);
        regionMutationInProgress = false;
    }

    static void* iosAllocInternal_hook(int heapId, int size, u32 align)
    {
        if (!g_originalIosAllocInternal) {
            return 0;
        }

        void* allocatedAddress = g_originalIosAllocInternal(heapId, size, align);
        if (!ShouldRunDynamicRegionTracking()) {
            return allocatedAddress;
        }

        regionMutationInProgress = true;
        TrackIosAllocation(allocatedAddress, (bu32)size, align);
        regionMutationInProgress = false;
        return allocatedAddress;
    }

    static int iosFree_hook(int heapId, u32 address)
    {
        if (!g_originalIosFree) {
            return -4;
        }

        int result = g_originalIosFree(heapId, address);
        if (result != 0 || address == 0 || !ShouldRunDynamicRegionTracking()) {
            return result;
        }

        regionMutationInProgress = true;
        RemoveActiveRegionByAddress(address);
        regionMutationInProgress = false;
        return result;
    }

    static u8* AcquireAllocationRegionPacketBuffer(size_t requiredSize)
    {
        if (requiredSize == 0) {
            return 0;
        }

        if (allocationRegionPacketBuffer && allocationRegionPacketCapacity >= requiredSize) {
            return (u8*)allocationRegionPacketBuffer;
        }

        void* newBuffer = new (Heaps::SavestateHeap) u8[requiredSize];
        if (!newBuffer) {
            return 0;
        }

        if (allocationRegionPacketBuffer) {
            delete[] (u8*)allocationRegionPacketBuffer;
        }

        allocationRegionPacketBuffer = newBuffer;
        allocationRegionPacketCapacity = requiredSize;
        return (u8*)allocationRegionPacketBuffer;
    }

    static gfMemoryPool* FindHeapForAddress(bu32 address)
    {
        static const int kMaxHeapId = 0x47;
        for (int heapID = 1; heapID < kMaxHeapId; heapID++) {
            gfMemoryPool* pool = g_HeapInfos[heapID].m_memoryPool;
            if (!pool) continue;
            bu32 heapStart = (bu32)pool;
            bu32 heapSize = g_HeapInfos[heapID].m_size;
            if (heapSize == 0) continue;
            bu32 heapEnd = heapStart + heapSize;
            if (address >= heapStart && address < heapEnd) {
                return pool;
            }
        }
        return nullptr;
    }

    static void SendEXIPayloadChunked(unsigned char command, u8* payload, int payloadSize, int exiMaxPayloadBytes)
    {
        if (!payload || payloadSize <= 0 || exiMaxPayloadBytes <= 0) {
            return;
        }

        // EXIPacket::CreateAndSend prefixes the payload with a 1-byte command.
        // Keep each chunk within the announced EXI byte budget.
        int maxChunkPayloadBytes = exiMaxPayloadBytes - (int)sizeof(command);
        if (maxChunkPayloadBytes <= 0) {
            return;
        }

        int offset = 0;
        while (offset < payloadSize) {
            int chunkSize = payloadSize - offset;
            if (chunkSize > maxChunkPayloadBytes) {
                chunkSize = maxChunkPayloadBytes;
            }
            EXIPacket::CreateAndSend(command, payload + offset, (unsigned int)chunkSize);
            offset += chunkSize;
        }
    }

    static void SendLoadStateWithRegions()
    {
        int regionCount = activeRegions.size();
        if (regionCount < 0) {
            regionCount = 0;
        }

        int payloadSize = (int)(sizeof(LoadStatePayloadHeader) + (bu32)regionCount * sizeof(AllocationRegionEntry));

        u8* payload = AcquireAllocationRegionPacketBuffer((size_t)payloadSize);
        if (!payload) {
            return;
        }

        LoadStatePayloadHeader* header = (LoadStatePayloadHeader*)payload;
        header->regionCount = (bu32)regionCount;

        AllocationRegionEntry* entries = (AllocationRegionEntry*)(payload + sizeof(LoadStatePayloadHeader));
        for (int i = 0; i < regionCount; i++) {
            entries[i].address = activeRegions[i].address;
            entries[i].size = activeRegions[i].size;
            entries[i].nameSize = activeRegions[i].nameSize;
            memcpy(entries[i].nameBuffer, activeRegions[i].nameBuffer, activeRegions[i].nameSize);
        }

        StartLoopPayloadInfo payloadInfo = {};
        payloadInfo.payloadSize = (bu32)payloadSize;
        payloadInfo.exiMaxPayloadBytes = (bu32)kMaxExiPayloadBytesPerTransfer;

        EXIPacket::CreateAndSend(EXICommand::CMD_LOAD_STATE_SIZE, &payloadInfo, sizeof(payloadInfo));
        SendEXIPayloadChunked(EXICommand::CMD_LOAD_STATE, payload, payloadSize, kMaxExiPayloadBytesPerTransfer);
        bu32 missingCount = 0;
        EXIHooks::readEXI(&missingCount, sizeof(bu32), EXI_CHAN_1, 0, EXI_FREQ_32HZ);
        Utils::swapByteOrder(missingCount);
        if(missingCount == 0)
        {
            RBK_LOG("No missing regions\n");
            return;
        }
        SyringeVector<AllocationRegionEntry> missingEntries;
        missingEntries.setsize(missingCount);
        EXIPacket::CreateAndSend(EXICommand::CMD_GET_MISSING_REGIONS);
        EXIHooks::readEXI(missingEntries.data(), sizeof(AllocationRegionEntry) * missingCount, EXI_CHAN_1, 0, EXI_FREQ_32HZ);
        for(int i = 0; i < missingCount; i++)
        {
            RBK_LOG("Missing region %d/%d: address=%x size=%x\n", i + 1, missingCount, missingEntries[i].address, missingEntries[i].size);
            if (IsSensibleAllocationRange(missingEntries[i].address, missingEntries[i].size) && FindHeapForAddress(missingEntries[i].address) != nullptr) {
                gfMemoryPool::gfPoolFree(missingEntries[i].address);
            }
        }
    }

    static void SendAllocationRegionsDynamic()
    {
        int regionCount = activeRegions.size();
        RBK_LOG("Sending %d active regions\n", regionCount);
        if (regionCount <= 0) {
            return;
        }

        int payloadSize = AllocationRegionPayloadSize((bu32)regionCount);

        u8* payload = AcquireAllocationRegionPacketBuffer(payloadSize);
        if (!payload) {
            return;
        }

        AllocationRegionDataHeader* header = (AllocationRegionDataHeader*)payload;
        header->regionCount = (bu32)regionCount;

        AllocationRegionEntry* entries = (AllocationRegionEntry*)(payload + sizeof(AllocationRegionDataHeader));
        for (int i = 0; i < regionCount; i++) {
            entries[i].address = activeRegions[i].address;
            entries[i].size = activeRegions[i].size;
            entries[i].nameSize = activeRegions[i].nameSize;
            memcpy(entries[i].nameBuffer, activeRegions[i].nameBuffer, activeRegions[i].nameSize);
        }

        StartLoopPayloadInfo payloadInfo = {};
        payloadInfo.payloadSize = (bu32)payloadSize;
        payloadInfo.exiMaxPayloadBytes = (bu32)kMaxExiPayloadBytesPerTransfer;

        EXIPacket::CreateAndSend(EXICommand::CMD_START_LOOP_SIZE, &payloadInfo, sizeof(payloadInfo));
        SendEXIPayloadChunked(EXICommand::CMD_START_LOOP, payload, payloadSize, kMaxExiPayloadBytesPerTransfer);
    }

    static void RebuildActiveRegionsFromDumpAll()
    {
        activeRegions.clear();
        RefreshTrackedFileIORanges();
        dumpAllCaptureInProgress = true;
        gfHeapManager::dumpAll();
        dumpAllCaptureInProgress = false;
        initialRegionCaptureComplete = true;
    }

    static void CaptureActiveRegions()
    {
        if (!useDumpAllTrackingEachFrame && initialRegionCaptureComplete) {
            return;
        }

        RebuildActiveRegionsFromDumpAll();
    }

    void endMainLoop()
    {
        Utils::SaveRegs();
        if(rollbackOn)
        {
            SendAllocationRegionsDynamic();
            EXIPacket::CreateAndSend(EXICommand::CMD_END_FRAME);
        }
        Utils::RestoreRegs();
    }
    void endFrameLoop()
    {
        if(rollbackOn)
        {
            EXIPacket::CreateAndSend(EXICommand::CMD_END_LOOP);
        }
    }
    __attribute__((naked)) void fixFrameLoop()
    {
        asm volatile(
            "skip:\n\t"
            "lis 12, 0x8001\n\t"
            "ori 12, 12, 0x739c\n\t"
            "mtctr 12\n\t"
            "bctr\n\t"
            :
            : "m" (rollbackOn)
        );
    }
    void startFrameLoop()
    {
        EXIPacket::CreateAndSend(EXICommand::CMD_GET_PORT);
        EXIHooks::readEXI(&port, sizeof(u8), EXI_CHAN_1, 0, EXI_FREQ_32HZ);
        BrawlbackPad pad = Util::GamePadToBrawlbackPad(g_gfPadSystem->m_systemPads[port]);
        EXIPacket::CreateAndSend(EXICommand::CMD_START_LOOP_ROLLBACK, &pad, sizeof(BrawlbackPad));
        EXIHooks::readEXI(&advanceFrames, sizeof(u32), EXI_CHAN_1, 0, EXI_FREQ_32HZ);
        Utils::swapByteOrder(advanceFrames);
        RBK_LOG("ADVANCE FRAMES: %x\n", advanceFrames);
    }
    static void getRemoteInputs()
    {
        if(rollbackOn)
        {
            BrawlbackPad pad;
            EXIPacket::CreateAndSend(EXICommand::CMD_GET_REMOTE_INPUTS);
            EXIHooks::readEXI(&pad, sizeof(BrawlbackPad), EXI_CHAN_1, 0, EXI_FREQ_32HZ);
            Utils::swapByteOrder(pad._buttons);
            Utils::swapByteOrder(pad.buttons);
            Utils::swapByteOrder(pad.holdButtons);
            Utils::swapByteOrder(pad.releasedButtons);
            Utils::swapByteOrder(pad.rapidFireButtons);
            Utils::swapByteOrder(pad.newPressedButtons);
            Util::InjectBrawlbackPadToPadStatus(&g_gfPadSystem->m_systemPads[port == 0 ? 1 : 0], pad, port == 0 ? 1 : 0);
        }
    }
    static void getLocalInputs()
    {
        if(rollbackOn)
        {
            // TODO: Doubles?
            // This is kinda weird -- Probably what we need to actually do is make another struct with ports and stuff and send that
            //                        for instances where the users change the ports in the netplay window. 
            BrawlbackPad pad;
            EXIPacket::CreateAndSend(EXICommand::CMD_GET_LOCAL_INPUTS);
            EXIHooks::readEXI(&pad, sizeof(BrawlbackPad), EXI_CHAN_1, 0, EXI_FREQ_32HZ);
            Utils::swapByteOrder(pad._buttons);
            Utils::swapByteOrder(pad.buttons);
            Utils::swapByteOrder(pad.holdButtons);
            Utils::swapByteOrder(pad.releasedButtons);
            Utils::swapByteOrder(pad.rapidFireButtons);
            Utils::swapByteOrder(pad.newPressedButtons);
            Util::InjectBrawlbackPadToPadStatus(&g_gfPadSystem->m_systemPads[port], pad, port);
            
        }
    }
    void getInputs()
    {
        getLocalInputs();
        getRemoteInputs();
    }
    __attribute__((naked)) void startFrameLoop2()
    {
        asm volatile (
            "li 19, 0x0\n\t"
            "lwz 24, %0\n\t"
            "lis 12, 0x8001\n\t"
            "ori 12, 12, 0x734c\n\t"
            "mtctr 12\n\t"
            "bctr\n\t"
            :
            : "m" (advanceFrames)
        );
    }
    void getNetworkMode()
    {
        if(!networkChecked)
        {
            EXIPacket::CreateAndSend(EXICommand::CMD_ROLLBACK_CHECK);
            u32 rollbackOnInt;
            EXIHooks::readEXI(&rollbackOnInt, sizeof(u32), EXI_CHAN_1, 0, EXI_FREQ_32HZ);
            Utils::swapByteOrder(rollbackOnInt);
            rollbackOn = rollbackOnInt != 0;
            networkChecked = true;
        }
    }
    void dump_gfMemoryPool_hook(void* pool)
    {
        Utils::SaveRegs();
        if (!pool) {
            Utils::RestoreRegs();
            return;
        }

        const char* heapNamePtr = *(const char**)pool;
        bu32 addr_start = (bu32)pool;
        bu32 addr_end = *(bu32*)((bu32)pool + 0x8);
        bu32 mem_size = (addr_end > addr_start) ? (addr_end - addr_start) : 0;

        if (!heapNamePtr || mem_size == 0) {
            Utils::RestoreRegs();
            return;
        }

        char heap_name[256];
        strncpy(heap_name, heapNamePtr, sizeof(heap_name) - 1);
        heap_name[sizeof(heap_name) - 1] = '\0';
        bool sensible = IsSensibleAllocationRange(addr_start, mem_size);
        if (ShouldTrackHeapName(heap_name) && sensible && ShouldTrackRange(addr_start, mem_size))
        {
            SavestateRegionInfo regionInfo;
            regionInfo.address = addr_start;
            regionInfo.size = mem_size;
            size_t nameLen = strlen(heap_name);
            if (nameLen > 29) nameLen = 29;
            memcpy(regionInfo.nameBuffer, heap_name, nameLen);
            regionInfo.nameBuffer[nameLen] = '\0';
            regionInfo.nameSize = (u8)nameLen;
            activeRegions.push(regionInfo);
        }
        else if (!sensible)
        {
            RBK_LOG("Skipping dumpAll capture of region with invalid range: start=%x size=%x\n", addr_start, mem_size);
        }
        else 
        {
            RBK_LOG("Skipping dumpAll capture of heap '%s' at region start=%x size=%x\n", heap_name, addr_start, mem_size);
        }
        Utils::RestoreRegs();
    }
    void beginningOfFrameLoop()
    {
        Utils::SaveRegs();
        void* gameApp = (void*)0x805b4fd8;

        // [Update Network]
        getNetworkMode();

        if(rollbackOn)
        {
            // Seed baseline regions once; dynamic alloc/free tracking is gated on this.
            CaptureActiveRegions();
            RefreshTrackedRequestGenerations();
            startFrameLoop();
            PrintInputsForCurrentFrame();
            // [Execute Rollbacks] — rollback condition: advanceFrames > 1
            if(advanceFrames > 1)
            {
                // Drain queued IO before restoring state.
                // Requests submitted after the restore point are cancelled outright.
                // Requests that predate the restore point wait for IOS to finish writing
                // their payload so the callback cannot corrupt freshly-restored memory.
                u32 rollbackTargetGeneration = (advanceFrames - 1 <= currentGeneration)
                    ? currentGeneration - (advanceFrames - 1)
                    : 0;
                //DrainFileIO(rollbackTargetGeneration);

                RBK_LOG("Advancing %d frames\n", advanceFrames);
                for(int i = 0; i < advanceFrames - 1; i++)
                {
                    // [Update Input]
                    getInputs();
                    g_gfPadSystem->updateSystem();
                    // [Update Game]
                    bu32 procResult = gameProc(gameApp, i);
                    endFrameLoop();
                }
                advanceFrames = 1;
            }
        }
        currentGeneration++;
        Utils::RestoreRegs();
    }
}
namespace RollbackHooks {
    void InstallHooks(CoreApi* api)
    {
    // Setup State
        //savestateHeap = MEMCreateExpHeapEx((void*) 0x94000000, 0x3FBFFFF, 0);
        gfMemoryPool::create((void*)0x94000000, "SavestateHeap", Heaps::SavestateHeap, 0x3FBFFFF, 1);

        //Rollback
        // mainLoopSub calls gameProc at 0x80017358. Hook gameProc itself (0x80017618)
        // so region deltas are sent immediately after each game logic step.
        api->syReplaceFunc(0x80017618, reinterpret_cast<void*>(FrameLogic::gameProc_hook), reinterpret_cast<void**>(&FrameLogic::g_originalGameProc));
        api->syReplaceFunc(0x80025c58, reinterpret_cast<void*>(FrameLogic::alloc_gfMemoryPool_hook), reinterpret_cast<void**>(&FrameLogic::g_originalGfMemoryPoolAlloc));
        api->syReplaceFunc(0x8002632c, reinterpret_cast<void*>(FrameLogic::free_gfMemoryPool_hook), reinterpret_cast<void**>(&FrameLogic::g_originalGfMemoryPoolFree));
        //api->syReplaceFunc(0x80213598, reinterpret_cast<void*>(FrameLogic::iosAllocInternal_hook), reinterpret_cast<void**>(&FrameLogic::g_originalIosAllocInternal));
        //api->syReplaceFunc(0x802137a8, reinterpret_cast<void*>(FrameLogic::iosFree_hook), reinterpret_cast<void**>(&FrameLogic::g_originalIosFree));
        api->syInlineHook(0x80026258, reinterpret_cast<void*>(FrameLogic::dump_gfMemoryPool_hook));
        api->syInlineHook(0x800171b4, reinterpret_cast<void*>(FrameLogic::beginningOfFrameLoop));
        api->sySimpleHook(0x80017348, reinterpret_cast<void*>(FrameLogic::startFrameLoop2));
        api->syInlineHook(0x80017504, reinterpret_cast<void*>(FrameLogic::endMainLoop));
    }
}
