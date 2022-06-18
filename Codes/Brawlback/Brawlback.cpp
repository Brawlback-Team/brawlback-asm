#include "Brawlback.h"
#include "Netplay.h"
#include "GmGlobalModeMelee.h"
#include <vector>


STARTUP(startupNotif) {
    OSReport("~~~~~~~~~~~~~~~~~~~~~~~~ Brawlback ~~~~~~~~~~~~~~~~~~~~~~~~\n");
}

u32 getCurrentFrame() {
    return GAME_FRAME->persistentFrameCounter;
}

namespace Util {

    void printInputs(const BrawlbackPad& pad) {
        OSReport(" -- Pad --\n");
        OSReport("StickX: %hhu ", pad.stickX);
        OSReport("StickY: %hhu ", pad.stickY);
        OSReport("CStickX: %hhu ", pad.cStickX);
        OSReport("CStickY: %hhu\n", pad.cStickY);
        OSReport("Buttons: ");
        print_half(pad.buttons);
        OSReport(" LTrigger: %u    RTrigger %u\n", pad.LTrigger, pad.RTrigger);
        //OSReport(" ---------\n"); 
    }

    void printFrameData(const FrameData& fd) {
        for (int i = 0; i < MAX_NUM_PLAYERS; i++) {
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
        }
    }

    BrawlbackPad GamePadToBrawlbackPad(const gfPadGamecube& pad) {
        BrawlbackPad ret;
        ret.buttons = pad.buttons.bits;
        ret.cStickX = pad.cStickX;
        ret.cStickY = pad.cStickY;
        ret.stickX = pad.stickX;
        ret.stickY = pad.stickY;
        ret.LTrigger = pad.LTrigger;
        ret.RTrigger = pad.RTrigger;
        return ret;
    }
    void InjectBrawlbackPadToPadStatus(gfPadGamecube& gamePad, const BrawlbackPad& pad) {
        gamePad.buttons.bits = pad.buttons;
        gamePad.cStickX = pad.cStickX;
        gamePad.cStickY = pad.cStickY;
        gamePad.stickX = pad.stickX;
        gamePad.stickY = pad.stickY;
        gamePad.LTrigger = pad.LTrigger;
        gamePad.RTrigger = pad.RTrigger;
    }

    void SaveState(u32 currentFrame) {        
        EXIPacket::CreateAndSend(EXICommand::CMD_CAPTURE_SAVESTATE, &currentFrame, sizeof(currentFrame));
    }

}



// fill gamesettings struct with game info
void fillOutGameSettings(GameSettings& settings) {
    settings.randomSeed = DEFAULT_MT_RAND->seed;
    settings.stageID = GM_GLOBAL_MODE_MELEE->stageID;


    #define P1_CHAR_ID_IDX 152
    #define P2_CHAR_ID_IDX 244

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
        #endif
        _OSEnableInterrupts();
    }


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

        OSReport("Using inputs %u %u  game frame: %u\n", inputs->playerFrameDatas[0].frame, inputs->playerFrameDatas[1].frame, gameLogicFrame);
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
    // beginning of getGamePadStatus/[gfPadSystem]
    // which is called 4 times (for each player) to convert their raw inputs into "processed" inputs
    INJECTION("getGamePadStatusHook", 0x8002ae40, R"(
        SAVE_REGS
        bl getGamePadStatusInjection
        RESTORE_REGS

        li r3, 0x1
    )");
    extern "C" void getGamePadStatusInjection(gfPadSystem* pad_system, int port, gfPadGamecube* dst) {
        _OSDisableInterrupts();
        if (Netplay::IsInMatch()) {
            //OSReport("Injecting pad for frame %u port %i\n", currentFrameData.playerFrameDatas[port].frame, port);
            //Util::printInputs(currentFrameData.playerFrameDatas[port].pad);
            Util::InjectBrawlbackPadToPadStatus(*dst, currentFrameData.playerFrameDatas[port].pad);
        }
        _OSEnableInterrupts();
    }

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
            PlayerFrameData fData;
            fData.frame = currentFrame;
            fData.playerIdx = localPlayerIdx;
            fData.pad = Util::GamePadToBrawlbackPad(PAD_SYSTEM->pads[localPlayerIdx]);

            // sending inputs + current game frame
            EXIPacket::CreateAndSend(EXICommand::CMD_ONLINE_INPUTS, &fData, sizeof(PlayerFrameData));
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
            FrameDataLogic(currentFrame);
            #endif


            _OSEnableInterrupts();
        }

    }

    // called at the end of the game logic in a frame (rendering logic happens after this func in the frame)
    // at this point, I think its (maybe?) guarenteed that inputs are cleared out already
    void EndFrame() {
        _OSDisableInterrupts();
        if (Netplay::IsInMatch()) {

            //OSReport("------ End Frame ------\n");
        }
        _OSEnableInterrupts();
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
    }

    // very end of main game loop, after all game logic and graphics calls
    SIMPLE_INJECTION(endMainLoop, 0x800174fc, "lwz r3, 0x100(r23)") {
        
    }




    // resim optimization
    // gfTask names listed in the array below
    // will not be run during resimulation frames
    #define NUM_NON_RESIM_TASKS 2
    const char* nonResimTasks[NUM_NON_RESIM_TASKS] = {
        //"Camera",
        "stShadow",
        "grFinalMainBg",
    };
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
            for (int i = 0; i < NUM_NON_RESIM_TASKS; i++) {
                if (!strcmp(taskName, nonResimTasks[i])) { // if they are equal
                    //OSReport("Skipping task processing for %s\n", taskName);
                    return true;
                }
            }
        }
        return false;
    }
    


}
