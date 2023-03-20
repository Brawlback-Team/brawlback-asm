#include "Brawlback.h"
#include "Netplay.h"
#include "GmGlobalModeMelee.h"
#include <vector>
#include "etl/string_utilities.h"
#include <Brawl/SC/scMelee.h>
#include <Brawl/GF/gfSceneManager.h>

// TODO: rename to gmGlobalModeMelee prefix or smth
#define P1_CHAR_ID_IDX 0x98
#define P2_CHAR_ID_IDX P1_CHAR_ID_IDX + 0x5C
#define P3_CHAR_ID_IDX P2_CHAR_ID_IDX + 0x5C
#define P4_CHAR_ID_IDX P3_CHAR_ID_IDX + 0x5C

bool hasDumped = false;
bool doDumpList = false;

std::vector<SavestateMemRegionInfo> allocsDeallocs;

STARTUP(startupNotif) {
    OSReport("~~~~~~~~~~~~~~~~~~~~~~~~ Brawlback ~~~~~~~~~~~~~~~~~~~~~~~~\n");
}

u32 getCurrentFrame() {
    return GAME_FRAME->persistentFrameCounter;
}

bool gameHasStarted() {
    return !SC_MELEE->stOperatorReadyGo1->isEnd();
}

namespace Util {

    void printInputs(const BrawlbackPad& pad) {
        OSReport(" -- Pad --\n");
        OSReport("StickX: %hhu ", pad.stickX);
        OSReport("StickY: %hhu ", pad.stickY);
        OSReport("CStickX: %hhu ", pad.cStickX);
        OSReport("CStickY: %hhu\n", pad.cStickY);
        OSReport("Buttons: ");
        OSReport("Buttons: 0x%x", pad.buttons);
        OSReport("holdButtons: 0x%x", pad.holdButtons);
        OSReport(" LTrigger: %u    RTrigger %u\n", pad.LTrigger, pad.RTrigger);
        //OSReport(" ---------\n"); 
    }

    void printGameInputs(const gfPadGamecube& pad) {
        OSReport(" -- Pad --\n");
        OSReport(" LAnalogue: %u    RAnalogue %u\n", pad.LAnalogue, pad.RAnalogue);
        OSReport("StickX: %hhu ", pad.stickX);
        OSReport("StickY: %hhu ", pad.stickY);
        OSReport("CStickX: %hhu ", pad.cStickX);
        OSReport("CStickY: %hhu\n", pad.cStickY);
        OSReport("Buttons: ");
        OSReport("B1: 0x%x ", pad.buttons.bits);
        OSReport("B2: 0x%x ", pad._buttons.bits);
        OSReport("B3: 0x%x \n", pad.newPressedButtons.bits);
        OSReport(" LTrigger: %u    RTrigger %u\n", pad.LTrigger, pad.RTrigger);
        //OSReport(" ---------\n"); 
    }

    void printFrameData(const FrameData& fd) {
        for (int i = 1; i < MAX_NUM_PLAYERS; i++) {
            OSReport("Frame %u pIdx %u\n", fd.playerFrameDatas[i].frame, (unsigned int)fd.playerFrameDatas[i].playerIdx);
            printInputs(fd.playerFrameDatas[i].pad);
        }
    }

    void SyncLog(const BrawlbackPad& pad, u8 playerIdx) {
        OSReport("[Sync] Injecting inputs for player %u on frame %u\n", (unsigned int)playerIdx, getCurrentFrame());
        printInputs(pad);
        OSReport("[/Sync]\n");
    }

    void FixFrameDataEndianness(FrameData* fd) {
        swapByteOrder(fd->randomSeed);
        for (int i = 0; i < MAX_NUM_PLAYERS; i++) {
            swapByteOrder(fd->playerFrameDatas[i].frame);
            swapByteOrder(fd->playerFrameDatas[i].syncData.anim);
            swapByteOrder(fd->playerFrameDatas[i].syncData.locX);
            swapByteOrder(fd->playerFrameDatas[i].syncData.locY);
            swapByteOrder(fd->playerFrameDatas[i].syncData.percent);
            swapByteOrder(fd->playerFrameDatas[i].pad.buttons);
            swapByteOrder(fd->playerFrameDatas[i].pad.holdButtons);
            swapByteOrder(fd->playerFrameDatas[i].pad.releasedButtons);
            swapByteOrder(fd->playerFrameDatas[i].pad.rapidFireButtons);
            swapByteOrder(fd->playerFrameDatas[i].pad.newPressedButtons);
            swapByteOrder(fd->playerFrameDatas[i].sysPad.buttons);
            swapByteOrder(fd->playerFrameDatas[i].sysPad.holdButtons);
            swapByteOrder(fd->playerFrameDatas[i].sysPad.releasedButtons);
            swapByteOrder(fd->playerFrameDatas[i].sysPad.rapidFireButtons);
            swapByteOrder(fd->playerFrameDatas[i].sysPad.newPressedButtons);
        }
    }
    

