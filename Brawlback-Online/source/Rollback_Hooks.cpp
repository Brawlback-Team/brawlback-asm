#include "Rollback_Hooks.h"
#include "sy_core.h"
#include <modules.h>
#include <cstring>
#include "EXI_hooks.h"
#include "utils.h"
#include <OS/OS.h>
#include <gf/gf_memory_pool.h>
#include <sr/sr_common.h>
#include <ft/ft_manager.h>
#include <ut/ut_list.h>
#include <gf/gf_heap_manager.h>
#include <gf/gf_frame.h>
#include <gf/gf_scene.h>
#include <ip/ip_switch.h>
#include <sc/sc_melee.h>
#include <mem_exp_hooks.h>
#define ROLLBACK_HOOKS_LOGGING 0
#if ROLLBACK_HOOKS_LOGGING
#define RBK_LOG(...) OSReport(__VA_ARGS__)
#else
#define RBK_LOG(...) do { } while (0)
#endif

bu32 gameProc(void* gfGameApplication, bu32 unk);
const char* ignoreHeaps = "Syringe SavestateHeap Sound CopyFB RenderFifo Thread";

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
    u32 advanceFrames = 1;
    u8 port = 0;
    u32 rollbackOn = false;
    bool networkChecked = false;
    bool dumpAllCaptureInProgress = false;
    void* allocationRegionPacketBuffer = 0;
    size_t allocationRegionPacketCapacity = 0;
    SyringeVector<SavestateRegionInfo> activeRegions;

    // Keep START_LOOP chunks below a conservative transport-safe threshold.
    static const int kMaxExiPayloadBytesPerTransfer = 0x1000;
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
        }

        StartLoopPayloadInfo payloadInfo = {};
        payloadInfo.payloadSize = (bu32)payloadSize;
        payloadInfo.exiMaxPayloadBytes = (bu32)kMaxExiPayloadBytesPerTransfer;

        EXIPacket::CreateAndSend(EXICommand::CMD_LOAD_STATE_SIZE, &payloadInfo, sizeof(payloadInfo));
        SendEXIPayloadChunked(EXICommand::CMD_LOAD_STATE, payload, payloadSize, kMaxExiPayloadBytesPerTransfer);
        bu32 missingCount = 0;
        EXIHooks::readEXI(&missingCount, sizeof(bu32), EXI_CHAN_1, 0, EXI_FREQ_32HZ);
        Utils::swapByteOrder(missingCount);
        SyringeVector<AllocationRegionEntry> missingEntries;
        missingEntries.setsize(missingCount);
        EXIPacket::CreateAndSend(EXICommand::CMD_GET_MISSING_REGIONS);
        EXIHooks::readEXI(missingEntries.data(), sizeof(AllocationRegionEntry) * missingCount, EXI_CHAN_1, 0, EXI_FREQ_32HZ);
        for(int i = 0; i < missingCount; i++)
        {
            RBK_LOG("Missing region %d/%d: address=%x size=%x\n", i + 1, missingCount, missingEntries[i].address, missingEntries[i].size);
            if (IsSensibleAllocationRange(missingEntries[i].address, missingEntries[i].size)) {
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
        }

        StartLoopPayloadInfo payloadInfo = {};
        payloadInfo.payloadSize = (bu32)payloadSize;
        payloadInfo.exiMaxPayloadBytes = (bu32)kMaxExiPayloadBytesPerTransfer;

        EXIPacket::CreateAndSend(EXICommand::CMD_START_LOOP_SIZE, &payloadInfo, sizeof(payloadInfo));
        SendEXIPayloadChunked(EXICommand::CMD_START_LOOP, payload, payloadSize, kMaxExiPayloadBytesPerTransfer);
    }

    static void CaptureActiveRegions()
    {
        activeRegions.clear();
        dumpAllCaptureInProgress = true;
        gfHeapManager::dumpAll();
        dumpAllCaptureInProgress = false;
    }

    void endMainLoop()
    {
        Utils::SaveRegs();
        if(rollbackOn)
        {
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
        if(rollbackOn)
        {
            
            EXIPacket::CreateAndSend(EXICommand::CMD_GET_PORT);
            EXIHooks::readEXI(&port, sizeof(u8), EXI_CHAN_1, 0, EXI_FREQ_32HZ);
            BrawlbackPad pad = Util::GamePadToBrawlbackPad(g_gfPadSystem->m_systemPads[port]);
            EXIPacket::CreateAndSend(EXICommand::CMD_START_LOOP_ROLLBACK, &pad, sizeof(BrawlbackPad));
            EXIHooks::readEXI(&advanceFrames, sizeof(u32), EXI_CHAN_1, 0, EXI_FREQ_32HZ);
            Utils::swapByteOrder(advanceFrames);
            RBK_LOG("ADVANCE FRAMES: %x\n", advanceFrames);
        }
    }
    void getInputs()
    {
        if(rollbackOn)
        {
            // TODO: Doubles?
            // This is kinda weird -- Probably what we need to actually do is make another struct with ports and stuff and send that
            //                        for instances where the users change the ports in the netplay window. 
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
    __attribute__((naked)) void startFrameLoop2()
    {
        asm (
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
            EXIHooks::readEXI(&rollbackOn, sizeof(u32), EXI_CHAN_1, 0, EXI_FREQ_32HZ);
            Utils::swapByteOrder(rollbackOn);
            networkChecked = true;
        }
    }
    void dump_gfMemoryPool_hook()
    {
        Utils::SaveRegs();
        char** r30_reg_val;
        bu32 addr_start;
        bu32 addr_end;
        bu32 mem_size;
        asm volatile(
            "mr %0, 30\n\t"
            "mr %1, 4\n\t"
            "mr %2, 5\n\t"
            "mr %3, 6\n\t"
            : "=r"(r30_reg_val), "=r"(addr_start), "=r"(addr_end), "=r"(mem_size)
        );
        char* heap_name = *r30_reg_val;
        bool sensible = IsSensibleAllocationRange(addr_start, mem_size);
        if (ShouldTrackHeapName(heap_name) && sensible && strncmp((char*)addr_start, "ARC", 3) != 0)
        {
            SavestateRegionInfo regionInfo;
            regionInfo.address = addr_start;
            regionInfo.size = mem_size;
            activeRegions.push(regionInfo);
        }
        else if (!sensible)
        {
            RBK_LOG("Skipping dumpAll capture of region with invalid range: start=%x size=%x\n", addr_start, mem_size);
        }
        Utils::RestoreRegs();
    }
    void beginningOfFrameLoop()
    {
        Utils::SaveRegs();
        bu32 reg24;
        asm volatile (
            "mr %0, 24\n\t"
            : "=r"(reg24)
        );

        bool clearPad = true;
        int resim = 0;
        void* gameApp = (void*)0x805b4fd8;
        getNetworkMode();
        if(rollbackOn)
        {
            startFrameLoop();
            if(advanceFrames > 1)
            {
                SendLoadStateWithRegions();
                RBK_LOG("Advancing %d frames\n", advanceFrames);
                resim = advanceFrames;
                for(int i = 0; i < resim; i++)
                {
                    getInputs();
                    bu32 procResult = gameProc(gameApp, i);
                    CaptureActiveRegions();
                    SendAllocationRegionsDynamic();
                }
            }
        }
        
        if(advanceFrames != 0)
        {
            for(int i = 0; i < reg24; i++)
            {
                getInputs();
                bu32 procResult = gameProc(gameApp, i + resim);
                if(rollbackOn)
                {
                    CaptureActiveRegions();
                    SendAllocationRegionsDynamic();
                }
                if(1 < reg24 && clearPad) 
                {
                    g_gfPadSystem->clearPadEdgeRepert();
                    clearPad = false;
                }
                if(procResult != 0)
                {
                    break;
                }
                else 
                {
                    ipSwitch* ipSwitch = ipSwitch::getInstance();
                    bool isBreakGameProcLoop = ipSwitch->isBreakGameProcLoop();
                    if(isBreakGameProcLoop || (*(bu8*)((bu32)gameApp + 237)) >> 2 & 1 == 0)
                    {
                        break;
                    }
                }
                endFrameLoop();
            }
        }
        Utils::RestoreRegs();
        asm volatile(
            "lwz 30, 0x0038 (1)\n\t"
            "lwz 0, 0x0044 (1)\n\t"
            "lwz 31, 0x003C (1)\n\t"
            "addi 1, 1, 64\n\t"
            "mtlr 0\n\t"
            "lis 12, 0x8001\n\t"
            "ori 12, 12, 0x73ac\n\t"
            "mtctr 12\n\t"
            "bctr\n\t"
        );
    }
}
namespace RollbackHooks {
    void InstallHooks(CoreApi* api)
    {
    // Setup State
        //savestateHeap = MEMCreateExpHeapEx((void*) 0x94000000, 0x3FBFFFF, 0);
        gfMemoryPool::create((void*)0x94000000, "SavestateHeap", Heaps::SavestateHeap, 0x3FBFFFF, 1);

        //Rollback
        api->syInlineHook(0x80026258, reinterpret_cast<void*>(FrameLogic::dump_gfMemoryPool_hook));
        api->sySimpleHook(0x80017350, reinterpret_cast<void*>(FrameLogic::beginningOfFrameLoop));
        api->syInlineHook(0x80017504, reinterpret_cast<void*>(FrameLogic::endMainLoop));
    }
}
