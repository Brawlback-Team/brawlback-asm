#include "Brawlback.h"
#include "Netplay.h"

#define NETPLAY_IMPL 1
#define ROLLBACK_IMPL 1

#include <cstdlib>
#include <cstring>


STARTUP(startupNotif) {
    OSReport("~~~~~~~~~~~~~~~~~~~~~~~~ Brawlback ~~~~~~~~~~~~~~~~~~~~~~~~\n");
}

u32 getCurrentFrame() {
    return GAME_FRAME->persistentFrameCounter;
}

void printInputs(const BrawlbackPad& pad) {
    OSReport(" -- Pad --\n");

    OSReport("StickX: %i\n", (int)pad.stickX);
    OSReport("StickY: %i\n", (int)pad.stickY);
    OSReport("CStickX: %i\n", (int)pad.cStickX);
    OSReport("CStickY: %i\n", (int)pad.cStickY);
    OSReport("Buttons: ");
    print_half(pad.buttons);
    OSReport("LTrigger: %u    RTrigger %u\n", pad.LTrigger, pad.RTrigger);

    OSReport(" ---------\n");

}

bool isInputsEqual(BrawlbackPad* p1, BrawlbackPad* p2) {
    #define TRIGGER_DEADZONE_THRESHOLD 44
    bool buttons = p1->buttons == p2->buttons;
    bool trigger_deadzones = p1->LTrigger <= TRIGGER_DEADZONE_THRESHOLD && p2->LTrigger <= TRIGGER_DEADZONE_THRESHOLD;
    bool triggers = p1->LTrigger == p2->LTrigger && p1->RTrigger == p2->RTrigger;
    bool analogSticks = p1->stickX == p2->stickX && p1->stickY == p2->stickY;
    bool cSticks = p1->cStickX == p2->cStickX && p1->cStickY == p2->cStickY;
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
void InjectBrawlbackPadToGame(const BrawlbackPad& pad, u8 playerIdx) {
    gfPadGamecube* gamePad = &PAD_SYSTEM->pads[playerIdx];
    gamePad->buttons.bits = pad.buttons;
    gamePad->cStickX = pad.cStickX;
    gamePad->cStickY = pad.cStickY;
    gamePad->stickX = pad.stickX;
    gamePad->stickY = pad.stickY;
    gamePad->LTrigger = pad.LTrigger;
    gamePad->RTrigger = pad.RTrigger;
}

// fill gamesettings struct with game info
void fillOutGameSettings(GameSettings* settings) {
    settings->randomSeed = DEFAULT_MT_RAND->seed;
    settings->stageID = GM_GLOBAL_MODE_MELEE->stageID;

    // brawl loads all players into the earliest slots.
    // I.E. if players choose P1 and P3, they will get loaded into P1 and P2
    // this means we can use the number of players in a match to iterate over
    // players since we know they'll always be next to each other

    // TODO: replace this with some way to get the actual number of players in a match.
    // unfortunately FIGHTER_MANAGER->getEntryCount() isn't filled out at this point in the game loading
    // sequence. Gotta find another way to get it, or some better spot to grab the number of players
    settings->numPlayers = 2;
    OSReport("Num Players: %u\n", (unsigned int)settings->numPlayers);
}


// take gamesettings and apply it to our game
void MergeGameSettingsIntoGame(GameSettings* settings) {
    //DEFAULT_MT_RAND->seed = settings->randomSeed;
    DEFAULT_MT_RAND->seed = 0x496ffd00; // hardcoded for testing (arbitrary number)
    OTHER_MT_RAND->seed = 0x496ffd00;

    //GM_GLOBAL_MODE_MELEE->stageID = settings->stageID;
    GM_GLOBAL_MODE_MELEE->stageID = 2;

    Netplay::localPlayerIdx = settings->localPlayerIdx;
    OSReport("Local player index is %u\n", (unsigned int)Netplay::localPlayerIdx);
}


namespace Match {
    bool isInMatch = false;
    bool IsInMatch() { return isInMatch; }


    // on scene start (AFTER the start/[scMelee] function has run)

    SIMPLE_INJECTION(startSceneMelee, 0x806d176c, "addi	sp, sp, 112") {
        _OSDisableInterrupts();
        OSReport("  ~~~~~~~~~~~~~~~~  Start Scene Melee  ~~~~~~~~~~~~~~~~  \n");
        //bool shouldNetplay = Netplay::CheckShouldStartNetplay();
        #if NETPLAY_IMPL
        Netplay::StartMatch(); // start netplay logic
        #endif
        isInMatch = true;
        _OSEnableInterrupts();
    }

    // on scene exit
    SIMPLE_INJECTION(exitSceneMelee, 0x806d4844, "li r4, 0x0") {
        _OSDisableInterrupts();
        OSReport("  ~~~~~~~~~~~~~~~~  Exit Scene Melee  ~~~~~~~~~~~~~~~~  \n");
        #if NETPLAY_IMPL
        Netplay::EndMatch();
        #endif
        isInMatch = false;
        _OSEnableInterrupts();
    }


}

namespace FrameAdvance {

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
        bl handleFrameAdvance
        cmplw r19, r24
    )");
    extern "C" void handleFrameAdvance() {
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
        for (int i = 0; i < Netplay::getGameSettings()->numPlayers; i++) {
            PlayerFrameData* playerFrameData = &playerFrameDatas[i];
            InjectBrawlbackPadToGame(playerFrameData->pad, playerFrameData->playerIdx);
        }
    }

    // for keeping track of the past few framedatas
    vector<FrameData*> pastFrameDatas = {};

    void FindAndInjectInputsForResimFrame(u32 gameLogicFrame) {
        bool foundInputs = false;
        for (int i = 0; i < pastFrameDatas.size(); i++) {
            FrameData* fd = pastFrameDatas[i];
            ASSERT(fd->playerFrameDatas[0].frame == fd->playerFrameDatas[1].frame);
            //OSReport("framedata frame for idx 0 %u   for idx 1 %u\n", fd->playerFrameDatas[0].frame, fd->playerFrameDatas[1].frame);
            if (fd->playerFrameDatas[0].frame == gameLogicFrame && fd->playerFrameDatas[1].frame == gameLogicFrame) {
                // inject inputs and break out
                PlayerFrameData* playerFrameDatas = &fd->playerFrameDatas[0];
                InjectInputsForAllPlayers(playerFrameDatas);
                foundInputs = true;
                break;
            }

        }

        if (!foundInputs) {
            OSReport("Couldn't find inputs for frame %u for resimulating!\n", gameLogicFrame);
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


    // this is at the very beginning of the main game logic loop (right before 'gameProc'). This should be a good place to inject inputs for
    // each fast-forwarded frame
    SIMPLE_INJECTION(resimPoint, 0x80017354, "or r4, r19, r19") {
        _OSDisableInterrupts();
        // if we are currently resimulating
        if (framesToAdvance > 1) {
            u32 gameLogicFrame = getCurrentFrame();
            if (!pastFrameDatas.empty()) {
                FindAndInjectInputsForResimFrame(gameLogicFrame);
            }
            // during resim frames we need to save state since gamestate will be different on these frames than it was before
            FrameLogic::SaveState(gameLogicFrame);
        }
        else if (overrideInputs != nullptr) {
            for (u8 i = 0; i < Netplay::getGameSettings()->numPlayers; i++) {
                InjectBrawlbackPadToGame(overrideInputs[i].pad, overrideInputs[i].playerIdx);
            }
            free(overrideInputs);
            overrideInputs = nullptr;
        }
        _OSEnableInterrupts();
    }

}


namespace FrameLogic {

    void ProcessFrameDataFromEmu(FrameData* framedata) {
        u8 numPlayers = Netplay::getGameSettings()->numPlayers;
        // probably not necessary
        // the "frame" of this framedata isn't used
        for (u8 i = 0; i < numPlayers; i++) {
            PlayerFrameData* remotePlayerFrameData = &framedata->playerFrameDatas[i];
            swapByteOrder(&remotePlayerFrameData->frame);
        }
        
        if (FrameAdvance::overrideInputs != nullptr) {
            OSReport("Override inputs already populated!\n");
            free(FrameAdvance::overrideInputs);
            FrameAdvance::overrideInputs = nullptr;
        }
        FrameAdvance::overrideInputs = (PlayerFrameData*)malloc(sizeof(PlayerFrameData)*numPlayers);
        memcpy(FrameAdvance::overrideInputs, &framedata->playerFrameDatas[0], sizeof(PlayerFrameData)*numPlayers);
    }

    void FixRollbackInfoEndianess(RollbackInfo* rollbackInfo) {
        swapByteOrder(&rollbackInfo->beginFrame); // swap endianness since these values came from emu (and are longer than 1 byte)
        swapByteOrder(&rollbackInfo->endFrame);
        for (int pIdx = 0; pIdx < Netplay::getGameSettings()->numPlayers; pIdx++) {
            for (int i = 0; i < MAX_ROLLBACK_FRAMES; i++) {
                PlayerFrameData* pfd = &rollbackInfo->pastFrameDatas[i].playerFrameDatas[pIdx];
                if (pfd->frame != 0) { // frame 0 means there's no past framedata there
                    swapByteOrder(&pfd->frame);
                }
            }
            PlayerFrameData* predictedInput = &rollbackInfo->predictedInputs.playerFrameDatas[pIdx];
            swapByteOrder(&predictedInput->frame);
        }
    }

    // takes RollbackInfo struct and performs logic that triggers the actual rollback/resimulation
    void ExecuteRollback(RollbackInfo* rollbackInfo) {
        int numFramesToResimulate = ((int)rollbackInfo->endFrame - (int)rollbackInfo->beginFrame);
        FrameAdvance::pastFrameDatas.clear();

        // according to fudge, reallocating like this is better than just using clear
        //FrameAdvance::pastFrameDatas.reallocate(0);
        //FrameAdvance::pastFrameDatas.reallocate(1); 

        if (rollbackInfo->pastFrameDataPopulated) {
            // populate pastFrameDatas for resim
            for (int i = 0; i < MAX_ROLLBACK_FRAMES; i++) { // just naively copying all of em for now lol
                FrameData* pastFD = (FrameData*)malloc(sizeof(FrameData));
                memcpy(pastFD, &rollbackInfo->pastFrameDatas[i], sizeof(FrameData));
                FrameAdvance::pastFrameDatas.push(pastFD);
            }
            OSReport("Populated gameside pastFrameDatas. Num frames to resim: %i\n", numFramesToResimulate);
        }

        // load state
        EXIPacket stateReloadPckt = EXIPacket(EXICommand::CMD_LOAD_SAVESTATE, rollbackInfo, sizeof(RollbackInfo));
        if (stateReloadPckt.Send()) {
            // if we only need to resim 1 frame, leave it at that. Otherwise, resim an extra frame to get to where we were before
            //numFramesToResimulate = numFramesToResimulate == 1 ? numFramesToResimulate : numFramesToResimulate + 1;
            FrameAdvance::TriggerFastForwardState(numFramesToResimulate+1);
        }
    }

    // takes in a RollbackInfo struct, and whether or not we should switch the endianness of the struct members
    // and figures out if we should rollback or not, and does the rollback if so.
    // if not, it will just inject remote inputs as usual
    void ProcessRollback(RollbackInfo* rollbackInfo, bool shouldSwitchEndian) {
        // number of frames to resim is the frame we received inputs again - the frame we began not receiving inputs
        if (shouldSwitchEndian) {
            FixRollbackInfoEndianess(rollbackInfo);
        }
        int numFramesToResimulate = ((int)rollbackInfo->endFrame - (int)rollbackInfo->beginFrame);
        OSReport("ProcessRollback: endframe: %u  beginframe: %u  numframestoresim %i\n", rollbackInfo->endFrame, rollbackInfo->beginFrame, numFramesToResimulate);
        if (numFramesToResimulate <= 0 || numFramesToResimulate > MAX_ROLLBACK_FRAMES) {
            OSReport("Num frames to resim invalid! %i\n", numFramesToResimulate);
            return;
        }

        #if 0
        OSReport("Full past framedatas\n");
        for (int i = 0; i < MAX_ROLLBACK_FRAMES; i++) {
            const FrameData& fd = rollbackInfo->pastFrameDatas[i];
            OSReport("~~~~~~~ pastFramedatas[%i] ~~~~~~~\n", i);
            for (int pIdx = 0; pIdx < 2; pIdx++) {
                OSReport("pIdx %i:::   Frame %u\n", pIdx, fd.playerFrameDatas[pIdx].frame);
            }
        }
        #endif
        
        bool shouldRollback = false;
        if (rollbackInfo->pastFrameDataPopulated) {

            for (int pIdx = 0; pIdx < Netplay::getGameSettings()->numPlayers; pIdx++) {
                if (pIdx == Netplay::localPlayerIdx) continue; // only check remote players inputs
                PlayerFrameData* predictedInput = &rollbackInfo->predictedInputs.playerFrameDatas[pIdx];
                for (int i = 0; i < numFramesToResimulate; i++) { // iterate from oldest to newest

                    PlayerFrameData* pastFramedata = &rollbackInfo->pastFrameDatas[i].playerFrameDatas[pIdx];
                    OSReport("Checking inputs frame %u\n", pastFramedata->frame);

                    // check if remote inputs from the past don't match predicted inputs
                    if (!isInputsEqual(&predictedInput->pad, &pastFramedata->pad)) {
                        if (pastFramedata->frame == 0) {
                            OSReport("Blank past framedata! i = %u pIdx = %u\n", i, pIdx);
                            continue;
                        }

                        // if inputs don't match, set the frame we should rollback to
                        rollbackInfo->beginFrame = pastFramedata->frame;
                        shouldRollback = true;
                        // since we changed the beginFrame, we also need to change how many frames to resim
                        //numFramesToResimulate = ((int)rollbackInfo->endFrame - (int)rollbackInfo->beginFrame);
                        
                        OSReport("Predicted inputs don't match actual remote inputs on frame %i  pidx %u idx %i\n", rollbackInfo->beginFrame, pIdx, i);
                        break;
                    }

                }
            }

        }


        if (shouldRollback) {
            ExecuteRollback(rollbackInfo);
        }
        else {
            // if we don't need to rollback, that means actual remote inputs match predicted inputs
            // in that case, we still need to inject inputs for the remote player
            OSReport("No need to rollback! Predicted inputs match actual inputs\n");
            u32 frame = getCurrentFrame();
            bool found = false;
            for (int pIdx = 0; pIdx < Netplay::getGameSettings()->numPlayers; pIdx++) {
                if (pIdx == Netplay::localPlayerIdx) continue; // don't inject for local player

                for (int i = 0; i < MAX_ROLLBACK_FRAMES; i++) {
                    // inject inputs for this frame
                    if (rollbackInfo->pastFrameDatas[i].playerFrameDatas[pIdx].frame == frame) {
                        found = true;
                        OSReport("injecting inputs for frame %u\n", frame);
                        FrameData* pastFrameDataToInject = &rollbackInfo->pastFrameDatas[i];
                        ProcessFrameDataFromEmu(pastFrameDataToInject);
                    }
                }

            }
            if (!found) {
                OSReport("Couldn't find inputs to inject on non-rollback frame! %u\n", frame);
            }
        }

    }

    void ReadFrameData() {
        // game (us, right here) specifies how much memory to read in from emulator.
        
        u8* cmd_byte_read = (u8*)malloc(1);
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
                        FrameData* framedata = (FrameData*)data;
                        ProcessFrameDataFromEmu(framedata);
                    }
                    break;
                case CMD_ROLLBACK:
                    {
                        #if ROLLBACK_IMPL
                        //OSReport("Rollback gameside\n");
                        RollbackInfo* rollbackInfo = (RollbackInfo*)data;
                        ProcessRollback(rollbackInfo, true);
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

    void FrameDataLogic(u32 currentFrame) {
        
        u8 localPlayerIdx = Netplay::localPlayerIdx;
        if (localPlayerIdx != Netplay::localPlayerIdxInvalid) {
            PlayerFrameData* fData = (PlayerFrameData*)malloc(sizeof(PlayerFrameData));
            fData->frame = currentFrame;
            fData->playerIdx = localPlayerIdx;
            fData->pad = GamePadToBrawlbackPad(PAD_SYSTEM->pads[localPlayerIdx]);
            //memcpy(&fData->pad, &PAD_SYSTEM->pads[localPlayerIdx], sizeof(gfPadGamecube));

            // sending inputs + current game frame
            EXIPacket fDataPckt = EXIPacket(EXICommand::CMD_ONLINE_INPUTS, fData, sizeof(PlayerFrameData));
            fDataPckt.Send();
            free(fData);

            // reading in response from emu
            ReadFrameData();
        }
        else {
            OSReport("Invalid player index! Can't send inputs to emulator!\n");
        }
    }

    void SaveState(u32 currentFrame) {        
        EXIPacket saveSavePckt = EXIPacket(EXICommand::CMD_CAPTURE_SAVESTATE, &currentFrame, sizeof(currentFrame));
        saveSavePckt.Send();
    }

    //Does not update random seed, so multiple uses at once return same value
    int randi(int max) {
        return DEFAULT_MT_RAND->seed % max;
    }

    bool percentChance(int percent) {
        return randi(100) <= percent-1;
    }


    // called at the beginning of the game logic in a frame
    // a this point, inputs are populated for this frame
    // but the game logic that operates on those inputs has not yet happened
    void BeginFrame() {
        
        // this is the start of all our logic for each frame. Because EXI writes/reads are synchronous,
        // you can think of the control flow going like this
        // this function -> write data to emulator through exi -> emulator processes data and possibly queues up data
        // to send back to the game -> send data to the game if there is any -> game processes that data -> repeat

        if (Match::isInMatch) {
            _OSDisableInterrupts();

            u32 currentFrame = getCurrentFrame();
            OSReport("------ Frame %u ------\n", currentFrame);
            
            #if ROLLBACK_IMPL
            if (FrameAdvance::framesToAdvance >= 1) { // dont save state on stalled frames
                SaveState(currentFrame);
            }
            else {
                //OSReport("Didn't save state - framesToAdvance: %i\n", FrameAdvance::framesToAdvance);
            }
            #endif
            
            // just resimulated/stalled/skipped/whatever, reset to normal
            FrameAdvance::ResetFrameAdvance();
            
            #if NETPLAY_IMPL
            FrameDataLogic(currentFrame);
            #else
                #if ROLLBACK_IMPL
                //bool shouldRollback = PAD_SYSTEM->pads[0].buttons.A || PAD_SYSTEM->pads[1].buttons.A;
                bool shouldRollback = currentFrame % 20 == 0; 
                const int numFramesToRollback = MAX_ROLLBACK_FRAMES;

                if (shouldRollback && currentFrame > 250) {
                    RollbackInfo rollbackInfo;
                    rollbackInfo.beginFrame = getCurrentFrame() - numFramesToRollback;
                    rollbackInfo.endFrame = getCurrentFrame();
                    OSReport("numframestorollback %i  beginFrame: %u    endFrame: %u\n", numFramesToRollback, rollbackInfo.beginFrame, rollbackInfo.endFrame);
                    rollbackInfo.hasPreserveBlocks = false;
                    rollbackInfo.pastFrameDataPopulated = false;
                    EXIPacket stateReloadPckt = EXIPacket(EXICommand::CMD_LOAD_SAVESTATE, &rollbackInfo, sizeof(RollbackInfo));
                    if (stateReloadPckt.Send()) {
                        FrameAdvance::TriggerFastForwardState(numFramesToRollback  +1);
                    }
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
        if (Match::isInMatch) {
            _OSDisableInterrupts();

            //OSReport("------ End Frame ------\n");
            _OSEnableInterrupts();
        }
    }

    //SIMPLE_INJECTION(beginFrame, 0x80017344, "li r25, 0x0") { BeginFrame(); } // just before main game logic loop
    //SIMPLE_INJECTION(beginFrame, 0x800171b4, "li r25, 0x1") { BeginFrame(); } // top of full game loop

    SIMPLE_INJECTION(beginFrame, 0x80147394, "li r0, 0x1") { BeginFrame(); } // inside beginFrameLogic()
    //SIMPLE_INJECTION(endFrame,   0x801473a0, "li r0, 0x0") { EndFrame(); }
  
}