    // TODO: fix pause by making sure that the sys data thingy is also checking for one of the other button bits

    BrawlbackPad GamePadToBrawlbackPad(const gfPadGamecube& pad) {
        BrawlbackPad ret;
        ret._buttons = pad._buttons.bits;
        ret.buttons = pad.buttons.bits;
        // *(ret.newPressedButtons-0x2) = (int)*(pad+0x14);
        ret.holdButtons = pad.holdButtons.bits;
        ret.rapidFireButtons = pad.rapidFireButtons.bits;
        ret.releasedButtons = pad.releasedButtons.bits;
        ret.newPressedButtons = pad.newPressedButtons.bits;
        ret.LAnalogue = pad.LAnalogue;
        ret.RAnalogue = pad.RAnalogue;
        ret.cStickX = pad.cStickX;
        ret.cStickY = pad.cStickY;
        ret.stickX = pad.stickX;
        ret.stickY = pad.stickY;
        ret.LTrigger = pad.LTrigger;
        ret.RTrigger = pad.RTrigger;


        // OSReport("BUTTONS======\n");
        // OSReport("Buttons: 0x%x\n", pad._buttons.bits);
        // OSReport("Buttons: 0x%x\n", pad.buttons.bits);
        // OSReport("Buttons holdButtons: 0x%x\n", pad.holdButtons.bits);
        // OSReport("Buttons rapidFireButtons: 0x%x\n", pad.rapidFireButtons.bits);
        // OSReport("Buttons releasedButtons: 0x%x\n", pad.releasedButtons.bits);
        // OSReport("Buttons newPressedButtons: 0x%x\n", pad.newPressedButtons.bits);

        return ret;
    }

    #define _getScMelee_GF_SCENE_MANAGER ((scMelee* (*)(gfSceneManager* This, char* searchName)) 0x8002d3f4)
    bool ReadySetGoDone() {
        return _getScMelee_GF_SCENE_MANAGER(gfSceneManager::getInstance(), (char*)"scMelee")->stOperatorReadyGo1->isEnd() != 0;
    }
    void PopulatePlayerFrameData(PlayerFrameData& pfd, u8 port, u8 pIdx) {
        if(ReadySetGoDone())
        {
            ftManager* fighterManager = FIGHTER_MANAGER;
            Fighter* fighter = fighterManager->getFighter(fighterManager->getEntryIdFromIndex(pIdx));
            ftOwner* ftowner = fighterManager->getOwner(fighterManager->getEntryIdFromIndex(pIdx));
            
            pfd.syncData.facingDir = fighter->modules->postureModule->direction < 0.0 ? -1 : 1;
            pfd.syncData.locX = fighter->modules->postureModule->xPos;
            pfd.syncData.locY = fighter->modules->postureModule->yPos;
            pfd.syncData.anim = fighter->modules->statusModule->action;
            
            pfd.syncData.percent = (float)ftowner->getDamage();
            pfd.syncData.stocks = (u8)ftowner->getStockCount();
        }
        
        pfd.pad = Util::GamePadToBrawlbackPad(PAD_SYSTEM->pads[port]);
        OSReport("STICK X: %d\n", pfd.pad.stickX);
        pfd.sysPad = Util::GamePadToBrawlbackPad(PAD_SYSTEM->sysPads[port]);
    }
    void InjectBrawlbackPadToPadStatus(gfPadGamecube& gamePad, const BrawlbackPad& pad, int port) {
        
        // TODO: do this once on match start or whatever, so we don't need to access this so often and lose cpu cycles
        //bool isNotConnected = Netplay::getGameSettings().playerSettings[port].playerType == PlayerType::PLAYERTYPE_NONE;
        // get current char selection and if none, the set as not connected
        u8 charId = *(((u8*)GM_GLOBAL_MODE_MELEE)+P1_CHAR_ID_IDX + (port*92));
        // u8 charId = GM_GLOBAL_MODE_MELEE->playerData[port].charId;
        bool isNotConnected = charId == -1;
        // GM_GLOBAL_MODE_MELEE->playerData[port].playerType = isNotConnected ? 03 : 0 ; // Set to Human
        

        gamePad.isNotConnected = isNotConnected;
        gamePad._buttons.bits = pad._buttons;
        gamePad.buttons.bits = pad.buttons;
        // int* addr  = (int*) &gamePad;
        // *(addr+0x14+0x2) = pad.buttons;
        gamePad.holdButtons.bits = pad.holdButtons;
        gamePad.rapidFireButtons.bits = pad.rapidFireButtons;
        gamePad.releasedButtons.bits = pad.releasedButtons;
        gamePad.newPressedButtons.bits = pad.newPressedButtons;
        gamePad.LAnalogue = pad.LAnalogue;
        gamePad.RAnalogue = pad.RAnalogue;
        gamePad.cStickX = pad.cStickX;
        gamePad.cStickY = pad.cStickY;
        gamePad.stickX = pad.stickX;
        gamePad.stickY = pad.stickY;
        gamePad.LTrigger = pad.LTrigger;
        gamePad.RTrigger = pad.RTrigger;
        // OSReport("Port 0x%x Inputs\n", port);
        // OSReport("Buttons: 0x%x\n", pad.buttons);
        // OSReport("Buttons: 0x%x\n", pad.newPressedButtons);

    }

