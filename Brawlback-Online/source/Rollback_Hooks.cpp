#include "Rollback_Hooks.h"
#include "sy_core.h"
#include <modules.h>
#include <cstring>
#include "EXI_Hooks.h"
#include "utils.h"
#include <OS/OS.h>
#include <OS/OSReset.h>
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
#include <gf/gf_pad_system.h>
#include <ip/ip_switch.h>
#include <sc/sc_melee.h>
#include <gm/gm_global.h>
#include <gm/gm_global_mode_melee.h>
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
void frameStartInit(void* gfApplication);
void gfErrorCheck_check();
void gfErrorManager_update(void* errorManager);
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
    typedef void* (*GlobalNewFn)(size_t size);
    typedef void* (*GlobalNewWithHeapFn)(size_t size, int heapType);
    typedef void (*GlobalDeleteFn)(void* address);
    typedef void* (*IosAllocInternalFn)(int heapId, int size, u32 align);
    typedef int (*IosFreeFn)(int heapId, u32 address);
    typedef void (*GfPadSystemUpdateSystemFn)(gfPadSystem* padSystem);
    typedef bu32 (*GameProcFn)(void* gfGameApplication, bu32 unk);
    typedef bool (*IsBreakGameProcLoopFn)(int ipSwitchPtr);
    typedef void (*SqToMeleeSetNextFn)(void* sqToMelee);

    static GfMemoryPoolAllocFn g_originalGfMemoryPoolAlloc = 0;
    static GfMemoryPoolFreeFn g_originalGfMemoryPoolFree = 0;
    static GlobalNewFn g_originalGlobalNew = 0;
    static GlobalNewWithHeapFn g_originalGlobalNewWithHeap = 0;
    static GlobalNewWithHeapFn g_originalGlobalNewArrayWithHeap = 0;
    static GlobalDeleteFn g_originalGlobalDelete = 0;
    static GlobalDeleteFn g_originalGlobalDeleteArray = 0;
    static IosAllocInternalFn g_originalIosAllocInternal = 0;
    static IosFreeFn g_originalIosFree = 0;
    static GfPadSystemUpdateSystemFn g_originalGfPadSystemUpdateSystem = 0;
    static GameProcFn g_originalGameProc = 0;
    static IsBreakGameProcLoopFn g_originalIsBreakGameProcLoop = 0;
    static SqToMeleeSetNextFn g_originalSqToMeleeSetNext = 0;

    // Tracking mode toggle:
    // - false: incremental alloc/free tracking (current behavior)
    // - true: rebuild tracked regions via gfHeapManager::dumpAll() every frame
    static bool useDumpAllTrackingEachFrame = false;

    // Use a static gameplay-focused region list captured once at boot.
    // This disables alloc/free driven region mutation and keeps region identity stable.
    static bool useStaticGameplayBootRegions = true;

    // Debug toggle for emitting pad inputs every simulated frame.
    static bool printInputsEveryFrame = false;

    // Master frame-loop logic gate. Keep off to run dumpAll+address logging only.
    static bool enableNonDumpAllFrameLogic = true;

    u32 advanceFrames = 1;
    u8 port = 0;
    bool rollbackOn = false;
    bool networkChecked = false;
    bool dumpAllCaptureInProgress = false;
    bool initialRegionCaptureComplete = false;
    bool regionMutationInProgress = false;
    bool gameLogicStepInProgress = true;
    bool allowManualPadSystemUpdate = false;
    bool loggedHeapInfos = false;
    bool compareDumpAllVsDynamicEveryFrame = false;
    bool includeRegisteredGfPoolsInDumpCapture = false;
    bool collectingDumpAllCompareStats = false;
    int dumpAllCompareHookCalls = 0;
    int dumpAllCompareAccepted = 0;
    int dumpAllCompareSkippedRegistered = 0;
    int dumpAllCompareSkippedMissingNameOrSize = 0;
    int dumpAllCompareSkippedHeapName = 0;
    int dumpAllCompareSkippedRange = 0;
    int dumpAllCompareSkippedSensible = 0;
    void* allocationRegionPacketBuffer = 0;
    size_t allocationRegionPacketCapacity = 0;
    SyringeVector<SavestateRegionInfo> activeRegions;
    SyringeVector<SavestateRegionInfo> dynamicRegionSnapshot;
    SyringeVector<SavestateRegionInfo> dumpAllRegionSnapshot;

    struct BufferedFrameHeader {
        u32 generation;
        u32 startRegionIndex;
        u32 regionCount;
    };

    SyringeVector<BufferedFrameHeader> bufferedDumpAllFrames;
    SyringeVector<SavestateRegionInfo> bufferedDumpAllRegions;
    bool dumpedBufferedRegionsOnShutdown = false;
    u32 beginningOfFrameLoopCallCount = 0;
    u32 endMainLoopCallCount = 0;
    u32 endMainLoopBufferedSampleCount = 0;

    // Generation counter incremented once per beginningOfFrameLoop call.
    // Each gfFileIORequest is tagged with the generation at push time so that
    // on rollback we can distinguish requests from before vs after the restore point.
    static u32 currentGeneration = 0;
    static u32 rollbackTargetGeneration = 0;

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
        if(IsRequestInQueue1(req))
        {
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

    static bool IsReadRequest(gfFileIORequest* req)
    {
        if (!req) {
            return false;
        }

        return req->m_operationFlags == GF_FILE_IO_READ_OPERATION ||
               req->m_operationFlags == GF_FILE_IO_READ_DIR_OPERATION;
    }

    // Before restoring game state, settle all queued IO requests.
    // Requests from both queue1 and queue2 are snapshotted before restore so
    // in-flight IOS callbacks cannot mutate restored memory with stale payloads.
    static void DrainFileIO(u32 rollbackTargetGeneration)
    {
        if (!g_gfFileIOManager) {
            trackedRequestCount = 0;
            return;
        }

        RefreshTrackedRequestGenerations();

        // Snapshot active queue1 before we start freeing (freeRequest mutates it).
        static gfFileIORequest* snapshot[kMaxTrackedRequests];
        static u32 snapshotGens[kMaxTrackedRequests];
        int count = 0;

        gfFileIORequestQueue* queue1 = g_gfFileIOManager->getQueue1();
        if (queue1) {
            for (u16 i = 0; i < queue1->getCount() && count < kMaxTrackedRequests; i++) {
                gfFileIORequest* req = queue1->getRequest(i);
                if (!IsReadRequest(req)) {
                    AddSnapshotRequest(snapshot, snapshotGens, count, req);
                }
            }
        }

        gfFileIORequestQueue* queue2 = g_gfFileIOManager->getQueue2();
        if (queue2) {
            for (u16 i = 0; i < queue2->getCount() && count < kMaxTrackedRequests; i++) {
                gfFileIORequest* req = queue2->getRequest(i);
                if (!IsReadRequest(req)) {
                    AddSnapshotRequest(snapshot, snapshotGens, count, req);
                }
            }
        }

        for (int i = 0; i < count; i++) {
            gfFileIORequest* req = snapshot[i];
            if (!IsRequestInQueue1(req)) {
                continue; // already freed by update()
            }
            WaitForRequestThenFree(req);
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

    static bool IsSystemShutdownRequested()
    {
        // OS global shutdown flag (OSHardware.h: MIOS_SHUTDOWN_FLAG @ 0x80003164)
        return (*(volatile u32*)0x80003164) != 0;
    }

    static bool ShouldTrackHeapName(const char* heap_name)
    {
        static const char* gameplayHeapNameKeywords[] = {
            // Core gameplay systems impacted by player inputs.
            "fighter", "ft",
            "stage", "gr", "ground",
            "item", "it",
            "weapon", "projectile", "wn", "wp",
            "melee"
        };

        if (!heap_name) {
            return false;
        }

        if (strstr(ignoreHeaps, heap_name) != nullptr) {
            return false;
        }

        int keywordCount = (int)(sizeof(gameplayHeapNameKeywords) / sizeof(gameplayHeapNameKeywords[0]));
        for (int i = 0; i < keywordCount; i++) {
            if (strstr(heap_name, gameplayHeapNameKeywords[i]) != nullptr) {
                return true;
            }
        }

        return false;
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

    static bool IsRegisteredGfMemoryPoolAddress(bu32 address)
    {
        if (address == 0) {
            return false;
        }

        for (int heapID = 1; heapID < 0x47; heapID++) {
            gfMemoryPool* pool = g_HeapInfos[heapID].m_memoryPool;
            if (pool && (bu32)pool == address) {
                return true;
            }
        }

        return false;
    }

    static bu32 ResolveGfMemoryPoolEndAddress(bu32 poolAddress)
    {
        if (poolAddress == 0) {
            return 0;
        }

        // Prefer authoritative heap table size when this pool is registered.
        for (int heapID = 1; heapID < 0x47; heapID++) {
            gfMemoryPool* pool = g_HeapInfos[heapID].m_memoryPool;
            u32 size = g_HeapInfos[heapID].m_size;
            if (pool && (bu32)pool == poolAddress && size != 0) {
                bu32 endFromHeapInfo = poolAddress + size;
                if (endFromHeapInfo > poolAddress) {
                    return endFromHeapInfo;
                }
            }
        }

        // Fallback: gfMemoryPool layout stores end at +0x8 and size at +0xC.
        bu32 endFromObject = *(bu32*)(poolAddress + 0x8);
        if (endFromObject > poolAddress) {
            return endFromObject;
        }

        u32 sizeFromObject = *(u32*)(poolAddress + 0xC);
        if (sizeFromObject != 0) {
            bu32 endFromSize = poolAddress + sizeFromObject;
            if (endFromSize > poolAddress) {
                return endFromSize;
            }
        }

        return 0;
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
            bu32 range_end = address + size;
            if (trackedEnd <= trackedStart || range_end <= address) {
                continue;
            }
            if (address < trackedEnd && trackedStart < range_end) {
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
        if (!name || !ShouldTrackHeapName(name) || !IsSensibleAllocationRange(address, size) || HasActiveRegion(address, size)) {
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

    static void AddStaticRegionByAddress(bu32 address, bu32 size, const char* name)
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
        int i = 0;
        int regionCount = activeRegions.size();
        while (i < regionCount) {
            if (activeRegions[i].address == address) {
                regionCount--;
                if (i != regionCount) {
                    activeRegions[i] = activeRegions[regionCount];
                }
                activeRegions.pop();
            } else {
                i++;
            }
        }
    }

    static void CopyRegions(SyringeVector<SavestateRegionInfo>& src, SyringeVector<SavestateRegionInfo>& dst)
    {
        int count = src.size();
        dst.clear();
        if (count <= 0) {
            return;
        }

        dst.setsize(count);
        for (int i = 0; i < count; i++) {
            dst[i] = src[i];
        }
    }

    static bool ContainsRegionAddress(SyringeVector<SavestateRegionInfo>& regions, bu32 address)
    {
        int count = regions.size();
        for (int i = 0; i < count; i++) {
            if (regions[i].address == address) {
                return true;
            }
        }
        return false;
    }

    static unsigned long long SumRegionBytes(SyringeVector<SavestateRegionInfo>& regions)
    {
        unsigned long long total = 0;
        int count = regions.size();
        for (int i = 0; i < count; i++) {
            total += (unsigned long long)regions[i].size;
        }
        return total;
    }

    static void LogRegionDiffByAddress(const char* lhsName, SyringeVector<SavestateRegionInfo>& lhs, const char* rhsName, SyringeVector<SavestateRegionInfo>& rhs)
    {
        int missingCount = 0;
        int lhsCount = lhs.size();
        for (int i = 0; i < lhsCount; i++) {
            if (ContainsRegionAddress(rhs, lhs[i].address)) {
                continue;
            }

            if (missingCount < 32) {
                RBK_LOG("[RBK][RegionCompare] %s-only addr=%x size=%x name=%s\n",
                    lhsName,
                    lhs[i].address,
                    lhs[i].size,
                    lhs[i].nameBuffer);
            }
            missingCount++;
        }

        RBK_LOG("[RBK][RegionCompare] %s-only count=%d (showing up to 32) vs %s\n", lhsName, missingCount, rhsName);
    }

    static void CompareAndLogDynamicVsDumpAllRegions()
    {
        if (!compareDumpAllVsDynamicEveryFrame) {
            return;
        }
        if (dumpAllCaptureInProgress || regionMutationInProgress) {
            return;
        }

        CopyRegions(activeRegions, dynamicRegionSnapshot);

        activeRegions.clear();
        RefreshTrackedFileIORanges();
        collectingDumpAllCompareStats = true;
        dumpAllCompareHookCalls = 0;
        dumpAllCompareAccepted = 0;
        dumpAllCompareSkippedRegistered = 0;
        dumpAllCompareSkippedMissingNameOrSize = 0;
        dumpAllCompareSkippedHeapName = 0;
        dumpAllCompareSkippedRange = 0;
        dumpAllCompareSkippedSensible = 0;
        dumpAllCaptureInProgress = true;
        includeRegisteredGfPoolsInDumpCapture = true;
        gfHeapManager::dumpAll();
        includeRegisteredGfPoolsInDumpCapture = false;
        dumpAllCaptureInProgress = false;
        collectingDumpAllCompareStats = false;

        CopyRegions(activeRegions, dumpAllRegionSnapshot);
        CopyRegions(dynamicRegionSnapshot, activeRegions);

        int dynamicCount = dynamicRegionSnapshot.size();
        int dumpAllCount = dumpAllRegionSnapshot.size();
        unsigned long long dynamicBytes = SumRegionBytes(dynamicRegionSnapshot);
        unsigned long long dumpAllBytes = SumRegionBytes(dumpAllRegionSnapshot);

        RBK_LOG("[RBK][RegionCompare] dynamic count=%d bytes=%llu | dumpAll count=%d bytes=%llu\n",
            dynamicCount,
            dynamicBytes,
            dumpAllCount,
            dumpAllBytes);

        RBK_LOG("[RBK][RegionCompare] dumpHook calls=%d accepted=%d skipped: registered=%d missingNameOrSize=%d heapName=%d range=%d sensible=%d\n",
            dumpAllCompareHookCalls,
            dumpAllCompareAccepted,
            dumpAllCompareSkippedRegistered,
            dumpAllCompareSkippedMissingNameOrSize,
            dumpAllCompareSkippedHeapName,
            dumpAllCompareSkippedRange,
            dumpAllCompareSkippedSensible);

        LogRegionDiffByAddress("dynamic", dynamicRegionSnapshot, "dumpAll", dumpAllRegionSnapshot);
        LogRegionDiffByAddress("dumpAll", dumpAllRegionSnapshot, "dynamic", dynamicRegionSnapshot);
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

    static void TrackAllocation(void* heapAddr, void* allocatedAddress, size_t size)
    {
        if (!allocatedAddress || !heapAddr) {
            return;
        }

        const char* heapName = *(const char**)heapAddr;
        bu32 address = (bu32)allocatedAddress;
        if (!ShouldTrackHeapName(heapName) || !ShouldTrackRange(address, size) || HasActiveRegionAddress(address)) {
            return;
        }

        SavestateRegionInfo regionInfo;
        regionInfo.address = address;
        regionInfo.size = (bu32)size;

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
        if (useStaticGameplayBootRegions) {
            return false;
        }

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
        TrackAllocation(heapAddr, allocatedAddress, size);
        regionMutationInProgress = false;
        return allocatedAddress;
    }

    static void TrackGlobalAllocation(void* allocatedAddress, size_t requestedSize, const char* name)
    {
        if (!allocatedAddress) {
            return;
        }

        bu32 address = (bu32)allocatedAddress;
        bu32 size = AlignUp((bu32)requestedSize, 0x20);
        if (size == 0) {
            return;
        }

        if (!ShouldTrackRange(address, size) || HasActiveRegionAddress(address)) {
            return;
        }

        AddManualRegionIfMissing(address, size, name);
    }

    static void* globalNew_hook(size_t size)
    {
        if (!g_originalGlobalNew) {
            return 0;
        }

        void* allocatedAddress = g_originalGlobalNew(size);
        if (!ShouldRunDynamicRegionTracking()) {
            return allocatedAddress;
        }

        regionMutationInProgress = true;
        TrackGlobalAllocation(allocatedAddress, size, "__nw");
        regionMutationInProgress = false;
        return allocatedAddress;
    }

    static void* globalNewWithHeap_hook(size_t size, int heapType)
    {
        if (!g_originalGlobalNewWithHeap) {
            return 0;
        }

        void* allocatedAddress = g_originalGlobalNewWithHeap(size, heapType);
        if (!ShouldRunDynamicRegionTracking()) {
            return allocatedAddress;
        }

        regionMutationInProgress = true;
        TrackGlobalAllocation(allocatedAddress, size, "__nw");
        regionMutationInProgress = false;
        return allocatedAddress;
    }

    static void* globalNewArrayWithHeap_hook(size_t size, int heapType)
    {
        if (!g_originalGlobalNewArrayWithHeap) {
            return 0;
        }

        void* allocatedAddress = g_originalGlobalNewArrayWithHeap(size, heapType);
        if (!ShouldRunDynamicRegionTracking()) {
            return allocatedAddress;
        }

        regionMutationInProgress = true;
        TrackGlobalAllocation(allocatedAddress, size, "__nwa");
        regionMutationInProgress = false;
        return allocatedAddress;
    }

    static void globalDelete_hook(void* address)
    {
        if (!g_originalGlobalDelete) {
            return;
        }

        g_originalGlobalDelete(address);
        if (!address || !ShouldRunDynamicRegionTracking()) {
            return;
        }

        regionMutationInProgress = true;
        RemoveActiveRegionByAddress((bu32)address);
        regionMutationInProgress = false;
    }

    static void globalDeleteArray_hook(void* address)
    {
        if (!g_originalGlobalDeleteArray) {
            return;
        }

        g_originalGlobalDeleteArray(address);
        if (!address || !ShouldRunDynamicRegionTracking()) {
            return;
        }

        regionMutationInProgress = true;
        RemoveActiveRegionByAddress((bu32)address);
        regionMutationInProgress = false;
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

        RBK_LOG(
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

    static void updateSystem_hook(gfPadSystem* padSystem)
    {
        if (!g_originalGfPadSystemUpdateSystem || rollbackOn) {
            return;
        }

        g_originalGfPadSystemUpdateSystem(padSystem);
    }

    static void runManualPadSystemUpdate()
    {
        if (!g_gfPadSystem) {
            return;
        }
        g_gfPadSystem->updateSystem();
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

    static void LogRegisteredGfMemoryPools()
    {
        if (loggedHeapInfos) {
            return;
        }
        loggedHeapInfos = true;

        static const int kMaxHeapId = 0x47;
        RBK_LOG("[RBK] g_HeapInfos @ 0x80494958\n");
        for (int heapID = 1; heapID < kMaxHeapId; heapID++) {
            gfMemoryPool* pool = g_HeapInfos[heapID].m_memoryPool;
            if (!pool) {
                continue;
            }

            const char* name = g_HeapInfos[heapID].m_name ? g_HeapInfos[heapID].m_name : "<unnamed>";
            u32 size = g_HeapInfos[heapID].m_size;
            RBK_LOG("[RBK] g_HeapInfos[%d] name=%s pool=%x size=%x\n", heapID, name, (bu32)pool, size);
        }
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

    static int BuildUniqueRegionEntries(AllocationRegionEntry* entries, int maxEntries)
    {
        if (!entries || maxEntries <= 0) {
            return 0;
        }

        int activeCount = activeRegions.size();
        if (activeCount <= 0) {
            return 0;
        }

        int uniqueCount = 0;
        for (int i = 0; i < activeCount; i++) {
            bu32 address = activeRegions[i].address;
            if (address == 0) {
                continue;
            }

            int existingIndex = -1;
            for (int j = 0; j < uniqueCount; j++) {
                if (entries[j].address == address) {
                    existingIndex = j;
                    break;
                }
            }

            int writeIndex = existingIndex;
            if (writeIndex < 0) {
                if (uniqueCount >= maxEntries) {
                    break;
                }
                writeIndex = uniqueCount;
                uniqueCount++;
            }

            entries[writeIndex].address = activeRegions[i].address;
            entries[writeIndex].size = activeRegions[i].size;
            entries[writeIndex].nameSize = activeRegions[i].nameSize;
            memcpy(entries[writeIndex].nameBuffer, activeRegions[i].nameBuffer, activeRegions[i].nameSize);
        }

        return uniqueCount;
    }

    static void SendLoadStateWithRegions()
    {
        int maxRegionCount = activeRegions.size();
        if (maxRegionCount <= 0) {
            return;
        }

        int payloadSize = (int)(sizeof(LoadStatePayloadHeader) + (bu32)maxRegionCount * sizeof(AllocationRegionEntry));

        u8* payload = AcquireAllocationRegionPacketBuffer((size_t)payloadSize);
        if (!payload) {
            return;
        }

        LoadStatePayloadHeader* header = (LoadStatePayloadHeader*)payload;
        AllocationRegionEntry* entries = (AllocationRegionEntry*)(payload + sizeof(LoadStatePayloadHeader));
        int regionCount = BuildUniqueRegionEntries(entries, maxRegionCount);
        if (regionCount <= 0) {
            return;
        }

        header->regionCount = (bu32)regionCount;
        payloadSize = (int)(sizeof(LoadStatePayloadHeader) + (bu32)regionCount * sizeof(AllocationRegionEntry));

        StartLoopPayloadInfo payloadInfo = {};
        payloadInfo.payloadSize = (bu32)payloadSize;
        payloadInfo.exiMaxPayloadBytes = (bu32)kMaxExiPayloadBytesPerTransfer;

        EXIPacket::CreateAndSend(EXICommand::CMD_LOAD_STATE_SIZE, &payloadInfo, sizeof(payloadInfo));
        SendEXIPayloadChunked(EXICommand::CMD_LOAD_STATE, payload, payloadSize, kMaxExiPayloadBytesPerTransfer);
    }

    static void SendAllocationRegionsDynamic()
    {
        int maxRegionCount = activeRegions.size();
        if (maxRegionCount <= 0) {
            return;
        }

        int payloadSize = AllocationRegionPayloadSize((bu32)maxRegionCount);

        u8* payload = AcquireAllocationRegionPacketBuffer(payloadSize);
        if (!payload) {
            return;
        }

        AllocationRegionDataHeader* header = (AllocationRegionDataHeader*)payload;
        AllocationRegionEntry* entries = (AllocationRegionEntry*)(payload + sizeof(AllocationRegionDataHeader));
        int regionCount = BuildUniqueRegionEntries(entries, maxRegionCount);
        RBK_LOG("Sending %d active regions\n", regionCount);
        if (regionCount <= 0) {
            return;
        }

        header->regionCount = (bu32)regionCount;
        payloadSize = AllocationRegionPayloadSize((bu32)regionCount);

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

    static void RebuildActiveRegionsFromStaticGameplayHeaps()
    {
        activeRegions.clear();
        RefreshTrackedFileIORanges();

        struct StaticGameplayRegion {
            bu32 address;
            bu32 size;
            const char* name;
        };

        // Hardcoded from symbol mapping (RSBE01.lst) and type sizes from headers.
        static const StaticGameplayRegion kStaticGameplayRegions[] = {
            // Pointer globals used as roots to gameplay systems.
            { 0x8059FF80, (bu32)sizeof(bu32), "g_gfSceneRoot_ptr" },
            { 0x8059FFAC, (bu32)sizeof(bu32), "g_gfGameApplication_ptr" },
            { 0x805A0040, (bu32)sizeof(bu32), "g_gfPadSystem_ptr" },
            { 0x805A00E0, (bu32)sizeof(bu32), "g_GameGlobal_ptr" },

            // Core melee-scene globals.
            { 0x90FF50C0, (bu32)sizeof(scMelee), "g_scMelee" },
            { 0x90180F20, (bu32)sizeof(gmGlobalModeMelee), "g_globalMelee" },
            { 0x901812A0, (bu32)sizeof(GameFrame), "g_GameFrame" },

            // PadSystem concrete object symbol from RSBE01.lst.
            { 0x805BACC0, (bu32)sizeof(gfPadSystem), "g_PadSystem" },
        };

        int regionCount = (int)(sizeof(kStaticGameplayRegions) / sizeof(kStaticGameplayRegions[0]));
        for (int i = 0; i < regionCount; i++) {
            AddStaticRegionByAddress(
                kStaticGameplayRegions[i].address,
                kStaticGameplayRegions[i].size,
                kStaticGameplayRegions[i].name
            );
        }

        // Follow hardcoded pointer globals so we snapshot the mutable objects
        // that input processing writes into each frame.
        bu32 padSystemAddress = *(bu32*)0x805A0040;
        AddStaticRegionByAddress(padSystemAddress, (bu32)sizeof(gfPadSystem), "*g_gfPadSystem");

        bu32 gameGlobalAddress = *(bu32*)0x805A00E0;
        AddStaticRegionByAddress(gameGlobalAddress, (bu32)sizeof(GameGlobal), "*g_GameGlobal");

        bu32 gameApplicationAddress = *(bu32*)0x8059FFAC;
        AddStaticRegionByAddress(gameApplicationAddress, (bu32)sizeof(gfApplication), "*g_gfGameApplication");

        bu32 sceneRootAddress = *(bu32*)0x8059FF80;
        AddStaticRegionByAddress(sceneRootAddress, (bu32)sizeof(gfSceneRoot), "*g_gfSceneRoot");

        initialRegionCaptureComplete = true;
    }

    static void CaptureActiveRegions()
    {
        if (!useDumpAllTrackingEachFrame && initialRegionCaptureComplete) {
            return;
        }

        if (useStaticGameplayBootRegions) {
            RebuildActiveRegionsFromStaticGameplayHeaps();
            return;
        }

        RebuildActiveRegionsFromDumpAll();
    }

    static void BufferActiveRegionAddressesForFrame()
    {
        if (dumpedBufferedRegionsOnShutdown) {
            return;
        }

        int regionCount = activeRegions.size();

        BufferedFrameHeader frameHeader = {};
        frameHeader.generation = currentGeneration;
        frameHeader.startRegionIndex = (u32)bufferedDumpAllRegions.size();
        frameHeader.regionCount = (u32)regionCount;
        bufferedDumpAllFrames.push(frameHeader);

        for (int i = 0; i < regionCount; i++) {
            bufferedDumpAllRegions.push(activeRegions[i]);
        }
    }

    static void DumpBufferedRegionAddressesOnShutdown()
    {
        if (dumpedBufferedRegionsOnShutdown) {
            return;
        }
        dumpedBufferedRegionsOnShutdown = true;

        int frameCount = bufferedDumpAllFrames.size();
        int totalRegionCount = bufferedDumpAllRegions.size();
        OSReport(
            "[RBK] hook counters: beginLoop=%u endMainLoop=%u endMainLoopSamples=%u\n",
            beginningOfFrameLoopCallCount,
            endMainLoopCallCount,
            endMainLoopBufferedSampleCount
        );
        OSReport("[RBK] dumpAll buffered frames=%d regions=%d\n", frameCount, totalRegionCount);

        for (int frameIdx = 0; frameIdx < frameCount; frameIdx++) {
            const BufferedFrameHeader& frame = bufferedDumpAllFrames[frameIdx];
            OSReport(
                "[RBK] frame[%d] gen=%u regionCount=%u\n",
                frameIdx,
                frame.generation,
                frame.regionCount
            );

            u32 start = frame.startRegionIndex;
            u32 end = start + frame.regionCount;
            if (end > (u32)totalRegionCount) {
                end = (u32)totalRegionCount;
            }

            for (u32 idx = start; idx < end; idx++) {
                const SavestateRegionInfo& region = bufferedDumpAllRegions[(int)idx];
                OSReport(
                    "[RBK]   region[%u] addr=%08x size=%08x name=%s\n",
                    idx - start,
                    region.address,
                    region.size,
                    region.nameBuffer
                );
            }
        }
    }

    struct DumpAllRegionLogFlusher {
        ~DumpAllRegionLogFlusher()
        {
            DumpBufferedRegionAddressesOnShutdown();
        }
    };

    static DumpAllRegionLogFlusher s_dumpAllRegionLogFlusher;
    static int loopCounter = 0;
    static SyringeVector<gfPadStatus> inputBuffers[2] = {{}, {}};
    static int pendingSaveCount = 0;
    static u32 requestedSubstepsForCurrentLoop = 0;
    static bool syntheticGameProcLoopInProgress = false;
    static bool forcedGameProcLoopFlag = false;
    static u8 savedGameProcLoopFlagBit = 0;

    static volatile u8* GetGameProcLoopFlagsByte()
    {
        if (!g_gfApplication) {
            return 0;
        }

        // mainLoopSub checks gfApplication byte at +0xED and breaks the
        // substep loop when the 0x04 bit is clear (field106_0xed >> 2).
        return (volatile u8*)((u8*)g_gfApplication + 0xED);
    }

    static u32 GetRequestedSubsteps()
    {
        return requestedSubstepsForCurrentLoop;
    }

    static void ForceGameProcLoopFlagIfNeeded()
    {
        if (!rollbackOn || GetRequestedSubsteps() <= 1) {
            return;
        }

        volatile u8* flags = GetGameProcLoopFlagsByte();
        if (!flags) {
            return;
        }

        savedGameProcLoopFlagBit = *flags & 0x04;
        *flags = (u8)(*flags | 0x04);
        forcedGameProcLoopFlag = true;
    }

    static void RestoreGameProcLoopFlag()
    {
        if (!forcedGameProcLoopFlag) {
            return;
        }

        volatile u8* flags = GetGameProcLoopFlagsByte();
        if (flags) {
            *flags = (u8)((*flags & (u8)~0x04) | savedGameProcLoopFlagBit);
        }

        forcedGameProcLoopFlag = false;
        savedGameProcLoopFlagBit = 0;
    }

    void endMainLoop()
    {
        Utils::SaveRegs();
        endMainLoopCallCount++;

        // Fallback capture path: if the beginningOfFrameLoop hook is not firing,
        // sample from endMainLoop so shutdown dump still has data.
        if (useDumpAllTrackingEachFrame && !dumpedBufferedRegionsOnShutdown && beginningOfFrameLoopCallCount == 0) {
            CaptureActiveRegions();
            BufferActiveRegionAddressesForFrame();
            endMainLoopBufferedSampleCount++;

            if (bufferedDumpAllFrames.size() > 0 && IsSystemShutdownRequested()) {
                DumpBufferedRegionAddressesOnShutdown();
            }
        }

        if (!dumpedBufferedRegionsOnShutdown && bufferedDumpAllFrames.size() > 0 && IsSystemShutdownRequested()) {
            DumpBufferedRegionAddressesOnShutdown();
        }

        if(rollbackOn)
        {
            loopCounter = 0;
            inputBuffers[0].clear();
            inputBuffers[1].clear();
            requestedSubstepsForCurrentLoop = 0;
            EXIPacket::CreateAndSend(EXICommand::CMD_END_FRAME);
        }

        RestoreGameProcLoopFlag();
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
    static u8 count = 0;
    static void ResetFrameBufferSyncStateAfterLoad()
    {
        if (!g_gfApplication) {
            return;
        }

        // gfApplication embeds gfFrameBuffer at offset 0. After loadstate,
        // stale XFB in-use flags can leave sync__gfFrameBuffer waiting forever.
        volatile u8* frameBuffer = (volatile u8*)g_gfApplication;
        u8 xfbCount = frameBuffer[0x4];
        if (xfbCount == 0 || xfbCount > 4) {
            xfbCount = 2;
        }

        for (u8 idx = 0; idx < xfbCount; idx++) {
            volatile u32* inUse = (volatile u32*)((u8*)frameBuffer + 0x0C + ((u32)idx * 8));
            *inUse = 0;
        }

        frameBuffer[0x6] = 0;
        frameBuffer[0x7] = 0;
        frameBuffer[0x74] &= (u8)~0x20;
        RBK_LOG("[RBK] ResetFrameBufferSyncStateAfterLoad xfbCount=%u\n", xfbCount);
    }

    void startFrameLoop()
    {
        EXIPacket::CreateAndSend(EXICommand::CMD_GET_PORT);
        EXIHooks::readEXI(&port, sizeof(u8), EXI_CHAN_1, 0, EXI_FREQ_32HZ);
        BrawlbackPad pad = Util::GamePadToBrawlbackPad(g_gfPadSystem->m_systemPads[port]);
        EXIPacket::CreateAndSend(EXICommand::CMD_START_LOOP_ROLLBACK, &pad, sizeof(BrawlbackPad));
        EXIHooks::readEXI(&count, sizeof(u8), EXI_CHAN_1, 0, EXI_FREQ_32HZ);
    }
    static void getRemoteInputs(bu32 frame)
    {
        if(rollbackOn)
        {
            BrawlbackPad pad;
            EXIPacket::CreateAndSend(EXICommand::CMD_GET_REMOTE_INPUTS, &frame, sizeof(bu32));
            EXIHooks::readEXI(&pad, sizeof(BrawlbackPad), EXI_CHAN_1, 0, EXI_FREQ_32HZ);
            Utils::swapByteOrder(pad._buttons);
            Utils::swapByteOrder(pad.buttons);
            Utils::swapByteOrder(pad.holdButtons);
            Utils::swapByteOrder(pad.releasedButtons);
            Utils::swapByteOrder(pad.rapidFireButtons);
            Utils::swapByteOrder(pad.newPressedButtons);
            inputBuffers[port == 0 ? 1 : 0].push({});
            Util::InjectBrawlbackPadToPadStatus(&inputBuffers[port == 0 ? 1 : 0][inputBuffers[port == 0 ? 1 : 0].size() - 1], pad, port == 0 ? 1 : 0);
        }
    }
    static void getLocalInputs(bu32 frame)
    {
        if(rollbackOn)
        {
            // TODO: Doubles?
            // This is kinda weird -- Probably what we need to actually do is make another struct with ports and stuff and send that
            //                        for instances where the users change the ports in the netplay window. 
            BrawlbackPad pad;
            EXIPacket::CreateAndSend(EXICommand::CMD_GET_LOCAL_INPUTS, &frame, sizeof(bu32));
            EXIHooks::readEXI(&pad, sizeof(BrawlbackPad), EXI_CHAN_1, 0, EXI_FREQ_32HZ);
            Utils::swapByteOrder(pad._buttons);
            Utils::swapByteOrder(pad.buttons);
            Utils::swapByteOrder(pad.holdButtons);
            Utils::swapByteOrder(pad.releasedButtons);
            Utils::swapByteOrder(pad.rapidFireButtons);
            Utils::swapByteOrder(pad.newPressedButtons);
            inputBuffers[port].push({});
            Util::InjectBrawlbackPadToPadStatus(&inputBuffers[port][inputBuffers[port].size() - 1], pad, port);
        }
    }
    void getInputs(bu32 frame)
    {
        getLocalInputs(frame);
        getRemoteInputs(frame);
    }
    static bs32 resultFrame = 0;
    static u32 currentFrame = 0;

    static void QueueFrameSave()
    {
        if (pendingSaveCount < 64) {
            pendingSaveCount++;
        }
    }

    static void ClearQueuedFrameSaves()
    {
        pendingSaveCount = 0;
    }
    static u8 uVar7 = 1;
    void startFrameLoop3()
    {
        Utils::SaveRegs();
        advanceFrames = 0;
        u8* callbacks = new (Heaps::SavestateHeap) u8[sizeof(u8) * count];
        EXIHooks::readEXI(callbacks, sizeof(u8) * count, EXI_CHAN_1, 0, EXI_FREQ_32HZ);
        rollbackTargetGeneration = 0;
        for (int i = 0; i < count; i++) {
            if (callbacks[i] == 3 || callbacks[i] == 4) {
                rollbackTargetGeneration++;
            }
        }
        for(int i = 0; i < count; i++)
        {
            enum GekkoCallbackCode : u8
            {
                CALLBACK_NONE = 0,
                CALLBACK_SAVE = 1,
                CALLBACK_LOAD = 2,
                CALLBACK_ADVANCE = 3,
                CALLBACK_ADVANCE_ROLLBACK = 4,
                CALLBACK_ADVANCE_RUNAHEAD = 5
            };
            switch(callbacks[i])
            {
                u8 result;
                case GekkoCallbackCode::CALLBACK_SAVE:
                {
                    RBK_LOG("[RBK][SAVE] QueueFrameSave currentFrame=%u pendingBefore=%d\n", currentFrame, pendingSaveCount);
                    QueueFrameSave();
                    RBK_LOG("[RBK][SAVE] pendingAfter=%d\n", pendingSaveCount);
                    break;
                }
                case GekkoCallbackCode::CALLBACK_LOAD:
                {
                    DrainFileIO(rollbackTargetGeneration);
                    EXIPacket::CreateAndSend(EXICommand::CMD_EXECUTE_LOAD);
                    break;
                }
                case GekkoCallbackCode::CALLBACK_ADVANCE:
                case GekkoCallbackCode::CALLBACK_ADVANCE_ROLLBACK:
                {
                    EXIPacket::CreateAndSend(EXICommand::CMD_EXECUTE_ADVANCE);
                    EXIHooks::readEXI(&resultFrame, sizeof(bs32), EXI_CHAN_1, 0, EXI_FREQ_32HZ);
                    if(resultFrame != -1)
                    {
                        // Keep in-game frame tracking aligned to the host's authoritative frame.
                        RBK_LOG("[RBK][ADVANCE] resultFrame=%d currentFrame(old)=%u\n", resultFrame, currentFrame);
                        currentFrame = (u32)resultFrame;
                        RBK_LOG("[RBK][ADVANCE] currentFrame(new)=%u\n", currentFrame);
                        OSReport("Advance result frame: %d\n", resultFrame);
                        advanceFrames++;
                        getInputs((bu32)resultFrame);
                    }
                    break;
                }
                default:
                    break;
            }
        }
        delete[] callbacks;
        u32 requestedSubsteps = advanceFrames;
        if (requestedSubsteps > 0xFF) {
            requestedSubsteps = 0xFF;
        }
        requestedSubstepsForCurrentLoop = requestedSubsteps;
        uVar7 = (u8)requestedSubsteps;

        RBK_LOG(
            "[RBK][LOOP] startFrameLoop3 count=%u advanceFrames=%u p0=%d p1=%d uVar7=%u\n",
            count,
            advanceFrames,
            inputBuffers[0].size(),
            inputBuffers[1].size(),
            uVar7
        );

        // mainLoopSub can unconditionally break after the first gameProc call
        // unless this bit is set. Force it only for rollback multi-substep runs.
        ForceGameProcLoopFlagIfNeeded();

        Utils::RestoreRegs();
    }
    static __attribute__((naked)) void startFrameLoop4()
    {
        asm volatile(
            "lbz 20, %0\n\t"
            "mr	4, 20\n\t"
            "lis 12, 0x8001\n\t"
            "ori 12, 12, 0x72D8\n\t"
            "mtctr 12\n\t"
            "mr 3, 26\n\t"
            "bctr\n\t"
            : 
            : "m" (uVar7)
            : "20"
        );
    }
    __attribute__((naked)) void startFrameLoop5()
    {
        asm volatile(
            "lbz 20, %0\n\t"
            "lis 12, 0x8001\n\t"
            "ori 12, 12, 0x72a8\n\t"
            "mtctr 12\n\t"
            "bctr\n\t"
            : 
            : "m" (uVar7)
            : "20"
        );
    }
    static __attribute__((naked)) void startFrameLoop6()
    {
        asm volatile(
            "li	19, 0\n\t"
            "lbz 24, %0\n\t"
            "lis 12, 0x8001\n\t"
            "ori 12, 12, 0x734c\n\t"
            "mtctr 12\n\t"
            "lwz 3, 0xFC(23)\n\t"
            "bctr\n\t"
            : 
            : "m" (uVar7)
            : "20"
        );
    }
    __attribute__((naked)) void startFrameLoop2()
    {
        asm volatile(
            "li 24, 0\n\t"
            "lbz 20, %0\n\t"
            "lis 12, 0x8001\n\t"
            "ori 12, 12, 0x7314\n\t"
            "mtctr 12\n\t"
            "lhz 3, 0xF8(23)\n\t"
            "bctr\n\t"
            : 
            : "m" (uVar7)
            : "20"
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
    void dump_gfMemoryPool_hook()
    {
        Utils::SaveRegs();
        bu32 allocationStart = 0;
        bu32 allocationEnd = 0;
        bu32 allocationSize = 0;
        bu32 allocationId = 0;

        asm volatile(
            "mr %0, 4\n\t"
            "mr %1, 5\n\t"
            "mr %2, 6\n\t"
            "mr %3, 7\n\t"
            : "=r"(allocationStart), "=r"(allocationEnd), "=r"(allocationSize), "=r"(allocationId)
            :
            :
        );

        if (collectingDumpAllCompareStats) {
            dumpAllCompareHookCalls++;
        }

        bu32 addr_start = (bu32)allocationStart;
        bu32 addr_end = (bu32)allocationEnd;
        bu32 mem_size = allocationSize;

        if (addr_start == 0) {
            Utils::RestoreRegs();
            return;
        }

        if (mem_size == 0 && addr_end > addr_start) {
            mem_size = addr_end - addr_start;
        }
        if (addr_end == 0 && mem_size > 0) {
            addr_end = addr_start + mem_size;
        }

        const char* heapNamePtr = nullptr;
        for (int heapID = 1; heapID < 0x47; heapID++) {
            gfMemoryPool* pool = g_HeapInfos[heapID].m_memoryPool;
            u32 heapSize = g_HeapInfos[heapID].m_size;
            if (!pool || heapSize == 0) {
                continue;
            }

            bu32 heapStart = (bu32)pool;
            bu32 heapEnd = heapStart + heapSize;
            if (heapEnd <= heapStart) {
                continue;
            }

            if (addr_start >= heapStart && addr_start < heapEnd) {
                heapNamePtr = g_HeapInfos[heapID].m_name;
                break;
            }
        }

        if (mem_size == 0) {
            if (collectingDumpAllCompareStats) {
                dumpAllCompareSkippedMissingNameOrSize++;
            }
            Utils::RestoreRegs();
            return;
        }

        char heap_name[256];
        if (heapNamePtr) {
            strncpy(heap_name, heapNamePtr, sizeof(heap_name) - 1);
        } else {
            strncpy(heap_name, "dumpAll", sizeof(heap_name) - 1);
        }
        heap_name[sizeof(heap_name) - 1] = '\0';
        bool sensible = IsSensibleAllocationRange(addr_start, mem_size);
        bool trackByName = useDumpAllTrackingEachFrame ? true : ShouldTrackHeapName(heap_name);
        bool trackByRange = ShouldTrackRange(addr_start, mem_size);
        if (trackByName && sensible && trackByRange)
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
            if (collectingDumpAllCompareStats) {
                dumpAllCompareAccepted++;
            }
        }
        else if (!sensible)
        {
            if (collectingDumpAllCompareStats) {
                dumpAllCompareSkippedSensible++;
            }
            RBK_LOG("Skipping dumpAll capture of region with invalid range: start=%x size=%x\n", addr_start, mem_size);
        }
        else 
        {
            if (collectingDumpAllCompareStats) {
                if (!trackByName) {
                    dumpAllCompareSkippedHeapName++;
                } else if (!trackByRange) {
                    dumpAllCompareSkippedRange++;
                }
            }
            RBK_LOG("Skipping dumpAll alloc capture of heap '%s' at region start=%x end=%x size=%x id=%x\n", heap_name, addr_start, addr_end, mem_size, allocationId);
        }
        Utils::RestoreRegs();
    }
    void beginningOfFrameLoop()
    {
        Utils::SaveRegs();
        beginningOfFrameLoopCallCount++;

        if (enableNonDumpAllFrameLogic) {
            // [Update Network]
            getNetworkMode();

            if(rollbackOn)
            {
                RefreshTrackedRequestGenerations();
                startFrameLoop();
                PrintInputsForCurrentFrame();
                // [Execute Rollbacks] — rollback condition: advanceFrames > 1
            }
        }
        currentGeneration++;
        Utils::RestoreRegs();
    }
    static bu32 gameProc_hook(void* gfGameApplication, bu32 unk)
    {
        if (!g_originalGameProc) {
            return 1;
        }

        u32 requestedSubsteps = rollbackOn ? GetRequestedSubsteps() : 1;

        if (rollbackOn && requestedSubsteps == 0) {
            return 0;
        }

        // Fallback path: if mainLoopSub only reaches gameProc once (unk==0)
        // while rollback requested multiple substeps, execute the remaining
        // substeps here to keep simulation depth aligned with rollback intent.
        if (
            rollbackOn &&
            !syntheticGameProcLoopInProgress &&
            requestedSubsteps > 1 &&
            unk == 0
        ) {
            syntheticGameProcLoopInProgress = true;
            bu32 finalResult = 0;

            for (u32 substep = 0; substep < requestedSubsteps; substep++) {
                bool canInjectPads =
                    g_gfPadSystem != nullptr &&
                    loopCounter >= 0 &&
                    loopCounter < inputBuffers[0].size() &&
                    loopCounter < inputBuffers[1].size();

                if (canInjectPads) {
                    g_gfPadSystem->m_systemPads[0] = inputBuffers[0][loopCounter];
                    g_gfPadSystem->m_systemPads[1] = inputBuffers[1][loopCounter];
                    runManualPadSystemUpdate();
                }

                bu32 result = g_originalGameProc(gfGameApplication, substep);
                if ((substep + 1) < requestedSubsteps) {
                    result = 0;
                }

                RBK_LOG("[RBK] [BEFORE SAVE] gameProc_hook generation=%u loopCounter=%d frame=%u substep=%u synthetic=1\n", currentGeneration, loopCounter, currentFrame, substep);
                if (pendingSaveCount > 0) {
                    u8 result2 = 0;
                    EXIPacket::CreateAndSend(EXICommand::CMD_EXECUTE_SAVE, &currentFrame, sizeof(currentFrame));
                    EXIHooks::readEXI(&result2, sizeof(u8), EXI_CHAN_1, 0, EXI_FREQ_32HZ);
                    pendingSaveCount--;
                    RBK_LOG("[RBK][SAVE] Executed save for frame=%u result=%u pendingRemaining=%d\n", currentFrame, result2, pendingSaveCount);
                }
                RBK_LOG("[RBK] [AFTER SAVE] gameProc_hook generation=%u loopCounter=%d substep=%u synthetic=1\n", currentGeneration, loopCounter, substep);

                loopCounter++;
                finalResult = result;
            }

            syntheticGameProcLoopInProgress = false;
            return finalResult;
        }

        // During rollback stepping, loopCounter can temporarily outrun captured
        // inputs; avoid OOB reads and keep engine state stable.
        bool canInjectPads =
            rollbackOn &&
            g_gfPadSystem != nullptr &&
            loopCounter >= 0 &&
            loopCounter < inputBuffers[0].size() &&
            loopCounter < inputBuffers[1].size();

        if (canInjectPads) {
            g_gfPadSystem->m_systemPads[0] = inputBuffers[0][loopCounter];
            g_gfPadSystem->m_systemPads[1] = inputBuffers[1][loopCounter];
            runManualPadSystemUpdate();
        } else if (rollbackOn) {
            RBK_LOG(
                "[RBK] gameProc_hook skipped pad inject loopCounter=%d p0=%d p1=%d padSys=%x\n",
                loopCounter,
                inputBuffers[0].size(),
                inputBuffers[1].size(),
                (u32)g_gfPadSystem
            );
        }

        bu32 result = g_originalGameProc(gfGameApplication, unk);

        // mainLoopSub breaks immediately when gameProc returns non-zero
        // (cmpwi r20,0 ; bne break). For rollback multi-substep execution,
        // keep intermediate substeps non-breaking and preserve the original
        // return only on the final requested substep.
        if (rollbackOn) {
            u32 nextSubstep = (u32)(unk + 1);
            if (nextSubstep < requestedSubsteps) {
                result = 0;
            }
        }

        RBK_LOG("[RBK] [BEFORE SAVE] gameProc_hook generation=%u loopCounter=%d frame=%u\n", currentGeneration, loopCounter, currentFrame);
        if (rollbackOn && pendingSaveCount > 0) {
            u8 result2 = 0;
            EXIPacket::CreateAndSend(EXICommand::CMD_EXECUTE_SAVE, &currentFrame, sizeof(currentFrame));
            EXIHooks::readEXI(&result2, sizeof(u8), EXI_CHAN_1, 0, EXI_FREQ_32HZ);
            pendingSaveCount--;
            RBK_LOG("[RBK][SAVE] Executed save for frame=%u result=%u pendingRemaining=%d\n", currentFrame, result2, pendingSaveCount);
        }
        RBK_LOG("[RBK] [AFTER SAVE] gameProc_hook generation=%u loopCounter=%d\n", currentGeneration, loopCounter);
        loopCounter++;
        return result;
    }

    static bool isBreakGameProcLoop_hook(int ipSwitchPtr)
    {
        if (!g_originalIsBreakGameProcLoop) {
            return false;
        }

        // mainLoopSub checks this immediately after each gameProc call.
        // Keep it false for rollback multi-substep execution so r24 controls
        // how many gameProc iterations run this frame.
        if (rollbackOn && GetRequestedSubsteps() > 1) {
            return false;
        }

        return g_originalIsBreakGameProcLoop(ipSwitchPtr);
    }

    static void sqToMelee_setNext_hook(void* sqToMelee)
    {
        if (sqToMelee) {
            u32* step = (u32*)((u8*)sqToMelee + 0x8);
            gfSceneManager* sceneManager = gfSceneManager::getInstance();
            const char* currentSceneName =
                (sceneManager && sceneManager->m_currentScene) ? sceneManager->m_currentScene->m_sceneName : 0;

            // Ghidra: sqToMelee::setNext (0x805C7E9C) case step==1 always requests
            // scMemoryChange. After loadstate, this can execute while already in
            // scMemoryChange and cause an endless self-transition loop.
            if (*step == 1 && currentSceneName && strcmp(currentSceneName, "scMemoryChange") == 0) {
                *step = 2;
            }
        }

        if (g_originalSqToMeleeSetNext) {
            g_originalSqToMeleeSetNext(sqToMelee);
        }
    }
}
namespace RollbackHooks {
    static BOOL FlushOnOsShutdown(BOOL final, u32 event)
    {
        FrameLogic::DumpBufferedRegionAddressesOnShutdown();
        return (BOOL)1;
    }

    static OSShutdownFunctionInfo s_shutdownFlushInfo = {
        FlushOnOsShutdown,
        0,
        0,
        0
    };

    static bool s_registeredShutdownFlush = false;

    void FlushBufferedRegionAddressesOnShutdown()
    {
        FrameLogic::DumpBufferedRegionAddressesOnShutdown();
    }
    __attribute__((naked)) void fixEffects()
    {
        asm volatile(
            "cmpwi 3, 15\n\t"
            "beq end\n\t"
            "lwzx 3, 3, 24\n\t"
            "end:\n\t"
            "lis 12, 0x8006\n\t"
            "ori 12, 12, 0x1A84\n\t"
            "mtctr 12\n\t"
            "bctr\n\t"
        );
    }
    __attribute__((naked)) void fixEffects2()
    {
        asm volatile(
            "cmpwi 4, 0\n\t"
            "beq end1\n\t"
            "lwzx 3, 3, 5\n\t"
            "end1:\n\t"
            "lis 12, 0x8006\n\t"
            "ori 12, 12, 0x1a34\n\t"
            "mtctr 12\n\t"
            "bctr\n\t"
        );
    }
    __attribute__((naked)) void fixEffects3()
    {
        asm volatile(
            "li 0, 1\n\t"
            "cmpwi 3, 0\n\t"
            "bne end2\n\t"
            "lis 12, 0x8071\n\t"
            "ori 12, 12, 0x3730\n\t"
            "mtctr 12\n\t"
            "bctr\n\t"
            "end2:\n\t"
            "lis 12, 0x8071\n\t"
            "ori 12, 12, 0x3590\n\t"
            "mtctr 12\n\t"
            "bctr\n\t"
        );
    }
    void InstallHooks(CoreApi* api)
    {
    // Setup State
        //savestateHeap = MEMCreateExpHeapEx((void*) 0x94000000, 0x3FBFFFF, 0);
        gfMemoryPool::create((void*)0x94000000, "SavestateHeap", Heaps::SavestateHeap, 0x3FBFFFF, 1);

        if (!s_registeredShutdownFlush) {
            OSRegisterShutdownFunction(&s_shutdownFlushInfo);
            s_registeredShutdownFlush = true;
        }

        //Rollback
        // mainLoopSub calls gameProc at 0x80017358. Hook gameProc itself (0x80017618)
        // so we avoid split inline hook return-flow corruption around the callsite.
        api->syReplaceFunc(0x80017618, reinterpret_cast<void*>(FrameLogic::gameProc_hook), reinterpret_cast<void**>(&FrameLogic::g_originalGameProc));
        // mainLoopSub checks isBreakGameProcLoop right after gameProc and may
        // break the substep loop early even when r24 > 1.
        api->syReplaceFunc(0x8004ADD0, reinterpret_cast<void*>(FrameLogic::isBreakGameProcLoop_hook), reinterpret_cast<void**>(&FrameLogic::g_originalIsBreakGameProcLoop));
        // Prevent loadstate-triggered sqToMelee state desync from requesting
        // scMemoryChange while already in scMemoryChange.
        api->syReplaceFunc(0x805C7E9C, reinterpret_cast<void*>(FrameLogic::sqToMelee_setNext_hook), reinterpret_cast<void**>(&FrameLogic::g_originalSqToMeleeSetNext));
        // Prevent engine-driven pad updates; only allow explicit manual calls.
        api->syReplaceFunc(0x8002A210, reinterpret_cast<void*>(FrameLogic::updateSystem_hook), reinterpret_cast<void**>(&FrameLogic::g_originalGfPadSystemUpdateSystem));
        //api->syReplaceFunc(0x80025C58, reinterpret_cast<void*>(FrameLogic::alloc_gfMemoryPool_hook), reinterpret_cast<void**>(&FrameLogic::g_originalGfMemoryPoolAlloc));
        //api->syReplaceFunc(0x8002632C, reinterpret_cast<void*>(FrameLogic::free_gfMemoryPool_hook), reinterpret_cast<void**>(&FrameLogic::g_originalGfMemoryPoolFree));
        //api->syReplaceFunc(0x80213598, reinterpret_cast<void*>(FrameLogic::iosAllocInternal_hook), reinterpret_cast<void**>(&FrameLogic::g_originalIosAllocInternal));
        //api->syReplaceFunc(0x802137a8, reinterpret_cast<void*>(FrameLogic::iosFree_hook), reinterpret_cast<void**>(&FrameLogic::g_originalIosFree));
        //api->syInlineHook(0x80026258, reinterpret_cast<void*>(FrameLogic::dump_gfMemoryPool_hook));
        api->syInlineHook(0x800171B4, reinterpret_cast<void*>(FrameLogic::beginningOfFrameLoop));
        //api->sySimpleHook(0x800172D0, reinterpret_cast<void*>(FrameLogic::startFrameLoop4));
        //api->sySimpleHook(0x800172A4, reinterpret_cast<void*>(FrameLogic::startFrameLoop5));
        //api->sySimpleHook(0x8001730C, reinterpret_cast<void*>(FrameLogic::startFrameLoop2));
        api->sySimpleHook(0x80017348, reinterpret_cast<void*>(FrameLogic::startFrameLoop6));
        api->syInlineHook(0x8001727C, reinterpret_cast<void*>(FrameLogic::startFrameLoop3));
        api->syInlineHook(0x80017504, reinterpret_cast<void*>(FrameLogic::endMainLoop));
        api->sySimpleHook(0x80061A80, reinterpret_cast<void*>(FrameLogic::fixEffects));
        api->sySimpleHook(0x80061a30, reinterpret_cast<void*>(FrameLogic::fixEffects2));
        api->sySimpleHookRel(0x00008B78, reinterpret_cast<void*>(FrameLogic::fixEffects3), Modules::SORA_MELEE);
    }
}