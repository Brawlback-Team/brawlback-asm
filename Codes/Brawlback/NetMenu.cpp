#include "NetMenu.h"
#include "Netplay.h"

// courtesey of Eon
#define NETMENU_IMPL true

#if NETMENU_IMPL

// disable initial login attempt
INJECTION("setToLoggedIn", 0x8014B5F8, R"(
    li r4, 3
)");
INJECTION("setToLoggedIn2", 0x8014B5FC, R"(
    stw r4, -0x4048(r13)
)");


// disable Mii render func
INJECTION("disableMiiRender", 0x80033b48, "nop");

// disable error thrown on matchmaking
DATA_WRITE(0x800CCF70, 48000024); // <- "b 0x24"


// pretend request of "ConnectToAnybodyAsync" succeeded
INJECTION("ConnectToAnybodyAsyncHook", 0x801494A4, R"(
    li r3, 1
)");


// overrides the branch to thStartMatching
SIMPLE_INJECTION(StartMatchingCallback, 0x8014aff8, "nop") {
    OSReport("Starting matchmaking!\n");
    //bool isHost = PAD_SYSTEM->pads[0].buttons.Z || PAD_SYSTEM->pads[1].buttons.Z;
    //Netplay::StartFindOpponent();
    //Netplay::StartMatch();
    //clearAppErrorStatus();
    //setMatchingStatus(NetMatchMakingStatus::MatchingWaitShare);
}

#endif



namespace NetReport {
#define HOOK_NETREPORT false

#if HOOK_NETREPORT
// netReport/[muWifiInterface]
INJECTION("netReportHook", 0x800c7534, R"(
    SAVE_REGS
    bl netReportHook
    RESTORE_REGS

    addi	sp, sp, 112
)");


// netReport/[muWifiConnectWnd]
INJECTION("netReportHook2", 0x8119cd58, R"(
    SAVE_REGS
    bl netReportHook
    RESTORE_REGS

    stwu	sp, -0x0070 (sp)
)");

// netReport/[stOperatorNetwork]
INJECTION("netReportHook3", 0x8095f894, R"(
    SAVE_REGS
    bl netReportHook
    RESTORE_REGS

    stwu	sp, -0x0070 (sp)
)");


// netReport0/[ntMatch]
INJECTION("netReportHook4", 0x80147ec0, R"(
    SAVE_REGS
    bl netReportHook
    RESTORE_REGS

    stwu	sp, -0x0070 (sp)
)");

// netMinReport/[muWifiInterface]
INJECTION("netMinReportHook", 0x800c8f68, R"(
    SAVE_REGS
    bl netReportHook
    RESTORE_REGS

    stwu	sp, -0x0080 (sp)
)");



extern "C" void netReportHook(char* str) {
    OSReport(str);
}
#endif

}