    void SaveState(u32 currentFrame) {        
        EXIPacket::CreateAndSend(EXICommand::CMD_CAPTURE_SAVESTATE, &currentFrame, sizeof(currentFrame));
    }

}



// fill gamesettings struct with game info
void fillOutGameSettings(GameSettings& settings) {
    settings.randomSeed = DEFAULT_MT_RAND->seed;
    settings.stageID = GM_GLOBAL_MODE_MELEE->stageID;

    u8 p1_id = *(((u8*)GM_GLOBAL_MODE_MELEE)+P1_CHAR_ID_IDX);
    OSReport("P1 pre-override char id: %u\n", (unsigned int)p1_id);
    
    u8 p2_id = *(((u8*)GM_GLOBAL_MODE_MELEE)+P2_CHAR_ID_IDX);
    OSReport("P2 pre-override char id: %u\n", (unsigned int)p2_id);

    // brawl loads all players into the earliest slots.
    // I.E. if players choose P1 and P3, they will get loaded into P1 and P2
    // this means we can use the number of players in a match to iterate over
    // players since we know they'll always be next to each other

    // TODO: replace this with some way to get the actual number of players in a match.
    // unfortunately FIGHTER_MANAGER->getEntryCount() isn't filled out at this point in the game loading
    // sequence. Gotta find another way to get it, or some better spot to grab the number of players
    settings.numPlayers = 2;
    OSReport("Num Players: %u\n", (unsigned int)settings.numPlayers);

    PlayerSettings playerSettings[settings.numPlayers];
    playerSettings[0].charID = p1_id;
    playerSettings[1].charID = p2_id;
    
    for (int i = 0; i < settings.numPlayers; i++) {
        settings.playerSettings[i] = playerSettings[i];
    }
}


// take gamesettings and apply it to our game
void MergeGameSettingsIntoGame(GameSettings& settings) {
    //DEFAULT_MT_RAND->seed = settings->randomSeed;
    DEFAULT_MT_RAND->seed = 0x496ffd00; // hardcoded for testing (arbitrary number)
    OTHER_MT_RAND->seed = 0x496ffd00;

    //GM_GLOBAL_MODE_MELEE->stageID = settings->stageID;
    //GM_GLOBAL_MODE_MELEE->stageID = 2;

    Netplay::localPlayerIdx = settings.localPlayerIdx;
    OSReport("Local player index is %u\n", (unsigned int)Netplay::localPlayerIdx);

    u8 p1_char = settings.playerSettings[0].charID;
    u8 p2_char = settings.playerSettings[1].charID;
    OSReport("P1 char: %u  P2 char: %u\n", (unsigned int)p1_char, (unsigned int)p2_char);
    OSReport("Stage id: %u\n", (unsigned int)settings.stageID);

    int chars[MAX_NUM_PLAYERS] = {p1_char, p2_char, -1, -1};
    GMMelee::PopulateMatchSettings(chars, settings.stageID );
}


