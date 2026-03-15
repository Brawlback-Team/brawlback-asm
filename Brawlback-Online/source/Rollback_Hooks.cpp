#include "Rollback_Hooks.h"
#include "sy_core.h"
#include <modules.h>
#include "EXI_Hooks.h"
#include "utils.h"
#include <OS/OS.h>
#include <gf/gf_memory_pool.h>
#include <sr/sr_common.h>
#include <ft/ft_manager.h>
#include <ut/ut_list.h>
#include <gf/gf_heap_manager.h>
#include <gf/gf_frame.h>

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
        Utils::SaveRegs();
        if(rollbackOn)
        {
            EXIPacket::CreateAndSend(EXICommand::CMD_END_LOOP);
        }
        Utils::RestoreRegs();
        asm volatile(
            "cmplw 19, 24\n\t"
        );
    }
    __attribute__((naked)) void fixFrameLoop()
    {
        asm (
            "lwz 12, %0\n\t"
            "cmpwi 12, 1\n\t"
            "beq skip\n\t"
            "lis 12, 0x8001\n\t"
            "ori 12, 12, 0x73AC\n\t"
            "mtctr 12\n\t"
            "bctr\n\t"
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
        Utils::SaveRegs();
        if(rollbackOn)
        {
            
            EXIPacket::CreateAndSend(EXICommand::CMD_GET_PORT);
            EXIHooks::readEXI(&port, sizeof(u8), EXI_CHAN_1, 0, EXI_FREQ_32HZ);
            Util::printGameInputs(g_gfPadSystem->m_systemPads[port]);
            BrawlbackPad pad = Util::GamePadToBrawlbackPad(g_gfPadSystem->m_systemPads[port]);
            EXIPacket::CreateAndSend(EXICommand::CMD_START_LOOP, &pad, sizeof(BrawlbackPad));
            EXIHooks::readEXI(&advanceFrames, sizeof(u32), EXI_CHAN_1, 0, EXI_FREQ_32HZ);
            Utils::swapByteOrder(advanceFrames);
            OSReport("ADVANCE FRAMES: %x\n", advanceFrames);
        }
        Utils::RestoreRegs();
        asm volatile(
            "li 25, 0x0\n\t"
        );
    }
    void getInputs()
    {
        Utils::SaveRegs();
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
    void getNetworkMode()
    {
        Utils::SaveRegs();
        if(!networkChecked)
        {
            EXIPacket::CreateAndSend(EXICommand::CMD_ROLLBACK_CHECK);
            EXIHooks::readEXI(&rollbackOn, sizeof(u32), EXI_CHAN_1, 0, EXI_FREQ_32HZ);
            Utils::swapByteOrder(rollbackOn);
            networkChecked = true;
        }
        Utils::RestoreRegs();
    }
}
namespace RollbackHooks {
    void InstallHooks(CoreApi* api)
    {
        // Rollback
        api->syInlineHook(0x80017504, reinterpret_cast<void*>(FrameLogic::endMainLoop));
        api->syInlineHook(0x800173a4, reinterpret_cast<void*>(FrameLogic::endFrameLoop));
        api->syInlineHook(0x80017344, reinterpret_cast<void*>(FrameLogic::startFrameLoop));
        api->sySimpleHook(0x80017348, reinterpret_cast<void*>(FrameLogic::startFrameLoop2));
        api->syInlineHook(0x80017350, reinterpret_cast<void*>(FrameLogic::getInputs));
        api->sySimpleHook(0x80017398, reinterpret_cast<void*>(FrameLogic::fixFrameLoop));
        api->syInlineHook(0x800171b4, reinterpret_cast<void*>(FrameLogic::getNetworkMode));
    }
}