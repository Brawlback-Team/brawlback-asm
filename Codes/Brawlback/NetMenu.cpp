#include "NetMenu.h"
#include "Netplay.h"

#define NETMENU_IMPL true

#if NETMENU_IMPL

// disable initial login attempt [Eon]
// netThread/[NtMatching] near call to DWC_LoginAsync
INJECTION("setToLoggedIn", 0x8014B5F8, R"(
    li r4, 3
)");
INJECTION("setToLoggedIn2", 0x8014B5FC, R"(
    stw r4, -0x4048(r13)
)");

// disable Mii render func [Eon]
INJECTION("disableMiiRender", 0x80033b48, "nop");

// disable error thrown on matchmaking [Eon]
// startMatchingCommon/[muWifiInterfaceTask] forces branch to end of func
DATA_WRITE(0x800CCF70, 48000024); // <- "b 0x24"


// pretend request of "ConnectToAnybodyAsync" succeeded [Eon]
// thStartMatching/[NtMatching] replaces call to ConnectToAnybodyAsync with just a success code
INJECTION("ConnectToAnybodyAsyncHook", 0x801494A4, R"(
    li r3, 1
)");


// disable CSS/SSS timers in online menus. Courtesey of Rapito

// NOTES on WIFI CSS/SSS:
// 0x80687f6c = Address where a value is checked, and if it's 1 then the timer is processed on the CSS
// 0x80687fe0 = Address where timer is converted to numbers before calling setCounter
// 0x80688010 = Address right after calling setCounter
// disable Set Counter original address is 800da6ec
// INJECTION("disableSetCounterOnCSS", 0x8068800c, "nop"); 
// Prevents the timer to decrease
// INJECTION("preventCounterSubsOnCSS", 0x80687f88, "mr r4, r3"); 
// create.muWifiCntWndTask.mu_wifi_cnt_wnd is the original method called to create the counter window

// Disables Creation of Timer HUD on CSS [Rapito]
INJECTION("disableCreateCounterOnCSS", 0x80686ae4, "BRANCH r3, 0x80686aec"); 

// Prevent Timer from being processed on CSS [Rapito]
INJECTION("turnOffCSSTimer", 0x80687f6c, "li r0, 0"); 

// Disables Creation of Timer HUD on SSS [Rapito]
INJECTION("disableCreateCounterOnSSS", 0x806b1da0, "BRANCH r3, 0x806B1DBC"); 

// Prevent Timer from being processed on SSS [Rapito]
INJECTION("turnOffSSSTimer", 0x806b3f28, "li r0, 8");

// TODO: 
// The following are being disabled because you get an error of 0xD when you go back in any of the scenes
// which shows the following dialog and drops you back to the main menu: 
// "Your connection to other players was lost. Returning to the menu."
// Ideally we should handle them better and figure out why we get that error on the first place.

// Disable getNetworkError from wifiInterface during CSS [Rapito]
INJECTION("disableGetNetworkErrorOnCSS", 0x80687c68, "li r3, 0"); // original was bl ->0x800CBCB0

// Disable getNetworkError from wifiInterface during SSS [Rapito]
INJECTION("disableGetNetworkErrorOnSSS", 0x806b3a74, "li r3, 0"); // original was bl ->0x800CBCB0






// overrides the branch to thStartMatching
// called when you first get to the CSS in the online menu
SIMPLE_INJECTION(StartMatchingCallback, 0x8014aff8, "nop") {
    OSReport("Starting matchmaking!\n");
}

void ChangeGfSceneField(Scene scene) {
    u32* scenePtr = ((u32*)(((u8*)getGfSceneManager()) + 0x288));
    *scenePtr = (u32)scene;
    
    u32* somePtr = ((u32*)(((u8*)getGfSceneManager()) + 0x278));
    *somePtr = 0; // this is checked > -1 and if so will check the sceneManager scene for idle, if so, will changeNextScene
}
void ChangeStruct3Scenes(u8* structure, Scene scene, Scene nextScene) {
    u32* scenePtr = (u32*)(structure + 0x8);
    *scenePtr = scene;

    u32* nextScenePtr = (u32*)(structure + 0xc);
    *nextScenePtr = nextScene;
}
void ChangeStruct3Scenes(u8* structure, Scene scene) {
    u32* scenePtr = (u32*)(structure + 0x8);
    *scenePtr = scene;
}

void BootToScMelee() {
    OSReport("Booting to scMelee...\n");
    //setupMelee((void*)0x90ff42e0, 0);
    ChangeStruct3Scenes((u8*)0x90ff3e40, MemoryChange, InitialChange);
    //setNextSqVsMelee((void*)0x90ff42e0);
    //setNextSqNetAnyOkiraku((void*)0x90ff3e40);
    setNextScene(getGfSceneManager(), "scMelee", 0);
    ChangeGfSceneField(Idle);
    changeNextScene(getGfSceneManager());
}

// setNext/[sqNetAnyOkiraku] at the top just before the do-while loop
// called just as we're loading into the online practice scene
SIMPLE_INJECTION(setNextAnyOkirakuTop, 0x806f2358, "li	r17, 1") {
    //BootToScMelee();

}

// at the bottom of the "case 5:" section of setNext/[sqNetAnyOkiraku]
// called just as we're loading into the online practice scene
SIMPLE_INJECTION(setNextAnyOkirakuCaseFive, 0x806f272c, "stw	r0, 0x000C (r15)") {
    OSReport("Loaded into online training room\n");
    //Netplay::StartMatching();
    //BootToScMelee();
}

// in netThread/[NtMatching] replaces call to netThreadTask with our own stuff
SIMPLE_INJECTION(netThreadTaskOverride, 0x8014b670, "nop") {
    //if (Netplay::IsInMatch()) { // if we are "in" the online training room
        //if (Netplay::CheckIsMatched()) {
        //    BootToScMelee();
            // Load into scMelee here or something
        //}
    //}

    //OSReport("setnextseq\n");
    //setNextSeq(getGfSceneManager(), "sqKumite", 0);
    //setNextScene(getGfSceneManager(), "scChallenger", 0);
    if (getCurrentFrame() == 150) {
        //BootToScMelee();
    }
}

#endif



namespace NetReport {
#define HOOK_NETREPORT true

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