namespace Match {


    void PopulateGameReport(GameReport& report) {
        ftManager* fighterManager = FIGHTER_MANAGER;

        for (int i = 0; i < Netplay::getGameSettings().numPlayers; i++) {
            const auto fighter = fighterManager->getFighter(fighterManager->getEntryIdFromIndex(i));
            s32 stocks = fighter->getOwner()->getStockCount();
            OSReport("Stock count player idx %i = %i\n", i, stocks);
            report.stocks[i] = stocks;
            f64 damage = fighter->getOwner()->getDamage();
            OSReport("Damage for player idx %i = %f\n", i, damage);
            report.damage[i] = damage;
        }
        report.frame_duration = getCurrentFrame();
    }

    void SendGameReport(const GameReport& report) {
        OSReport("Sending end match report to emu. Num players = %u\n", (u32)Netplay::getGameSettings().numPlayers);
        EXIPacket::CreateAndSend(EXICommand::CMD_MATCH_END, &report, sizeof(report));
    }

    // called at end of a match *before* player data and such is wiped. Use this to grab post-match stats before they're gone
    // strangely though, this is called twice at the end of a match... keep that in mind
    // this hook is placed so it is only called once. It also is placed so that it doesn't interfere with another hook that seems to be in the very next instruction
    // TODO(?): this is, however, after some other stuff gets called like stopGame/[ftManager], and removeItemAll/[itManager]. Might want to move this hook up a bit to before those are called
    SIMPLE_INJECTION(stopGameScMeleeHook, 0x806d4c10, "mr	r17, r15") {
        OSReport("Game report in stopGameScMeleeBeginningHook hook\n");
        if (Netplay::getGameSettings().numPlayers > 1) {
            #if 0  // toggle for sending end match game stats
            GameReport report;
            PopulateGameReport(report);
            SendGameReport(report);
            #endif
        }
    }

    // on scene start (just AFTER the start/[scMelee] function has run)
    SIMPLE_INJECTION(startSceneMelee, 0x806d176c, "addi	sp, sp, 112") {
        _OSDisableInterrupts();
        OSReport("  ~~~~~~~~~~~~~~~~  Start Scene Melee  ~~~~~~~~~~~~~~~~  \n");
        #ifdef NETPLAY_IMPL
        //Netplay::StartMatching(); // now moved to GmGlobalModeMelee.cpp
        Netplay::SetIsInMatch(true);
        #else
        // 'debug' values
        Netplay::getGameSettings().localPlayerIdx = 0;
        Netplay::localPlayerIdx = 0;
        Netplay::getGameSettings().numPlayers = 2;
        #endif
        _OSEnableInterrupts();
    }

    // on scene exit
    SIMPLE_INJECTION(exitSceneMelee, 0x806d4844, "li r4, 0x0") {
        _OSDisableInterrupts();
        OSReport("  ~~~~~~~~~~~~~~~~  Exit Scene Melee  ~~~~~~~~~~~~~~~~  \n");
        #ifdef NETPLAY_IMPL
        Netplay::EndMatch();
        Netplay::SetIsInMatch(false);
        hasDumped = false;
        #endif
        _OSEnableInterrupts();
    }

