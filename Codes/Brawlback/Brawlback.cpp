#include "Brawlback.h"
#include "Netplay.h"
#include "GmGlobalModeMelee.h"
#include <vector>

static bool shouldTrackAllocs = false;

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

      void SwapFrameDataEndianness(FrameData* fd) {
        for (int i = 0; i < MAX_NUM_PLAYERS; i++) {
            PlayerFrameData* pfd = &fd->playerFrameDatas[i];
            swapByteOrder(pfd->frame);
            swapByteOrder(pfd->randomSeed);
            swapByteOrder(pfd->syncData.anim);
            swapByteOrder(pfd->syncData.locX);
            swapByteOrder(pfd->syncData.locY);
            swapByteOrder(pfd->syncData.percent);
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
    void LoadState(u32 frameToLoad) {        
        EXIPacket::CreateAndSend(EXICommand::CMD_LOAD_SAVESTATE, &frameToLoad, sizeof(frameToLoad));
    }

    void PopulatePlayerFrameData(PlayerFrameData& pfd, u8 pIdx) {
        ftManager* fighterManager = FIGHTER_MANAGER;
        Fighter* fighter = fighterManager->getFighter(fighterManager->getEntryIdFromIndex(pIdx));
        ftOwner* ftowner = fighter->getOwner();

        pfd.frame = getCurrentFrame();
        pfd.playerIdx = pIdx;
        pfd.pad = Util::GamePadToBrawlbackPad(PAD_SYSTEM->pads[pIdx]);
        pfd.syncData.percent = (float)ftowner->getDamage();
        pfd.syncData.stocks = (u8)ftowner->getStockCount();
        pfd.syncData.facingDir = fighter->modules->postureModule->direction < 0.0 ? -1 : 1;
        pfd.syncData.locX = fighter->modules->postureModule->xPos;
        pfd.syncData.locY = fighter->modules->postureModule->yPos;
        pfd.syncData.anim = fighter->modules->statusModule->action;
    }

    void InjectToGame(const FrameData& fd, gfPadGamecube* pad_dst, int port) {
        ftManager* fighterManager = FIGHTER_MANAGER;
        Fighter* fighter = fighterManager->getFighter(fighterManager->getEntryIdFromIndex(port));
        ftOwner* ftowner = fighter->getOwner();
        const PlayerFrameData& pfd = fd.playerFrameDatas[port];

        if (port == 0) {
            // sync rng seed based on the client who is local p1
            DEFAULT_MT_RAND->seed = fd.playerFrameDatas[0].randomSeed;
        }
        // other rand seed(s)??
        
        Util::InjectBrawlbackPadToPadStatus(*pad_dst, fd.playerFrameDatas[port].pad);

        /*
        // resync
        ftowner->setDamage((double)pfd.syncData.percent, 0);
        ftowner->setStockCount((int)pfd.syncData.stocks);
        fighter->modules->postureModule->direction = pfd.syncData.facingDir < 0 ? -1.0 : 1.0;
        fighter->modules->postureModule->xPos = pfd.syncData.locX;
        fighter->modules->postureModule->yPos = pfd.syncData.locY;
        fighter->modules->statusModule->action = pfd.syncData.anim;
        */
    }

    std::vector<SavestateMemRegionInfo> savestateMemRegions = {};

    void AppendMemRegionForSavestate(std::vector<SavestateMemRegionInfo>& regions, u32 address_start, u32 size) {
        // the address of the region is stored in the low order bits, the size of the region is stored in the high bits
        SavestateMemRegionInfo info = {};
        info.address = address_start;
        info.size = size;
        info.TAddFRemove = true;
        regions.push_back(info);
    }
    void UpdateSavestateMemRegionsOnEmu(const std::vector<SavestateMemRegionInfo>& regions) {
        const SavestateMemRegionInfo* regions_ptr = regions.data();
        EXIPacket::CreateAndSend(EXICommand::CMD_SAVESTATE_REGION, regions_ptr, regions.size() * sizeof(*regions_ptr));
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
        shouldTrackAllocs = false;
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
        Util::SwapFrameDataEndianness(inputs);
    }

    // should be called on every simulation frame
    void ProcessGameSimulationFrame(FrameData* inputs) {
        _OSDisableInterrupts();
        u32 gameLogicFrame = getCurrentFrame();

        // save state on each simulated frame (this includes resim frames)
        Util::SaveState(gameLogicFrame);

        GetInputsForFrame(gameLogicFrame, inputs);
        gameLogicFrame = getCurrentFrame(); // a rollback may have changed this

        OSReport("Using inputs %u %u  game frame: %u\n", inputs->playerFrameDatas[0].frame, inputs->playerFrameDatas[1].frame, gameLogicFrame);
        //Util::printFrameData(*inputs);

        #if 0
        OSReport("Input info\n");
        for (int i = 0; i < 2; i++) {
            const SyncData& inputInfo = inputs->playerFrameDatas[i].syncData;
            OSReport("P%i Info\n", i);
            OSReport("x = %f  y = %f\n", inputInfo.locX, inputInfo.locY);
            OSReport("anim = %u  facingdir = %i\n", inputInfo.anim, (int)inputInfo.facingDir);
        }

        ftManager* fighterManager = FIGHTER_MANAGER;

        OSReport("Real info\n");
        for (int i = 0; i < 2; i++) {
            Fighter* fighter = fighterManager->getFighter(fighterManager->getEntryIdFromIndex(i));
            ftOwner* ftowner = fighter->getOwner();
            soModuleAccessor* moacc = fighter->modules;
            
            OSReport("P%i Info\n", i);
            OSReport("x = %f  y = %f\n", moacc->postureModule->xPos, moacc->postureModule->yPos);
            OSReport("anim = %u  facingdir = %f\n", moacc->statusModule->action, moacc->postureModule->direction);
        }
        #endif

        _OSEnableInterrupts();
    }


    // names of heaps that we want to include in our savestates
    const char* heapsToSave = R"(
        System Fighter1Instance Fighter2Instance InfoInstance InfoExtraResource 
        InfoResource Physics WiiPad Fighter1Resource Fighter2Resource 
        FighterEffect FighterTechqniq GameGlobal
    )"; // Effect OverlayCommon CopyFB

    // at this address, r30 contains a (double) ptr to the name of the heap it is dumping
    // so we move it into r3 to get easy access to it in our hook
    INJECTION("dump_gfMemoryPool_hook", 0x8002625c, R"(
        SAVE_REGS
        mr r3, r30
        bl dumpGfMemoryPoolHook
        RESTORE_REGS
    )");
    extern "C" void dumpGfMemoryPoolHook(char** r30_reg_val, u32 addr_start, u32 addr_end, u32 mem_size, u8 id) {
        _OSDisableInterrupts();
        char* heap_name = *r30_reg_val;
        // if the current heap is one we care about
        if (strstr(heapsToSave, heap_name)) {
            OSReport("| Hook!  [0x%08x, 0x%08x] size = 0x%08x  name = %s | ", addr_start, addr_end, mem_size, heap_name);
            Util::AppendMemRegionForSavestate(Util::savestateMemRegions, addr_start, mem_size);
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


    // called when the game calls alloc/[gfMemoryPool] which is it's main allocation function
    // allocated_addr is the pointer to the block of memory allocated, and size is the size of that block
    void ProcessGameAllocation(u8* allocated_addr, u32 size) {
        if (shouldTrackAllocs) {
            //OSReport("ALLOC: size = 0x%08x  allocated addr = 0x%08x\n", size, allocated_addr);
            SavestateMemRegionInfo memRegion = {};
            memRegion.address = (u64)allocated_addr; // might be bad cast... 64 bit ptr to 32 bit int
            memRegion.size = size;
            memRegion.TAddFRemove = true;
            EXIPacket::CreateAndSend(EXICommand::CMD_SAVESTATE_REGION, &memRegion, sizeof(memRegion));
        }
    }
    // called when the game calls free/[gfMemoryPool] which is it's main free function
    // address is the address being freed
    void ProcessGameFree(u8* address) {
        if (shouldTrackAllocs) {
            //OSReport("FREE: addr = 0x%08x\n", address);
            SavestateMemRegionInfo memRegion = {};
            memRegion.address = (u32)address; // is this cast ok?
            memRegion.TAddFRemove = false;
            EXIPacket::CreateAndSend(EXICommand::CMD_SAVESTATE_REGION, &memRegion, sizeof(memRegion));
        }
    }


    static bool shouldSaveThisAlloc = false;
    static u32 allocSizeTracker = 0;
    // at the very beginning of alloc/[gfMemoryPool]
    INJECTION("alloc_gfMemoryPool_hook", 0x80025c6c, R"(
        SAVE_REGS
        bl allocGfMemoryPoolBeginHook
        RESTORE_REGS
        lbz	r7, 0x0024 (r3)
    )");
    extern "C" void allocGfMemoryPoolBeginHook(char** internal_heap_data, u32 size, u32 alignment) {
        char* heap_name = *internal_heap_data;
        // if the current heap is one we care about
        shouldSaveThisAlloc = strstr(heapsToSave, heap_name) ? true : false;
        allocSizeTracker = size;
    }
    // at the very end of alloc/[gfMemoryPool]
    INJECTION("alloc_gfMemoryPool_END_hook", 0x80025ec4, R"(
        mr r3, r30
        SAVE_REGS
        bl allocGfMemoryPoolEndHook
        RESTORE_REGS
    )");
    extern "C" void allocGfMemoryPoolEndHook(u8* alloc_addr) {
        if (shouldSaveThisAlloc) {
            ProcessGameAllocation(alloc_addr, allocSizeTracker);
        }
    }
    // at the very beginning of free/[gfMemoryPool]
    INJECTION("free_gfMemoryPool_hook", 0x80025f40, R"(
        addi r31, r3, 40
        SAVE_REGS
        bl freeGfMemoryPoolHook
        RESTORE_REGS
    )");
    extern "C" void freeGfMemoryPoolHook(char** internal_heap_data, u8* address) {
        char* heap_name = *internal_heap_data;
        // if the current heap is one we care about
        if (strstr(heapsToSave, heap_name)) {
            ProcessGameFree(address);
        }
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
            Util::InjectToGame(currentFrameData, dst, port);
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
            FrameData fData;
            // populate all players here so we have their SyncData
            for (int i = 0; i < Netplay::getGameSettings().numPlayers; i++) {
                Util::PopulatePlayerFrameData(fData.playerFrameDatas[i], i);
            }
            // sending inputs + current game frame
            EXIPacket::CreateAndSend(EXICommand::CMD_ONLINE_INPUTS, &fData, sizeof(FrameData));
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

        if (currentFrame == 0) {
            Util::savestateMemRegions.clear();
            // call dumpAll so we get the allocated important mem regions
            dumpAll();

            // TODO: this may not be working great because we only probe the mem regions at the beginning of the match, and if anything ends
            // up getting freed, that mem would still be rollbacked which i guess could cause the crashes/hangs...

            // some specific hardcoded regions that we know are important
            static const std::vector<std::vector<u32>> static_addrs = {
                // {start addr, end addr}

                {0x805b8a00, 0x805b8a00+0x17c}, // gfTaskScheduler
                {0x9134cc00, 0x9134cc10}, // CopyFB edited

                //{0x80611f60, 0x80673460}, // System
                //{0x80b8db60, 0x80c23a60}, // Effect
                //{0x8123ab60, 0x8128cb60}, // Fighter1Instance
                //{0x8128cb60, 0x812deb60}, // Fighter2Instance
                //{0x81601960, 0x81734d60}, // InfoInstance
                //{0x815edf60, 0x817bad60}, // InfoExtraResource
                //{0x80c23a60, 0x80da3a60}, // InfoResource
                //{0x8154e560, 0x81601960}, // Physics
                //{0x80A471A0, 0x80b8db60}, // OverlayCommon 4/4
                //{0x90e61400, 0x90e77500}, // WiiPad
                //{0x9151fa00, 0x917C9400}, // first half of Fighter1Resource
                //{0x91b04c80, 0x91DAE680}, // Fighter2Resource first half
                //{0x91478e00, 0x914d2900}, // FighterEffect
                //{0x92cb4400, 0x92dcdf00}, // FighterTechqniq
                //{0x90167400, 0x90199800}, // GameGlobal

                //{0x800064E0, 0x80009760},  //DataSection0 ?
                //{0x80009760, 0x8000C860},  //DataSection1 ?
                //{0x804064E0, 0x804067E0},  //DataSection2 ?
                //{0x804067E0, 0x80406800},  //DataSection3 ?
                /*
                {0x80406800, 0x80420680},  //DataSection4   vsync
                {0x80420680, 0x80494840},  //DataSection5  OS/System stuff
                {0x8059C420, 0x8059FF80},  //DataSection6 graphics and other system stuff
                {0x805A1320, 0x805A5120},  //DataSection7 more vsync?
                {0x80494880, 0x805A5154},  //BSS  like literally everything
                */
            };
            for (int i = 0; i < static_addrs.size(); i++) {
                Util::AppendMemRegionForSavestate(Util::savestateMemRegions, static_addrs.at(i).at(0), static_addrs.at(i).at(1) - static_addrs.at(i).at(0));
            }

            Util::UpdateSavestateMemRegionsOnEmu(Util::savestateMemRegions);
            shouldTrackAllocs = true;
        }

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
    #if 0
    const char* nonResimTasks = R"(
        ecMgr EffectManager
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
            return strstr(taskName, nonResimTasks) ? true : false; 
        }
        return false;
    }
    #endif
    


}
