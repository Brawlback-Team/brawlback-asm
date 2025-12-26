#pragma once
#include <gf/gf_pad_system.h>
#include "ExiStructures.h"
#include "exi_packet.h"
#include <sy_core.h>
#if 1
#define NETPLAY_IMPL
#define ROLLBACK_IMPL
#endif

namespace FrameLogic {
    // Variables
    extern u32 advanceFrames;
    extern u8 port;
    extern u32 rollbackOn;
    extern bool networkChecked;

    // Hooks
    void beginFrame();
    void endMainLoop();
    void startFrameLoop();
    void getInputs();
    void getNetworkMode();
    __attribute__((naked)) void startFrameLoop2();
    __attribute__((naked)) void fixFrameLoop();
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