    // at this address, r30 contains a (double) ptr to the name of the heap it is dumping
    // so we move it into r3 to get easy access to it in our hook
    INJECTION("dumpList_hook", 0x80024c48, R"(
        SAVE_REGS
        mr r3, r6
        mr r4, r7
        bl dumpGfMemoryPoolHook
        RESTORE_REGS
    )");
    const char* relevantHeaps = R"(
        System FW System Effect WiiPad IteamResource InfoResource CommonResource CopyFB Physics
        ItemInstance Fighter1Resoruce Fighter2Resoruce Fighter3Resoruce Fighter4Resoruce Fighter1Resoruce2
        Fighter2Resoruce2 Fighter3Resoruce2 Fighter4Resoruce2 FighterEffect Fighter1Instance Fighter2Instance
        Fighter3Instance Fighter4Instance FighterTechqniq InfoInstance InfoExtraResource GameGlobal 
        GlobalMode OverlayCommon
    )";

    extern "C" void dumpGfMemoryPoolHook(u32 start, u32 end, char name[]) {
        OSReport("%s: 0x%x - 0x%x\n", name, start, end);
        if(doDumpList)
        {
            if(strstr(relevantHeaps, name) != nullptr) {
                SavestateMemRegionInfo region = {};
                region.address = start;
                region.size = end - start;
                memcpy(region.nameBuffer, name, etl::strlen(name));
                region.nameBuffer[etl::strlen(name)] = (u8)'\0';
                region.nameSize = etl::strlen(name);
                region.TAddFRemove = true;
                EXIPacket::CreateAndSend(EXICommand::CMD_SEND_DUMPLIST, &region, sizeof(SavestateMemRegionInfo));
            }
        }
    }

    INJECTION("dumpAll_gfMemoryPool_hook", 0x8002625c, R"(
        SAVE_REGS
        mr r3, r30
        bl dumpAllGfMemoryPoolHook
        RESTORE_REGS
    )");

    extern "C" void dumpAllGfMemoryPoolHook(char** r30_reg_val, u32 addr_start, u32 addr_end, u32 mem_size, u8 id) {
        _OSDisableInterrupts();
        char* heap_name = *r30_reg_val;
        if(strstr(relevantHeaps, heap_name) != nullptr)
        {
            OSReport("| Hook!  [0x%08x, 0x%08x] size = 0x%08x  name = %s |\n", addr_start, addr_end, mem_size, heap_name);
            SavestateMemRegionInfo memRegion = {};
            memRegion.address = (u32)addr_start; // might be bad cast... 64 bit ptr to 32 bit int
            memRegion.size = mem_size;
            memRegion.TAddFRemove = false;
            memcpy(memRegion.nameBuffer, heap_name, etl::strlen(heap_name));
            memRegion.nameBuffer[etl::strlen(heap_name)] = '\0';
            memRegion.nameSize = etl::strlen(heap_name);
            EXIPacket::CreateAndSend(EXICommand::CMD_SEND_DUMPALL, &memRegion, sizeof(SavestateMemRegionInfo));
        }
        _OSEnableInterrupts();
    }

    // gets rid of some printouts when calling dumpAll
    INJECTION("dumpGfMemoryPoolPrintNop", 0x80026288, "nop");
    INJECTION("dumpGfMemoryPoolPrintNop2", 0x8002619c, "nop");
    INJECTION("dumpGfMemoryPoolPrintNop3", 0x800261b4, "nop");
    INJECTION("dumpGfMemoryPoolPrintNop4", 0x800262e0, "nop");
    INJECTION("dumpGfMemoryPoolPrintNop5", 0x800260fc, "nop");
    INJECTION("dumpGfMemoryPoolPrintNop6", 0x80026114, "nop");
    INJECTION("dumpGfMemoryPoolPrintNop7", 0x800260f0, "nop");
    INJECTION("dumpGfMemoryPoolPrintNop8", 0x8002625c, "nop");
    INJECTION("dumpGfMemoryPoolPrintNop9", 0x80026278, "nop");
    INJECTION("dumpGfMemoryPoolPrintNop10", 0x800262ac, "nop");
}

namespace FrameAdvance {

    bool isRollback = false;
    // how many game logic frames we should simulate this frame
    u32 framesToAdvance = 1;
    u32 getFramesToAdvance() { return framesToAdvance; }

    // sets the number of frames of game logic to run every frame
    void TriggerFastForwardState(u8 numFramesToFF) {
        if (framesToAdvance == 1 && numFramesToFF > 0) {
            framesToAdvance = numFramesToFF;
        }
    }
    void StallOneFrame() { 
        if (framesToAdvance == 1) {
            framesToAdvance = 0; 
        }
    }

    void ResetFrameAdvance() { 
        //OSReport("Resetting frameadvance to normal\n");
        framesToAdvance = 1;
    }


    // requests FrameData for specified frame from emulator and assigns it to inputs
    void GetInputsForFrame(u32 frame, FrameData* inputs) {
        EXIPacket::CreateAndSend(EXICommand::CMD_FRAMEDATA, &frame, sizeof(frame));
        readEXI(inputs, sizeof(FrameData), EXIChannel::slotB, EXIDevice::device0, EXIFrequency::EXI_32MHz);
        Util::FixFrameDataEndianness(inputs);
    }

