#include "Brawlback.h"
#include "Netplay.h"
#include "GmGlobalModeMelee.h"



STARTUP(startupNotif) {
    OSReport("~~~~~~~~~~~~~~~~~~~~~~~~ Brawlback ~~~~~~~~~~~~~~~~~~~~~~~~\n");
}

u32 getCurrentFrame() {
    return GAME_FRAME->persistentFrameCounter;
}

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

void SyncLoc(const BrawlbackPad& pad, u8 playerIdx) {
    OSReport("[Sync] Injecting inputs for player %u on frame %u\n", (unsigned int)playerIdx, getCurrentFrame());
    printInputs(pad);
    OSReport("[/Sync]\n");
}

bool isInputsEqual( const BrawlbackPad& p1, const BrawlbackPad& p2) {
    #define TRIGGER_DEADZONE_THRESHOLD 44
    bool buttons = p1.buttons == p2.buttons;
    bool trigger_deadzones = p1.LTrigger <= TRIGGER_DEADZONE_THRESHOLD && p2.LTrigger <= TRIGGER_DEADZONE_THRESHOLD;
    bool triggers = p1.LTrigger == p2.LTrigger && p1.RTrigger == p2.RTrigger;
    bool analogSticks = p1.stickX == p2.stickX && p1.stickY == p2.stickY;
    bool cSticks = p1.cStickX == p2.cStickX && p1.cStickY == p2.cStickY;
    return buttons && (trigger_deadzones || triggers) && analogSticks && cSticks;
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
void InjectBrawlbackPadToGame(const BrawlbackPad& pad, u8 playerIdx) {
    //SyncLoc(pad, playerIdx);
    gfPadGamecube& gamePad = PAD_SYSTEM->pads[playerIdx];
    InjectBrawlbackPadToPadStatus(gamePad, pad);
}

void InjectFrameDataToPadStatusArray(const FrameData& fd, gfPadGamecube* pad_statuses) {
    for (int i = 0; i < Netplay::getGameSettings().numPlayers; i++) {
        InjectBrawlbackPadToPadStatus(pad_statuses[i], fd.playerFrameDatas[i].pad);
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

    GMMelee::PopulateMatchSettings( {p1_char, p2_char, -1, -1}, settings.stageID );
}


namespace Match {

    // on scene start (AFTER the start/[scMelee] function has run)

    SIMPLE_INJECTION(startSceneMelee, 0x806d176c, "addi	sp, sp, 112") {
        _OSDisableInterrupts();
        OSReport("  ~~~~~~~~~~~~~~~~  Start Scene Melee  ~~~~~~~~~~~~~~~~  \n");
        #ifdef NETPLAY_IMPL
        //Netplay::StartMatching(); // now moved to GmGlobalModeMelee.cpp
        #endif
        Netplay::SetIsInMatch(true);
        //modeChange(getIpSwitchInstance(), 0);
        _OSEnableInterrupts();
    }

    // on scene exit
    SIMPLE_INJECTION(exitSceneMelee, 0x806d4844, "li r4, 0x0") {
        _OSDisableInterrupts();
        OSReport("  ~~~~~~~~~~~~~~~~  Exit Scene Melee  ~~~~~~~~~~~~~~~~  \n");
        #ifdef NETPLAY_IMPL
        Netplay::EndMatch();
        #endif
        Netplay::SetIsInMatch(false);
        _OSEnableInterrupts();
    }


}

namespace FrameAdvance {

    bool isRollback = false;
    // how many game logic frames we should simulate this frame
    int framesToAdvance = 1;
    int getFramesToAdvance() { return framesToAdvance; }

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
        if (framesToAdvance != 1) {
            //OSReport("Resetting frameadvance to normal\n");
            framesToAdvance = 1;
        }
    }

    // og instruction: cmplw r19, r24
    // # of frames to simulate is stored in r24

    // keep in mind that overriding this means that brawl's native
    // catchup system where it fast forwards a few frames when it lags is no longer active
    //     this *may*????? have unintended consequences, but I honestly don't think it will...
    // in the future, it would be pretty easy to use brawl's system to fast forward laggy clients
    // instead of stalling the one ahead. 
    INJECTION("handleFrameAdvanceHook", 0x800173a4, R"(
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


    // array of inputs for each player to get injected
    PlayerFrameData* overrideInputs = nullptr;

    // playerFrameDatas should have numPlayers # of framedatas
    void InjectInputsForAllPlayers(PlayerFrameData* playerFrameDatas) {
        OSReport("Injecting inputs for frame %u\n", playerFrameDatas->frame);
        for (int i = 0; i < Netplay::getGameSettings().numPlayers; i++) {
            PlayerFrameData* playerFrameData = &playerFrameDatas[i];
            if (i != playerFrameData->playerIdx) {
                OSReport("incorrect (?) playerIdx in playerframedata! frame %u pIdx %u\n", playerFrameData->frame, (unsigned int)playerFrameData->playerIdx);
            }
            InjectBrawlbackPadToGame(playerFrameData->pad, playerFrameData->playerIdx);
        }
    }

    // for keeping track of the past few framedatas
    vector<FrameData*> pastFrameDatas = {};

    void FindInputsForResimFrame(u32 frameToFind, FrameData* inputs) {
        bool foundInputs = false;
        for (int i = 0; i < pastFrameDatas.size(); i++) {
            FrameData* fd = pastFrameDatas[i];
            ASSERT(fd->playerFrameDatas[0].frame == fd->playerFrameDatas[1].frame);
            //OSReport("framedata frame for idx 0 %u   for idx 1 %u\n", fd->playerFrameDatas[0].frame, fd->playerFrameDatas[1].frame);
            if (fd->playerFrameDatas[0].frame == frameToFind) {
                // inject inputs and break out
                PlayerFrameData* playerFrameDatas = &fd->playerFrameDatas[0];
                *inputs = *fd;
                foundInputs = true;
                break;
            }
        }

        if (!foundInputs) {
            OSReport("Couldn't find inputs for frame %u for resimulating!\n", frameToFind);
            OSReport("Full past framedatas\n");
            for (int i = 0; i < MAX_ROLLBACK_FRAMES; i++) {
                FrameData* fd = pastFrameDatas[i];
                OSReport("~~~~~~~ pastFramedatas[%i] ~~~~~~~\n", i);
                for (int pIdx = 0; pIdx < 2; pIdx++) {
                    OSReport("pIdx %i:::   Frame %u\n", pIdx, fd->playerFrameDatas[pIdx].frame);
                }
            }
        }
    }

    // should be called on every simulated frame. Handles injecting inputs (and saving state for resimulated frames) 
    void ProcessGameSimulationFrame(FrameData* inputs) {
        _OSDisableInterrupts();
        u32 gameLogicFrame = getCurrentFrame();
        // if we are currently resimulating
        if (isRollback) {
            if (!pastFrameDatas.empty()) {
                //OSReport("Finding inputs for resim frame %u\n", gameLogicFrame);
                FindInputsForResimFrame(gameLogicFrame, inputs);
            }
            else {
                OSReport("PastFrameDatas was empty!\n");
            }
            // during resim frames we need to save state since gamestate will be different on these frames than it was before
            FrameLogic::SaveState(gameLogicFrame);
        }
        // not resimulating, we probably just need to grab inputs normally
        else if (overrideInputs != nullptr) {
            memcpy(&inputs->playerFrameDatas, overrideInputs, sizeof(PlayerFrameData)*Netplay::getGameSettings().numPlayers);
            inputs->randomSeed = 0; // ?
            //OSReport("Grabbing normal input frame %u\n", inputs->playerFrameDatas[0].frame);

            free(overrideInputs);
            overrideInputs = nullptr;
        }
        if (inputs->playerFrameDatas[0].frame != gameLogicFrame || inputs->playerFrameDatas[1].frame != gameLogicFrame) {
            OSReport("Game frame != injected inputs frame! %u %u  frame: %u\n", inputs->playerFrameDatas[0].frame, inputs->playerFrameDatas[1].frame, gameLogicFrame);
            //printFrameData(*inputs);
        }
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
            //if (port != Netplay::localPlayerIdx) {
                //OSReport("Injecting pad for frame %u port %i", currentFrameData.playerFrameDatas[port].frame, port);
                //printInputs(currentFrameData.playerFrameDatas[port].pad);
            //}
            InjectBrawlbackPadToPadStatus(*dst, currentFrameData.playerFrameDatas[port].pad);
        }
        _OSEnableInterrupts();
    }

    // Clear pad related stubs
    #if 0
    INJECTION("clearPadEdgeReportHook", 0x8002b62c, R"(
        SAVE_REGS
        bl shouldSkipClearPadEdgeReport
        cmpwi r3, 0x1
        beq NO_SKIP_CLEAR_PAD_EDGE
        RESTORE_REGS
        BRANCH r12, 0x8002b6fc     # skip to blr of clearPadEdgeReport
        NO_SKIP_CLEAR_PAD_EDGE:
        RESTORE_REGS

        li r0, 0x2
    )");
    extern "C" bool shouldSkipClearPadEdgeReport() {
        OSReport("CLEAR PAD EDGE REPERT\n");
        // if we're resimulating, don't clear buffered inputs
        return FrameAdvance::isRollback;
    }

    SIMPLE_INJECTION(clearPadQueueHook, 0x80029424, "lwz r3, 0x240(r3)") {
        OSReport("CLEAR PAD QUEUE\n");
        if (FrameAdvance::framesToAdvance != 1) {
            _OSEnableInterrupts();
            asm(R"(
                RESTORE_REGS
                BRANCH r12, 0x80029434
            )");
        }
    }
    #endif
    
        
}


namespace FrameLogic {
	
    void ProcessFrameDataFromEmu(FrameData& framedata) {
        u8 numPlayers = Netplay::getGameSettings().numPlayers;

        size_t inputsSize = sizeof(PlayerFrameData) * numPlayers;
        if (FrameAdvance::overrideInputs != nullptr) {
            //OSReport("Override inputs already populated!\n");
            free(FrameAdvance::overrideInputs);
            FrameAdvance::overrideInputs = nullptr;
        }
        FrameAdvance::overrideInputs = (PlayerFrameData*)malloc(inputsSize);
        memcpy(FrameAdvance::overrideInputs, &framedata.playerFrameDatas[0], inputsSize);
    }

    void FixFrameDataEndianness(FrameData* fd) {
        swapByteOrder(fd->randomSeed);
        for (int i = 0; i < MAX_NUM_PLAYERS; i++) {
            swapByteOrder(fd->playerFrameDatas[i].frame);
        }
    }


    void FixRollbackInfoEndianess(RollbackInfo& rollbackInfo) {
        swapByteOrder(rollbackInfo.beginFrame);
        swapByteOrder(rollbackInfo.endFrame);
        for (int i = 0; i < MAX_ROLLBACK_FRAMES; i++) {
            FixFrameDataEndianness(&rollbackInfo.pastFrameDatas[i]);
        }
        for (int pIdx = 0; pIdx < MAX_NUM_PLAYERS; pIdx++) {
            PlayerFrameData& predictedInput = rollbackInfo.predictedInputs.playerFrameDatas[pIdx];
            swapByteOrder(predictedInput.frame);
        }
    }
	

    void PrintRollbackInfo(RollbackInfo& rb) {
        OSReport("RbInfo beginFrame: %u  endFrame: %u\n", rb.beginFrame, rb.endFrame);
        for (int i = 0; i < MAX_ROLLBACK_FRAMES; i++) {
            const FrameData& fd = rb.pastFrameDatas[i];
            OSReport("~~~~~~~ pastFramedatas[%i] ~~~~~~~\n", i);
            for (int pIdx = 0; pIdx < 2; pIdx++) {
                if (fd.playerFrameDatas[pIdx].frame != 0)
                    OSReport("pIdx %u:::   Frame %u\n", (unsigned int)fd.playerFrameDatas[pIdx].playerIdx, fd.playerFrameDatas[pIdx].frame);
            }
        }
    }


    int getNumFramesToResim(RollbackInfo& rbInfo) {
        // +1 to get back to the frame we were on before. 
        // If we started predicting on frame 100, and ended on frame 102, we should rollback to frame 100, 
        // then resim 100, 101, and 102 (3 frames). 102-100+1 = 3
        int numFramesToResim = ((int)rbInfo.endFrame - (int)rbInfo.beginFrame) + 1;
        if (numFramesToResim <= 0 || numFramesToResim > MAX_ROLLBACK_FRAMES) {
            OSReport("Invalid num frames to resim! %i\n", numFramesToResim);
            return 0;
        }
        return numFramesToResim;
    }


    // takes RollbackInfo struct and performs logic that triggers the actual rollback/resimulation
    void ExecuteRollback(RollbackInfo& rollbackInfo) {
        int numFramesToResimulate = getNumFramesToResim(rollbackInfo);
        FrameAdvance::pastFrameDatas.clear();

        // according to fudge, reallocating like this is better than just using clear
        //FrameAdvance::pastFrameDatas.reallocate(0);
        //FrameAdvance::pastFrameDatas.reallocate(1); 

        if (rollbackInfo.shouldRollbackThisFrame) {
            // copy past inputs into pastFrameDatas for resim
            for (int i = 0; i < MAX_ROLLBACK_FRAMES; i++) {
                // TODO: since the vector impl isn't great we need it to hold pointers, 
                // so this kinda has to be a heap alloc here. Fix vector impl and get rid of the malloc here in the future
                FrameData* pastFD = (FrameData*)malloc(sizeof(FrameData));
                memcpy(pastFD, &rollbackInfo.pastFrameDatas[i], sizeof(FrameData));
                FrameAdvance::pastFrameDatas.push(pastFD);
            }
            OSReport("Populated gameside pastFrameDatas. Num frames to resim: %i\n", numFramesToResimulate);
        }
        else {
            OSReport("ExecuteRollback called, but rollbackinfo shouldRollbackThisFrame was false!\n");
        }

        // do the actual rollback (load state)
        EXIPacket stateReloadPckt = EXIPacket(EXICommand::CMD_LOAD_SAVESTATE, &rollbackInfo, sizeof(RollbackInfo)).Send();
        // trigger fast forward (resimulation)
        FrameAdvance::TriggerFastForwardState(numFramesToResimulate);
        // mark current state as rolling back/resim-ing
        FrameAdvance::isRollback = true;
    }



    void ReadFrameResponse() {
        // game (us, right here) specifies how much memory to read in from emulator.
        
        u8* cmd_byte_read = (u8*)malloc(1);
        // read in one byte from emulator to see how to deal with the rest of the exi buffer
        readEXI(cmd_byte_read, 1, EXIChannel::slotB, EXIDevice::device0, EXIFrequency::EXI_32MHz);
        u8 cmd_byte = cmd_byte_read[0];
        free(cmd_byte_read);

        u32 read_data_size = 0;

        switch (cmd_byte) {
            case CMD_FRAMEDATA:
                {
                    read_data_size = sizeof(FrameData);
                }
                break;
            case CMD_ROLLBACK:
                {
                    read_data_size = sizeof(RollbackInfo);
                }
                break;
            case CMD_TIMESYNC:
                {
                    // stall for one frame here
                    FrameAdvance::StallOneFrame();
                    OSReport("Gameside: stalling for one frame\n");
                }
                return;
            default:
                {
                    //OSReport("Unknown dmaread cmd byte");
                }
                break;
        }

        if (read_data_size > 1) {
            u8* data = (u8*)malloc(read_data_size);
            readEXI(data, read_data_size, EXIChannel::slotB, EXIDevice::device0, EXIFrequency::EXI_32MHz);
            
            switch (cmd_byte) {
                case CMD_FRAMEDATA:
                    {
                        // we've received inputs from the emulator here.
                        // We don't care anything about what the inputs contain or anything about them.
                        // the emulator takes care of the logic for when and how to send inputs, all we do here
                        // is inject them into the game.
                        auto framedata = bufferToObject<FrameData>(data);
                        FixFrameDataEndianness(&framedata);
                        ProcessFrameDataFromEmu(framedata);
                    }
                    break;
                case CMD_ROLLBACK:
                    {
                        #ifdef ROLLBACK_IMPL
                        //OSReport("Rollback gameside\n");
                        auto rollbackInfo = bufferToObject<RollbackInfo>(data);
                        FixRollbackInfoEndianess(rollbackInfo);
                        ExecuteRollback(rollbackInfo);
                        #else
                        OSReport("Tried to rollback, but rollback impl was turned off!\n");
                        #endif
                    }
                default:
                    //OSReport("Unknown dmaread cmd byte");
                    break;
            }
            free(data);
        }
    }

    void WriteInputsForFrame(u32 currentFrame) {
        u8 localPlayerIdx = Netplay::localPlayerIdx;
        if (localPlayerIdx != Netplay::localPlayerIdxInvalid) {
            PlayerFrameData fData;
            fData.frame = currentFrame;
            fData.playerIdx = localPlayerIdx;
            fData.pad = GamePadToBrawlbackPad(PAD_SYSTEM->pads[localPlayerIdx]);

            // sending inputs + current game frame
            EXIPacket fDataPckt = EXIPacket(EXICommand::CMD_ONLINE_INPUTS, &fData, sizeof(PlayerFrameData));
            fDataPckt.Send();
        }
        else {
            OSReport("Invalid player index! Can't send inputs to emulator!\n");
        }
    }

    void FrameDataLogic(u32 currentFrame) {
        // write current inputs to EXI, send to emulator code
        WriteInputsForFrame(currentFrame);
        // read in response from emulator, deal with it here
        ReadFrameResponse();
    }

    void SaveState(u32 currentFrame) {        
        EXIPacket(EXICommand::CMD_CAPTURE_SAVESTATE, &currentFrame, sizeof(currentFrame)).Send();
    }

    // called at the beginning of the game logic in a frame
    // a this point, inputs are populated for this frame
    // but the game logic that operates on those inputs has not yet happened
    void BeginFrame() {
        
        // this is the start of all our logic for each frame. Because EXI writes/reads are synchronous,
        // you can think of the control flow going like this
        // this function -> write data to emulator through exi -> emulator processes data and possibly queues up data
        // to send back to the game -> send data to the game if there is any -> game processes that data -> repeat

        if (Netplay::IsInMatch()) {
            _OSDisableInterrupts();
            // reset flag to be used later
            FrameAdvance::isRollback = false;


            // lol
            DEFAULT_MT_RAND->seed = 0x496ffd00;

            u32 currentFrame = getCurrentFrame();
            OSReport("------ Frame %u ------\n", currentFrame);
            
            #ifdef ROLLBACK_IMPL
            if (FrameAdvance::framesToAdvance >= 1) { // dont save state on stalled frames
                SaveState(currentFrame);
            }
            else {
                //OSReport("Didn't save state - framesToAdvance: %i\n", FrameAdvance::framesToAdvance);
            }
            #endif

            // just resimulated/stalled/skipped/whatever, reset to normal
            FrameAdvance::ResetFrameAdvance();

            #ifdef NETPLAY_IMPL
            FrameDataLogic(currentFrame);
            #else
                #ifdef ROLLBACK_IMPL
                Netplay::getGameSettings()->localPlayerIdx = 0;
                Netplay::localPlayerIdx = 0;
                Netplay::getGameSettings()->numPlayers = 2;
                // manual rollback logic
                // here i'm just rolling back every once in a while and tracking past inputs for resim
                // this is for testing rollbacks without having to be in a netplay match

                if (FrameAdvance::pastFrameDatas.size()+1 > MAX_ROLLBACK_FRAMES+1) {
                    FrameAdvance::pastFrameDatas.erase(0);
                }
                FrameData framedata = FrameData();
                for (int i = 0; i < 2; i++) {
                    framedata.playerFrameDatas[i].pad = GamePadToBrawlbackPad(&PAD_SYSTEM->pads[i]);
                    framedata.playerFrameDatas[i].frame = currentFrame;
                    framedata.playerFrameDatas[i].playerIdx = i;
                }
                //OSReport("Pushing frame %u\n", framedata.playerFrameDatas[0].frame);

                FrameData* tmp_fd = (FrameData*)malloc(sizeof(FrameData));
                memcpy(tmp_fd, &framedata, sizeof(FrameData));
                // if rollbacks are enabled, but not netplay, track past inputs for resim
                FrameAdvance::pastFrameDatas.push(tmp_fd);

                bool shouldRollback = currentFrame % 7 == 0; 
                const int numFramesToRollback = MAX_ROLLBACK_FRAMES;

                if (shouldRollback && currentFrame > 250) {
                    FrameAdvance::isRollback = true;
                    RollbackInfo rollbackInfo;
                    rollbackInfo.beginFrame = getCurrentFrame() - numFramesToRollback;
                    rollbackInfo.endFrame = getCurrentFrame();
                    OSReport("numframestorollback %i  beginFrame: %u    endFrame: %u\n", numFramesToRollback, rollbackInfo.beginFrame, rollbackInfo.endFrame);
                    rollbackInfo.hasPreserveBlocks = false;
                    rollbackInfo.shouldRollbackThisFrame = true;
                    EXIPacket stateReloadPckt = EXIPacket(EXICommand::CMD_LOAD_SAVESTATE, &rollbackInfo, sizeof(RollbackInfo));
                    if (stateReloadPckt.Send()) {
                        FrameAdvance::TriggerFastForwardState(numFramesToRollback  +1);
                    }
                }
                else {
                    ProcessFrameDataFromEmu(&framedata);
                }
                
                
                #endif
            #endif


            _OSEnableInterrupts();
        }
        else { // not in a match
            
        }
    }

    // called at the end of the game logic in a frame (rendering logic happens after this func in the frame)
    // at this point, I think its (maybe?) guarenteed that inputs are cleared out already
    void EndFrame() {
        if (Netplay::IsInMatch()) {
            _OSDisableInterrupts();

            //OSReport("------ End Frame ------\n");
            _OSEnableInterrupts();
        }
    }

    //SIMPLE_INJECTION(beginFrame, 0x80017344, "li r25, 0x0") { BeginFrame(); } // just before gameProc loop
    //SIMPLE_INJECTION(beginFrame, 0x800171b4, "li r25, 0x1") { BeginFrame(); } // top of full game loop
    SIMPLE_INJECTION(beginFrame, 0x80147394, "li r0, 0x1") { BeginFrame(); } // inside beginFrameLogic()
    
    //SIMPLE_INJECTION(pauseCheckHook, 0x800171d8, "rlwinm. r0, r3, 0x1c, 0x1f, 0x1f") { BeginFrame(); }

    // just for timing frames
    SIMPLE_INJECTION(beginningOfMainGameLoop, 0x800171b4, "li	r25, 1") {
        if (Netplay::IsInMatch()) {
            EXIPacket(EXICommand::CMD_TIMER_START).Send();
        }
    }
    // inside endGameLogic, after game logic, but before graphics calls
    SIMPLE_INJECTION(endFrame, 0x801473a0, "li r0, 0x0") { 
        if (Netplay::IsInMatch()) {
            //EndFrame(); 
            EXIPacket(EXICommand::CMD_TIMER_END).Send();
        }
        
    }

    // very end of main game loop, after all game logic and graphics calls
    SIMPLE_INJECTION(endMainLoop, 0x800174fc, "lwz r3, 0x100(r23)") {
        
    }




    // resim optimization
    // gfTask names listed in the array below
    // will not be run during resimulation frames
    #define NUM_NON_RESIM_TASKS 0
    const char* nonResimTasks[NUM_NON_RESIM_TASKS] = {
        //"Camera",
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
    vector<char*> names = {};
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
