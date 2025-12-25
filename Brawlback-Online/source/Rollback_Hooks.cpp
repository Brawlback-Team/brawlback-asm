#include "Rollback_Hooks.h"
#include "sy_core.h"
#include <modules.h>
#include "EXI_Hooks.h"
#include "utils.h"
#include <OS/OS.h>

namespace Util {
    void printInputs(const BrawlbackPad& pad) {
        
        OSReport(" -- BB Pad --\n");
        OSReport("StickX: %hhu ", pad.stickX);
        OSReport("StickY: %hhu ", pad.stickY);
        OSReport("CStickX: %hhu ", pad.cStickX);
        OSReport("CStickY: %hhu\n", pad.cStickY);
        OSReport("Buttons: ");
        OSReport("Buttons: 0x%x", pad.buttons);
        OSReport("holdButtons: 0x%x\n", pad.holdButtons);
        OSReport(" ---------\n");
        
    }

    void printGameInputs(const gfPadStatus& pad) {
        
        OSReport(" -- Game Pad --\n");
        OSReport(" LAnalogue: %u    RAnalogue %u\n", pad.m_lTriggerAnalog, pad.m_rTriggerAnalog);
        OSReport("StickX: %hhu ", pad.m_stickX);
        OSReport("StickY: %hhu ", pad.m_stickY);
        OSReport("CStickX: %hhu ", pad.m_subStickX);
        OSReport("CStickY: %hhu\n", pad.m_subStickY);
        OSReport("Buttons: ");
        OSReport("B1: 0x%x ", pad.m_buttonsCurrentFrame);
        OSReport("B2: 0x%x ", pad.m_buttonsCurrentFrame2);
        OSReport("B3: 0x%x \n", pad.m_buttonsPressedThisFrame);
        OSReport(" ---------\n");
        
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
    
    void endMainLoop()
    {
        Utils::SaveRegs();
        EXIPacket::CreateAndSend(EXICommand::CMD_END_FRAME);
        Utils::RestoreRegs();
    }

    void endFrameLoop()
    {
        Utils::SaveRegs();
        EXIPacket::CreateAndSend(EXICommand::CMD_END_LOOP);
        Utils::RestoreRegs();
    }
    __attribute__((naked)) void fixFrameLoop()
    {
        asm volatile(
            "lis 12, 0x8001\n\t"
            "ori 12, 12, 0x739c\n\t"
            "mtctr 12\n\t"
            "bctr\n\t"
        );
    }
    void startFrameLoop()
    {
        Utils::SaveRegs();
        EXIPacket::CreateAndSend(EXICommand::CMD_GET_PORT);
        EXIHooks::readEXI(&port, sizeof(u8), EXI_CHAN_1, 0, EXI_FREQ_32HZ);
        Util::printGameInputs(g_gfPadSystem->m_systemPads[port]);
        BrawlbackPad pad = Util::GamePadToBrawlbackPad(g_gfPadSystem->m_systemPads[port]);
        EXIPacket::CreateAndSend(EXICommand::CMD_START_LOOP, &pad, sizeof(BrawlbackPad));
        EXIHooks::readEXI(&advanceFrames, sizeof(u32), EXI_CHAN_1, 0, EXI_FREQ_32HZ);
        Utils::swapByteOrder(advanceFrames);
        OSReport("ADVANCE FRAMES: %x\n", advanceFrames);
        
        Utils::RestoreRegs();
        asm volatile(
            "li 25, 0x0\n\t"
        );
    }
    void getInputs()
    {
        // TODO: Doubles?
        // This is kinda weird -- Probably what we need to actually do is make another struct with ports and stuff and send that
        //                        for instances where the users change the ports in the netplay window.
        Utils::SaveRegs();
        BrawlbackPad pad;
        EXIPacket::CreateAndSend(EXICommand::CMD_GET_REMOTE_INPUTS);
        EXIHooks::readEXI(&pad, sizeof(BrawlbackPad), EXI_CHAN_1, 0, EXI_FREQ_32HZ);
        Utils::swapByteOrder(pad._buttons);
        Utils::swapByteOrder(pad.buttons);
        Utils::swapByteOrder(pad.holdButtons);
        Utils::swapByteOrder(pad.releasedButtons);
        Utils::swapByteOrder(pad.rapidFireButtons);
        Utils::swapByteOrder(pad.newPressedButtons);
        Util::InjectBrawlbackPadToPadStatus(&g_gfPadSystem->m_systemPads[port == 0 ? 1 : 0], pad, port);
        EXIPacket::CreateAndSend(EXICommand::CMD_GET_LOCAL_INPUTS);
        EXIHooks::readEXI(&pad, sizeof(BrawlbackPad), EXI_CHAN_1, 0, EXI_FREQ_32HZ);
        Utils::swapByteOrder(pad._buttons);
        Utils::swapByteOrder(pad.buttons);
        Utils::swapByteOrder(pad.holdButtons);
        Utils::swapByteOrder(pad.releasedButtons);
        Utils::swapByteOrder(pad.rapidFireButtons);
        Utils::swapByteOrder(pad.newPressedButtons);
        Util::InjectBrawlbackPadToPadStatus(&g_gfPadSystem->m_systemPads[port], pad, port);
        Utils::RestoreRegs();
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
}
namespace RollbackHooks {
    void InstallHooks(CoreApi* api)
    {
        api->syInlineHook(0x80017504, reinterpret_cast<void*>(FrameLogic::endMainLoop));
        api->syInlineHook(0x800173a0, reinterpret_cast<void*>(FrameLogic::endFrameLoop));
        api->syInlineHook(0x80017344, reinterpret_cast<void*>(FrameLogic::startFrameLoop));
        api->sySimpleHook(0x80017348, reinterpret_cast<void*>(FrameLogic::startFrameLoop2));
        api->syInlineHook(0x80017350, reinterpret_cast<void*>(FrameLogic::getInputs));
        api->sySimpleHook(0x80017398, reinterpret_cast<void*>(FrameLogic::fixFrameLoop));
    }
}