    // should be called on every simulation frame
    void ProcessGameSimulationFrame(FrameData* inputs) {
        _OSDisableInterrupts();
        u32 gameLogicFrame = getCurrentFrame();
        //OSReport("ProcessGameSimulationFrame %u \n", gameLogicFrame);

        // save state on each simulated frame (this includes resim frames)
        Util::SaveState(gameLogicFrame);

        GetInputsForFrame(gameLogicFrame, inputs);
        gameLogicFrame = getCurrentFrame();

        //OSReport("Using inputs %u %u  game frame: %u\n", inputs->playerFrameDatas[0].frame, inputs->playerFrameDatas[1].frame, gameLogicFrame);
        
        //Util::printFrameData(*inputs);

        _OSEnableInterrupts();
    }


    // before inputs are updated, we copy our inputs from the emulator into currentFrameData so that
    // we can inject them into the game when it uses them (see getGamePadStatus hook below)
    FrameData currentFrameData;
    // called near the beginning of update/[ipSwitch] before inputs are converted from raw inputs to "processed" inputs
    SIMPLE_INJECTION(updateIpSwitchPreProcess, 0x8004aa2c, "addi r29, r31, 0x8") {
        _OSDisableInterrupts();
        if (Netplay::IsInMatch()) {
            ProcessGameSimulationFrame(&currentFrameData);
        }
        _OSEnableInterrupts();
    }
    // ending of getGamePadStatus/[gfPadSystem]
    // which is called 4 times (for each player) to convert their raw inputs into "processed" inputs
    INJECTION("getGamePadStatusHook", 0x8002ae40, R"(
        SAVE_REGS
        li r6, 1
        bl getGamePadStatusInjection
        RESTORE_REGS

        li r3, 0x1
    )");

    
    // Do the same thing for getSysPadStatus because this is the one used for knowing if we are paused or not, and who knows what else
    // TODO: consider using just a quick hack that only checks for game pad status if it's being pressed 
    // ending of getSysPadStatus/[gfPadSystem]
    // which is called 8 times (for each player/port) during a match while checking the pause logic and who knows what else
    INJECTION("getSysPadStatusHook", 0x8002b038, R"(
        SAVE_REGS
        li r6, 0
        bl getGamePadStatusInjection
        RESTORE_REGS

        li r3, 0x1
    )");

    void bp() {
        OSReport("BP!\n");
    }

    // On vBrawl this is only iterated over Human players
    extern "C" void getGamePadStatusInjection(gfPadSystem* pad_system, int port, gfPadGamecube* ddst, bool isGamePad) {
        _OSDisableInterrupts();
        // OSReport("PAD %i 0x%x\n", 0, &PAD_SYSTEM->sysPads[0]);
        // OSReport("PAD %i 0x%x\n", 1, &PAD_SYSTEM->sysPads[1]);
        // OSReport("PAD %i 0x%x\n", 2, &PAD_SYSTEM->sysPads[2]);
        // OSReport("PAD %i 0x%x\n", 3, &PAD_SYSTEM->sysPads[3]);
        //Util::printGameInputs(PAD_SYSTEM->sysPads[0]);
        //  if((ddst->releasedButtons.bits + ddst->newPressedButtons.bits) != 0){
        //         OSReport("LOCAL BUTTONS(P%i)===GP(%i)===\n", port, isGamePad);
        //         OSReport("releasedButtons 0x%x\n", ddst->releasedButtons.bits);
        //         OSReport("newPressedButtons 0x%x\n", ddst->newPressedButtons.bits);
        // }

        // if((ddst->buttons.bits) != 0){
        //     // OSReport("LOCAL BUTTONS(P%i)===GP(%i)===\n", port, isGamePad);
        //     // OSReport("buttons 0x%x\n", ddst->buttons.bits);
        //     OSReport("Melee Info=====\n");
        //     OSReport("p1 charId=0x%x ptype=0x%x unk1=0x%x unk2=0x%x\n", GM_GLOBAL_MODE_MELEE->playerData[0].charId, GM_GLOBAL_MODE_MELEE->playerData[0].playerType, GM_GLOBAL_MODE_MELEE->playerData[0].unk1, GM_GLOBAL_MODE_MELEE->playerData[0].unk2);
        //     OSReport("p2 charId=0x%x ptype=0x%x unk1=0x%x unk2=0x%x\n", GM_GLOBAL_MODE_MELEE->playerData[1].charId, GM_GLOBAL_MODE_MELEE->playerData[1].playerType, GM_GLOBAL_MODE_MELEE->playerData[1].unk1, GM_GLOBAL_MODE_MELEE->playerData[1].unk2);
        //     OSReport("p3 charId=0x%x ptype=0x%x unk1=0x%x unk2=0x%x\n", GM_GLOBAL_MODE_MELEE->playerData[2].charId, GM_GLOBAL_MODE_MELEE->playerData[2].playerType, GM_GLOBAL_MODE_MELEE->playerData[2].unk1, GM_GLOBAL_MODE_MELEE->playerData[2].unk2);
        //     OSReport("p4 charId=0x%x ptype=0x%x unk1=0x%x unk2=0x%x\n", GM_GLOBAL_MODE_MELEE->playerData[3].charId, GM_GLOBAL_MODE_MELEE->playerData[3].playerType, GM_GLOBAL_MODE_MELEE->playerData[3].unk1, GM_GLOBAL_MODE_MELEE->playerData[3].unk2);

        // }

        if (Netplay::IsInMatch()) {
            //OSReport("Injecting pad for- frame %u port %i\n", currentFrameData.playerFrameDatas[port].frame, port);
            auto frameData = currentFrameData.playerFrameDatas[port];
            auto pad = isGamePad ? frameData.pad : frameData.sysPad;
            Util::InjectBrawlbackPadToPadStatus(*ddst, pad, port);
            // if(ddst->newPressedButtons.bits == 0x1000){
            //     bp();
            // }

            // TODO: make whole game struct be filled in from dolphin based off a known good match between two characters on a stage like battlefield
            if((ddst->releasedButtons.bits + ddst->newPressedButtons.bits) != 0){
                OSReport("BUTTONS(P%i)===GP(%i)===\n", port, isGamePad);
                OSReport("releasedButtons 0x%x\n", ddst->releasedButtons.bits);
                OSReport("newPressedButtons 0x%x\n", ddst->newPressedButtons.bits);
            }

            // if((ddst->buttons.bits) != 0){
                // OSReport("BUTTONS(P%i)===GP(%i)===\n", port, isGamePad);
                // OSReport("buttons 0x%x\n", ddst->buttons.bits);
            // }

        }
        _OSEnableInterrupts();
    }

    // So basically after fnding out how the pause function works. Which is it checks for the player structs inside the global melee struct, for their player Kind? and two other more variables that I'm not sure what they mean.
    // After checking those, then it actually allows the player to pause the game. 
    // I got stuck at getting the remote system pad inputs sent over to the other client. It was working at some point, then I did something and broke it.
    // Next session I'm going to try and figure that out and it hopefully just works.
    // I also mapped out some player struct vars and made them assigned when filling game settings

    INJECTION("handleFrameAdvanceHook", 0x800173a4, R"(
        SAVE_REGS
        bl setFrameAdvanceFromEmu
        RESTORE_REGS
        
        bl handleFrameAdvance # load framesToAdvance variable into r24
        cmplw r19, r24 # r24 is the number of times gameProc will be called (# of frames to simualate)
    )");
    extern "C" void handleFrameAdvance() {
        //if (framesToAdvance == 1) return; // if we don't need to do anything special, let the game use it's own frame advance
        asm("mr r24, %0"
            :
            : "r" (framesToAdvance)
        );
    }
    extern "C" void setFrameAdvanceFromEmu() {
        // get framesToAdvance value from emu
        EXIPacket::CreateAndSend(EXICommand::CMD_FRAMEADVANCE);
        readEXI(&framesToAdvance, sizeof(u32), EXIChannel::slotB, EXIDevice::device0, EXIFrequency::EXI_32MHz);
        swapByteOrder(framesToAdvance); // since this is coming from emu, gotta swap endian
    }
    
        
}


namespace FrameLogic {
	
    // should be called on every render frame
    void WriteInputsForFrame(u32 currentFrame) {
        u8 localPlayerIdx = Netplay::localPlayerIdx;
        if (localPlayerIdx != Netplay::localPlayerIdxInvalid) {
            PlayerFrameData playerFrame;
            playerFrame.frame = currentFrame;
            playerFrame.playerIdx = localPlayerIdx;
            Util::PopulatePlayerFrameData(playerFrame, Netplay::getGameSettings().localPlayerPort, localPlayerIdx);
            // sending inputs + current game frame
            EXIPacket::CreateAndSend(EXICommand::CMD_ONLINE_INPUTS, &playerFrame, sizeof(PlayerFrameData));
        }
        else {
            OSReport("Invalid player index! Can't send inputs to emulator!\n");
        }
    }

    void FrameDataLogic(u32 currentFrame) {
        // write current inputs to EXI, send to emulator code
        WriteInputsForFrame(currentFrame);
    }
    
    // called at the beginning of the game logic in a frame
    // a this point, inputs are populated for this frame
    // but the game logic that operates on those inputs has not yet happened
    void BeginFrame() {

        u32 currentFrame = getCurrentFrame();

        //Util::printGameInputs(PAD_SYSTEM->pads[0]);

        //Util::printGameInputs(PAD_SYSTEM->sysPads[0]);

        // this is the start of all our logic for each frame. Because EXI writes/reads are synchronous,
        // you can think of the control flow going like this
        // this function -> write data to emulator through exi -> emulator processes data and possibly queues up data
        // to send back to the game -> send data to the game if there is any -> game processes that data -> repeat

        if (Netplay::IsInMatch()) {
            _OSDisableInterrupts();
            // reset flag to be used later
            FrameAdvance::isRollback = false;
            // just resimulated/stalled/skipped/whatever, reset to normal
            FrameAdvance::ResetFrameAdvance();
            OSReport("------ Frame %u ------\n", currentFrame);

            // lol
            DEFAULT_MT_RAND->seed = 0x496ffd00;


            #ifdef NETPLAY_IMPL
                if(!hasDumped)
                {
                    doDumpList = true;
                    dumpList();
                    dumpAll();
                    hasDumped = true;
                    doDumpList = false;
                }
                FrameDataLogic(currentFrame);
            #endif


            _OSEnableInterrupts();
        }

    }


// TODO: this is the address to enable pause, should come in handy when disconnects happen and we need to turn pause back on
    // 8094a810

    // called at the end of the game logic in a frame (rendering logic happens after this func in the frame)
    // at this point, I think its (maybe?) guarenteed that inputs are cleared out already
    void EndFrame() {
    }

    //SIMPLE_INJECTION(beginFrame, 0x80017344, "li r25, 0x0") { BeginFrame(); } // just before gameProc loop
    //SIMPLE_INJECTION(beginFrame, 0x800171b4, "li r25, 0x1") { BeginFrame(); } // top of full game loop
    SIMPLE_INJECTION(beginFrame, 0x80147394, "li r0, 0x1") { BeginFrame(); } // inside beginFrameLogic()
    
    //SIMPLE_INJECTION(pauseCheckHook, 0x800171d8, "rlwinm. r0, r3, 0x1c, 0x1f, 0x1f") { BeginFrame(); }

    // just for timing frames
    SIMPLE_INJECTION(beginningOfMainGameLoop, 0x800171b4, "li	r25, 1") {
        if (Netplay::IsInMatch()) {
            EXIPacket::CreateAndSend(EXICommand::CMD_TIMER_START);
        }
    }
    // inside endGameLogic, after game logic, but before graphics calls
    SIMPLE_INJECTION(endFrame, 0x801473a0, "li r0, 0x0") { 
        if (Netplay::IsInMatch()) {
            EXIPacket::CreateAndSend(EXICommand::CMD_TIMER_END);
        }
        EndFrame();
    }

    // very end of main game loop, after all game logic and graphics calls
    SIMPLE_INJECTION(endMainLoop, 0x800174fc, "lwz r3, 0x100(r23)") {
    }

    #if 1
    // resim optimization
    // gfTask names listed in the array below
    // will not be run during resimulation frames
    #define NUM_NON_RESIM_TASKS 2
    const char* nonResimTasks = R"(
        ecMgr efManager
    )";
    INJECTION("gfTaskProcessHook", 0x8002dc74, R"(
        SAVE_REGS
        bl ShouldSkipGfTaskProcess
        cmpwi r3, 0x0
        beq NO_SKIP
        RESTORE_REGS
        BRANCH r12, 0x8002dd28
        NO_SKIP:
        RESTORE_REGS
        cmpwi r4, 0x8
    )");
    extern "C" bool ShouldSkipGfTaskProcess(u32* gfTask, u32 task_type) {
        if (FrameAdvance::isRollback) { // if we're resimulating, disable certain tasks that don't need to run on resim frames.
            char* taskName = (char*)(*gfTask); // 0x0 offset of gfTask* is the task name
            //OSReport("Processing task %s\n", taskName);
            return strstr(nonResimTasks, taskName) ? true : false; 
        }
        return false;
    }
    #endif


}