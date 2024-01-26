#include "Rollback_Hooks.h"
#include "sy_core.h"
#include <EXI/EXIBios.h>
#include <gf/gf_heap_manager.h>
#include <gf/gf_pad_status.h>
#include <gf/gf_task.h>
#include <modules.h>
#include "ip/ip_pad_config.h"
#include "if/if_mngr.h"
#define P1_CHAR_ID_IDX 0x98
#define P2_CHAR_ID_IDX P1_CHAR_ID_IDX + 0x5C
#define P3_CHAR_ID_IDX P2_CHAR_ID_IDX + 0x5C
#define P4_CHAR_ID_IDX P3_CHAR_ID_IDX + 0x5C

extern "C" void __cxa_pure_virtual() { while (1); }

bu32 frameCounter = 0;
bool shouldTrackAllocs = false;
bool doDumpList = false;
bool isRollback = false;
void setupMelee(void* unk, bu32 stageID);
void render(void* unk);
int getCounter();
bu32 getCurrentFrame() {
    return frameCounter;
}

void FillInMeleeObj() {
     if (GMMelee::isMatchChoicesPopulated) {
        OSReport("Filling in stuff!\n");

        memmove(g_GameGlobal->m_modeMelee, defaultGmGlobalModeMelee, 800);

        g_GameGlobal->m_modeMelee->m_playersInitData[0].m_characterKind = static_cast<gmCharacterKind>(GMMelee::charChoices[0]);
        g_GameGlobal->m_modeMelee->m_playersInitData[1].m_characterKind = static_cast<gmCharacterKind>(GMMelee::charChoices[1]);

        g_GameGlobal->m_modeMelee->m_playersInitData[0].m_costumeID = static_cast<s8>(GMMelee::costumeChoices[0]);
        g_GameGlobal->m_modeMelee->m_playersInitData[1].m_costumeID = static_cast<s8>(GMMelee::costumeChoices[1]);

        g_GameGlobal->m_modeMelee->m_playersInitData[0].m_colorFileIdx = static_cast<s8>(GMMelee::fileIndexChoices[0]);
        g_GameGlobal->m_modeMelee->m_playersInitData[1].m_colorFileIdx = static_cast<s8>(GMMelee::fileIndexChoices[1]);

        g_GameGlobal->m_modeMelee->m_playersInitData[0].m_state = 0;
        g_GameGlobal->m_modeMelee->m_playersInitData[1].m_state = 0;

        g_GameGlobal->m_modeMelee->m_playersInitData[0].m_playerId = 0;
        g_GameGlobal->m_modeMelee->m_playersInitData[1].m_playerId = 1;

        g_GameGlobal->m_modeMelee->m_playersInitData[0].m_stockCount = g_GameGlobal->m_setRule->m_stockCount;
        g_GameGlobal->m_modeMelee->m_playersInitData[1].m_stockCount = g_GameGlobal->m_setRule->m_stockCount;

        g_GameGlobal->m_modeMelee->m_playersInitData[0].unk1 = 0x80;
        g_GameGlobal->m_modeMelee->m_playersInitData[1].unk1 = 0x80;

        g_GameGlobal->m_modeMelee->m_playersInitData[0].m_startPointIdx = 0;
        g_GameGlobal->m_modeMelee->m_playersInitData[1].m_startPointIdx = 1;

        g_GameGlobal->m_record1->m_menuData.rumble[0] = GMMelee::rumbleChoices[0];
        g_GameGlobal->m_record1->m_menuData.rumble[1] = GMMelee::rumbleChoices[1];

        Util::BrawlbackControlsToGameControls(GMMelee::controlsChoices[0], ipPadConfig::getInstance()->controls[0]);
        Util::BrawlbackControlsToGameControls(GMMelee::controlsChoices[1], ipPadConfig::getInstance()->controls[1]);

        // melee[P1_CHAR_ID_IDX+1] = 0; // Set player type to human
        // melee[P2_CHAR_ID_IDX+1] = 0;
        // melee[STAGE_ID_IDX] = stageChoice;
        g_GameGlobal->m_modeMelee->m_meleeInitData.m_stageID = 0x01; // TODO uncomment and use above line, just testing with battlefield
    }
}

bool gameHasStarted() {
    scMelee* melee = dynamic_cast<scMelee*>(gfSceneManager::getInstance()->searchScene("scMelee"));
    if(melee)
    {
        return melee->m_operatorReadyGo->isEnd() != 0;
    }
    else
    {
        return false;
    }

}

void fillOutGameSettings(GameSettings& settings) {
    settings.randomSeed = g_mtRandDefault.seed;
    settings.stageID = g_GameGlobal->m_modeMelee->m_meleeInitData.m_stageID;

    bu8 p1_id = g_GameGlobal->m_modeMelee->m_playersInitData[0].m_characterKind;
    //OSReport("P1 pre-override char id: %d\n", p1_id);
    bu8 p2_id = g_GameGlobal->m_modeMelee->m_playersInitData[1].m_characterKind;
    //OSReport("P2 pre-override char id: %d\n", p2_id);

    // brawl loads all players into the earliest slots.
    // I.E. if players choose P1 and P3, they will get loaded into P1 and P2
    // this means we can use the number of players in a match to iterate over
    // players since we know they'll always be next to each other

    // TODO: replace this with some way to get the actual number of players in a match.
    // unfortunately FIGHTER_MANAGER->getEntryCount() isn't filled out at this point in the game loading
    // sequence. Gotta find another way to get it, or some better spot to grab the number of players
    settings.numPlayers = 2;
    //OSReport("Num Players: %u\n", (unsigned int)settings.numPlayers);
    PlayerSettings playerSettings[2];
    playerSettings[0].charID = p1_id;
    playerSettings[1].charID = p2_id;
    playerSettings[0].rumble = g_GameGlobal->m_record1->m_menuData.rumble[0];
    playerSettings[1].rumble = g_GameGlobal->m_record1->m_menuData.rumble[1];
    playerSettings[0].controls = Util::GameControlsToBrawlbackControls(ipPadConfig::getInstance()->controls[0]);
    playerSettings[1].controls = Util::GameControlsToBrawlbackControls(ipPadConfig::getInstance()->controls[1]);
    playerSettings[0].charColor = g_GameGlobal->m_modeMelee->m_playersInitData[0].m_costumeID;
    playerSettings[1].charColor = g_GameGlobal->m_modeMelee->m_playersInitData[1].m_costumeID;
    playerSettings[0].colorFileIndex = g_GameGlobal->m_modeMelee->m_playersInitData[0].m_colorFileIdx;
    playerSettings[1].colorFileIndex = g_GameGlobal->m_modeMelee->m_playersInitData[1].m_colorFileIdx;

    for (int i = 0; i < settings.numPlayers; i++) {
        settings.playerSettings[i] = playerSettings[i];
    }
}


// take gamesettings and apply it to our game
void MergeGameSettingsIntoGame(GameSettings& settings) {
    //DEFAULT_MT_RAND->seed = settings->randomSeed;
    g_mtRandDefault.seed = 0x496ffd00; // hardcoded for testing (arbitrary number)
    g_mtRandOther.seed = 0x496ffd00;

    //GM_GLOBAL_MODE_MELEE->stageID = settings->stageID;
    //GM_GLOBAL_MODE_MELEE->stageID = 2;

    Netplay::localPlayerIdx = settings.localPlayerIdx;
    OSReport("Local player index is %d\n", Netplay::localPlayerIdx);

    bu8 p1_char = settings.playerSettings[0].charID;
    bu8 p2_char = settings.playerSettings[1].charID;

    bu8 p1_costume = settings.playerSettings[0].charColor;
    bu8 p2_costume = settings.playerSettings[1].charColor;

    bu8 p1_file = settings.playerSettings[0].colorFileIndex;
    bu8 p2_file = settings.playerSettings[1].colorFileIndex;
    //OSReport("P1 char: %d  P2 char: %d\n", p1_char, p2_char);
    //OSReport("Stage id: %d\n", settings.stageID);

    int chars[MAX_NUM_PLAYERS] = {p1_char, p2_char, -1, -1};
    int costumes[MAX_NUM_PLAYERS] = {p1_costume, p2_costume, -1, -1};
    int fileIndices[MAX_NUM_PLAYERS] = {p1_file, p2_file, -1, -1};
    bool rumble[MAX_NUM_PLAYERS] = {settings.playerSettings[0].rumble, settings.playerSettings[1].rumble, true, true};
    BrawlbackControls controls[MAX_NUM_PLAYERS] = {settings.playerSettings[0].controls, settings.playerSettings[1].controls, BrawlbackControls{}, BrawlbackControls{}};
    GMMelee::PopulateMatchSettings(chars, costumes, fileIndices, rumble, controls, settings.stageID);
}

namespace Util {
    bool hasSetControls = false;
    void printInputs(const BrawlbackPad& pad) {
        OSReport(" -- Pad --\n");
        OSReport("StickX: %hhu ", pad.stickX);
        OSReport("StickY: %hhu ", pad.stickY);
        OSReport("CStickX: %hhu ", pad.cStickX);
        OSReport("CStickY: %hhu\n", pad.cStickY);
        OSReport("Buttons: ");
        OSReport("Buttons: 0x%x", pad.buttons);
        OSReport("holdButtons: 0x%x", pad.holdButtons);
        //OSReport(" ---------\n");
    }

    void printGameInputs(const gfPadStatus& pad) {
        OSReport(" -- Pad --\n");
        OSReport(" LAnalogue: %u    RAnalogue %u\n", pad.LAnalogue, pad.RAnalogue);
        OSReport("StickX: %hhu ", pad.stickX);
        OSReport("StickY: %hhu ", pad.stickY);
        OSReport("CStickX: %hhu ", pad.cStickX);
        OSReport("CStickY: %hhu\n", pad.cStickY);
        OSReport("Buttons: ");
        OSReport("B1: 0x%x ", pad.buttons);
        OSReport("B2: 0x%x ", pad._buttons);
        OSReport("B3: 0x%x \n", pad.newPressedButtons);
        //OSReport(" ---------\n");
    }

    void printFrameData(const FrameData& fd) {
        for (int i = 1; i < MAX_NUM_PLAYERS; i++) {
            OSReport("Frame %u pIdx %u\n", fd.playerFrameDatas[i].frame, (unsigned int)fd.playerFrameDatas[i].playerIdx);
            printInputs(fd.playerFrameDatas[i].pad);
        }
    }

    void SyncLog(const BrawlbackPad& pad, bu8 playerIdx) {
        OSReport("[Sync] Injecting inputs for player %u on frame %u\n", (unsigned int)playerIdx, getCurrentFrame());
        printInputs(pad);
        OSReport("[/Sync]\n");
    }
    void FixFrameDataEndianness(FrameData* fd) {
        Utils::swapByteOrder(fd->randomSeed);
        for (int i = 0; i < MAX_NUM_PLAYERS; i++) {
            Utils::swapByteOrder(fd->playerFrameDatas[i].frame);
            Utils::swapByteOrder(fd->playerFrameDatas[i].syncData.anim);
            Utils::swapByteOrder(fd->playerFrameDatas[i].syncData.locX);
            Utils::swapByteOrder(fd->playerFrameDatas[i].syncData.locY);
            Utils::swapByteOrder(fd->playerFrameDatas[i].syncData.percent);
            Utils::swapByteOrder(fd->playerFrameDatas[i].pad._buttons);
            Utils::swapByteOrder(fd->playerFrameDatas[i].pad.buttons);
            Utils::swapByteOrder(fd->playerFrameDatas[i].pad.holdButtons);
            Utils::swapByteOrder(fd->playerFrameDatas[i].pad.releasedButtons);
            Utils::swapByteOrder(fd->playerFrameDatas[i].pad.rapidFireButtons);
            Utils::swapByteOrder(fd->playerFrameDatas[i].pad.newPressedButtons);
            Utils::swapByteOrder(fd->playerFrameDatas[i].sysPad._buttons);
            Utils::swapByteOrder(fd->playerFrameDatas[i].sysPad.buttons);
            Utils::swapByteOrder(fd->playerFrameDatas[i].sysPad.holdButtons);
            Utils::swapByteOrder(fd->playerFrameDatas[i].sysPad.releasedButtons);
            Utils::swapByteOrder(fd->playerFrameDatas[i].sysPad.rapidFireButtons);
            Utils::swapByteOrder(fd->playerFrameDatas[i].sysPad.newPressedButtons);
        }
    }
    BrawlbackControls GameControlsToBrawlbackControls(const Controls& controls)
    {
        BrawlbackControls ret = BrawlbackControls();
        ret.L = controls.L;
        ret.R = controls.R;
        ret.Z = controls.Z;
        ret.UpDPad = controls.UpDPad;
        ret.LeftRightDPad = controls.LeftRightDPad;
        ret.DownDPad = controls.DownDPad;
        ret.A = controls.A;
        ret.B = controls.B;
        ret.subStick = controls.subStick;
        ret.Y = controls.Y;
        ret.X = controls.X;
        ret.tapJumpToggle = controls.tapJumpToggle;
        return ret;
    }

    // TODO: fix pause by making sure that the sys data thingy is also checking for one of the other button bits

    BrawlbackPad GamePadToBrawlbackPad(const gfPadStatus& pad) {
        BrawlbackPad ret = BrawlbackPad();
        ret._buttons = pad._buttons;
        ret.buttons = pad.buttons;
        // *(ret.newPressedButtons-0x2) = (int)*(pad+0x14);
        ret.holdButtons = pad.holdButtons;
        ret.rapidFireButtons = pad.rapidFireButtons;
        ret.releasedButtons = pad.releasedButtons;
        ret.newPressedButtons = pad.newPressedButtons;
        ret.LAnalogue = pad.LAnalogue;
        ret.RAnalogue = pad.RAnalogue;
        ret.LTrigger = pad.LTrigger;
        ret.RTrigger = pad.RTrigger;
        ret.cStickX = pad.cStickX;
        ret.cStickY = pad.cStickY;
        ret.stickX = pad.stickX;
        ret.stickY = pad.stickY;

        // OSReport("BUTTONS======\n");
        // OSReport("Buttons: 0x%x\n", pad._buttons);
        // OSReport("Buttons: 0x%x\n", pad.buttons);
        // OSReport("Buttons holdButtons: 0x%x\n", pad.holdButtons);
        // OSReport("Buttons rapidFireButtons: 0x%x\n", pad.rapidFireButtons);
        // OSReport("Buttons releasedButtons: 0x%x\n", pad.releasedButtons);
        // OSReport("Buttons newPressedButtons: 0x%x\n", pad.newPressedButtons);

        return ret;
    }

    void BrawlbackControlsToGameControls(const BrawlbackControls& brawlbackControls, Controls& controls) {
        controls.L = brawlbackControls.L;
        controls.R = brawlbackControls.R;
        controls.Z = brawlbackControls.Z;
        controls.UpDPad = brawlbackControls.UpDPad;
        controls.LeftRightDPad = brawlbackControls.LeftRightDPad;
        controls.DownDPad = brawlbackControls.DownDPad;
        controls.A = brawlbackControls.A;
        controls.B = brawlbackControls.B;
        controls.subStick = brawlbackControls.subStick;
        controls.Y = brawlbackControls.Y;
        controls.X = brawlbackControls.X;
        controls.tapJumpToggle = brawlbackControls.tapJumpToggle;
    }
    
    void PopulatePlayerFrameData(PlayerFrameData& pfd, bu8 port, bu8 pIdx) {
        /*if(gameHasStarted())
        {
            ftManager* fighterManager = g_ftManager;
            Fighter* fighter = fighterManager->getFighter(fighterManager->getEntryIdFromIndex(pIdx));
            ftOwner* ftowner = fighterManager->getOwner(fighterManager->getEntryIdFromIndex(pIdx));

            pfd.syncData.facingDir = fighter->m_moduleAccesser->getPostureModule()->getLr() < 0.0 ? -1 : 1;
            pfd.syncData.locX = fighter->m_moduleAccesser->getPostureModule()->getPos().m_x;
            pfd.syncData.locY = fighter->m_moduleAccesser->getPostureModule()->getPos().m_y;
            pfd.syncData.anim = fighter->m_moduleAccesser->getStatusModule()->getStatusKind();

            pfd.syncData.percent = (float)ftowner->getDamage();
            pfd.syncData.stocks = (bu8)ftowner->getStockCount();
        }*/
        pfd.pad = Util::GamePadToBrawlbackPad(g_PadSystem.gcPads[port]);
        pfd.sysPad = Util::GamePadToBrawlbackPad(g_PadSystem.gcSysPads[port]);
    }
    void InjectBrawlbackPadToPadStatus(gfPadStatus& gamePad, const BrawlbackPad& pad, int port) {

        // TODO: do this once on match start or whatever, so we don't need to access this so often and lose cpu cycles
        //bool isNotConnected = Netplay::getGameSettings().playerSettings[port].playerType == PlayerType::PLAYERTYPE_NONE;
        // get current char selection and if none, the set as not connected
        // bu8 charId = GM_GLOBAL_MODE_MELEE->playerData[port].charId;
        // GM_GLOBAL_MODE_MELEE->playerData[port].playerType = isNotConnected ? 03 : 0 ; // Set to Human

        gamePad.type = 0x0;
        gamePad.isNotConnected = 0x0;
        gamePad._buttons = pad._buttons;
        gamePad.buttons = pad.buttons;
        gamePad.releasedButtons = pad.releasedButtons;
        // int* addr  = (int*) &gamePad;
        // *(addr+0x14+0x2) = pad.buttons;
        gamePad.holdButtons = pad.holdButtons;
        gamePad.rapidFireButtons = pad.rapidFireButtons;
        gamePad.newPressedButtons = pad.newPressedButtons;
        gamePad.LAnalogue = pad.LAnalogue;
        gamePad.RAnalogue = pad.RAnalogue;
        gamePad.LTrigger = pad.LTrigger;
        gamePad.RTrigger = pad.RTrigger;
        gamePad.cStickX = pad.cStickX;
        gamePad.cStickY = pad.cStickY;
        gamePad.stickX = pad.stickX;
        gamePad.stickY = pad.stickY;
        // OSReport("Buttons: 0x%x\n", pad.buttons);
        // OSReport("Buttons: 0x%x\n", pad.newPressedButtons);

    }

    void SaveState(bu32 currentFrame) {
        EXIPacket::CreateAndSend(EXICommand::CMD_CAPTURE_SAVESTATE, &currentFrame, sizeof(currentFrame));
    }
}
extern u8 ftManagerGameRule;
extern u8 ftManagerStaminaMode;
extern u8 ftManagerField68;
namespace Match {
    const char* relevantHeaps = "System WiiPad IteamResource InfoResource CommonResource CopyFB Physics ItemInstance Fighter1Resoruce Fighter2Resoruce Fighter1Resoruce2 Fighter2Resoruce2 Fighter1Instance Fighter2Instance FighterTechqniq InfoInstance InfoExtraResource GameGlobal FighterKirbyResource1 GlobalMode OverlayCommon Tmp OverlayStage ItemExtraResource FighterKirbyResource2 FighterKirbyResource3";
    gmSetRule rules = {};
    void PopulateGameReport(GameReport& report)
    {
        /*
        ftManager* fighterManager = g_ftManager;

        for (int i = 0; i < Netplay::getGameSettings().numPlayers; i++) {
            Fighter* const fighter = fighterManager->getFighter(fighterManager->getEntryIdFromIndex(i));
            s32 stocks = fighter->getOwner()->getStockCount();
            OSReport("Stock count player idx %i = %i\n", i, stocks);
            report.stocks[i] = stocks;
            f64 damage = fighter->getOwner()->getDamage();
            OSReport("Damage for player idx %i = %f\n", i, damage);
            report.damage[i] = damage;
        }*/
        report.frame_duration = getCurrentFrame();
    }
    void SendGameReport(GameReport& report)
    {
        EXIPacket::CreateAndSend(EXICommand::CMD_MATCH_END, &report, sizeof(report));
    }
    void StopGameScMeleeHook()
    {
        Utils::SaveRegs();
        if(Netplay::IsInMatch())
        {
            OSReport("Game report in stopGameScMeleeBeginningHook hook\n");
            if (Netplay::getGameSettings().numPlayers > 1) {
                #if 0  // toggle for sending end match game stats
                GameReport report;
                PopulateGameReport(report);
                SendGameReport(report);
                #endif
            }
        }  
        Utils::RestoreRegs();
    }
    void StartSceneMelee()
    {
        Utils::SaveRegs();
        if(g_GameGlobal->m_modeMelee->m_meleeInitData.m_stageID != 55)
        {
            OSDisableInterrupts();
            //OSReport("  ~~~~~~~~~~~~~~~~  Start Scene Melee  ~~~~~~~~~~~~~~~~  \n");
            #ifdef NETPLAY_IMPL
            Netplay::SetIsInMatch(true);
            ftManagerField68 = 0x0;
            ftManagerGameRule = 0x1;
            ftManagerStaminaMode = 0x0;
            g_mtRandDefault.seed = 0x496ffd00;
            g_mtRandOther.seed = 0x496ffd00;
            #else
            // 'debug' values
            Netplay::getGameSettings().localPlayerIdx = 0;
            Netplay::localPlayerIdx = 0;
            Netplay::getGameSettings().numPlayers = 2;
            #endif
            OSEnableInterrupts();
        }
        Utils::RestoreRegs();
    }
    void ExitSceneMelee()
    {
        Utils::SaveRegs();
        if(Netplay::IsInMatch())
        {
            OSDisableInterrupts();
            OSReport("  ~~~~~~~~~~~~~~~~  Exit Scene Melee  ~~~~~~~~~~~~~~~~  \n");
            frameCounter = 0;
            #ifdef NETPLAY_IMPL
            Netplay::EndMatch();
            Netplay::SetIsInMatch(false);
            #endif
            OSEnableInterrupts();
        }
        Utils::RestoreRegs();
    }
    void setRandSeed()
    {
        Utils::SaveRegs();
        if(Netplay::IsInMatch())
        {
            g_mtRandDefault.seed = 0x496ffd00;
            g_mtRandOther.seed = 0x496ffd00;
        }
        Utils::RestoreRegs();
    }
    void dump_gfMemoryPool_hook()
    {
        Utils::SaveRegs();
        char** r30_reg_val;
        bu32 addr_start;
        bu32 addr_end;
        bu32 mem_size;
        bu8 id;
        asm volatile(
            "mr %0, 30\n\t"
            "mr %1, 4\n\t"
            "mr %2, 5\n\t"
            "mr %3, 6\n\t"
            "mr %4, 7\n\t"
            : "=r"(r30_reg_val), "=r"(addr_start), "=r"(addr_end), "=r"(mem_size), "=r"(id)
        );
        DumpGfMemoryPoolHook(r30_reg_val, addr_start, addr_end, mem_size, id);
        Utils::RestoreRegs();
    }
    void DumpGfMemoryPoolHook(char** r30_reg_val, bu32 addr_start, bu32 addr_end, bu32 mem_size, u8 id)
    {
        char* heap_name = *r30_reg_val;
        if(strstr(relevantHeaps, heap_name) != (char*)0x0) {
            SavestateMemRegionInfo memRegion;
            memRegion.address = addr_start; // might be bad cast... 64 bit ptr to 32 bit int
            memRegion.size = mem_size;
            memmove(memRegion.nameBuffer, heap_name, strlen(heap_name));
            memRegion.nameBuffer[strlen(heap_name)] = '\0';
            memRegion.nameSize = strlen(heap_name);
            EXIPacket::CreateAndSend(EXICommand::CMD_SEND_DUMPALL, &memRegion, sizeof(SavestateMemRegionInfo));
        }
    }
    void ProcessGameAllocation(u8* allocated_addr, bu32 size, char* heap_name)
    {
        if (shouldTrackAllocs && strstr(relevantHeaps, heap_name) != (char*)0x0) {
            //OSReport("ALLOC: size = 0x%08x  allocated addr = 0x%08x\n", size, allocated_addr);
            SavestateMemRegionInfo memRegion;
            memRegion.address = reinterpret_cast<bu32>(allocated_addr); // might be bad cast... 64 bit ptr to 32 bit int
            memRegion.size = size;
            memmove(memRegion.nameBuffer, heap_name, strlen(heap_name));
            memRegion.nameBuffer[strlen(heap_name)] = '\0';
            memRegion.nameSize = strlen(heap_name);
            EXIPacket::CreateAndSend(EXICommand::CMD_SEND_ALLOCS, &memRegion, sizeof(memRegion));
        }
    }
    void ProcessGameFree(u8* address, char* heap_name)
    {
        if (shouldTrackAllocs && strstr(relevantHeaps, heap_name) != (char*)0x0) {
            //OSReport("FREE: addr = 0x%08x\n", address);
            SavestateMemRegionInfo memRegion;
            memmove(memRegion.nameBuffer, heap_name, strlen(heap_name));
            memRegion.nameBuffer[strlen(heap_name)] = '\0';
            memRegion.nameSize = strlen(heap_name);
            memRegion.address = reinterpret_cast<bu32>(address);
            EXIPacket::CreateAndSend(EXICommand::CMD_SEND_DEALLOCS, &memRegion, sizeof(memRegion));
        }
    }
    bu32 allocSizeTracker = 0;
    char allocHeapName[30];
    void alloc_gfMemoryPool_hook()
    {
        Utils::SaveRegs();
        char** internal_heap_data;
        bu32 size;
        bu32 alignment;
        asm(
            "mr %0, 3\n\t"
            "mr %1, 4\n\t"
            "mr %2, 5\n\t"
            : "=r"(internal_heap_data), "=r"(size), "=r"(alignment)
        );
        AllocGfMemoryPoolBeginHook(internal_heap_data, size, alignment);
        Utils::RestoreRegs();
    }
    void AllocGfMemoryPoolBeginHook(char** internal_heap_data, bu32 size, bu32 alignment)
    {
        char* heap_name = *internal_heap_data;
        memmove(allocHeapName, heap_name, strlen(heap_name));
        allocHeapName[strlen(heap_name)] = '\0';
        allocSizeTracker = size;
    }
    void allocGfMemoryPoolEndHook()
    {
        Utils::SaveRegs();
        u8* alloc_addr;
        asm volatile(
            "mr %0, 30\n\t"
            : "=r"(alloc_addr)
        );
        ProcessGameAllocation(alloc_addr, allocSizeTracker, allocHeapName);
        Utils::RestoreRegs();
    }
    void free_gfMemoryPool_hook()
    {
        Utils::SaveRegs();
        char** internal_heap_data;
        u8* address;
        asm volatile(
            "mr %0, 3\n\t"
            "mr %1, 4\n\t"
            : "=r"(internal_heap_data), "=r"(address)
        );
        FreeGfMemoryPoolHook(internal_heap_data, address);
        Utils::RestoreRegs();
    }
    void FreeGfMemoryPoolHook(char** internal_heap_data, bu8* address)
    {
        char* heap_name = *internal_heap_data;
        ProcessGameFree(address, heap_name);
    }
}

namespace FrameAdvance {
    bu32 framesToAdvance = 1;
    FrameData currentFrameData = FrameData();
    u32 shouldSkipPadAlarmInstr = 0x80028B30;
    bool checkPad = true;
    bu32 getFramesToAdvance()
    {
        return framesToAdvance;
    }

    void TriggerFastForwardState(bu8 numFramesToFF)
    {
        if (framesToAdvance == 1 && numFramesToFF > 0) {
            framesToAdvance = numFramesToFF;
        }
    }
    void StallOneFrame()
    {
        if (framesToAdvance == 1) {
            framesToAdvance = 0;
        }
    }

    void ResetFrameAdvance()
    {
        //OSReport("Resetting frameadvance to normal\n");
        framesToAdvance = 1;
        isRollback = false;
    }


    // requests FrameData for specified frame from emulator and assigns it to inputs
    void GetInputsForFrame(bu32 frame, FrameData* inputs)
    {
        EXIPacket::CreateAndSend(EXICommand::CMD_FRAMEDATA, &frame, sizeof(frame));
        EXIHooks::readEXI(inputs, sizeof(FrameData), EXI_CHAN_1, 0, EXI_FREQ_32HZ);
        Util::FixFrameDataEndianness(inputs);
    }

    // should be called on every simulation frame
    void ProcessGameSimulationFrame(FrameData* inputs)
    {
        bu32 gameLogicFrame = getCurrentFrame();
        //OSReport("ProcessGameSimulationFrame %u \n", gameLogicFrame);
        
        GetInputsForFrame(gameLogicFrame, &currentFrameData);
        
        for(int i = 0; i < Netplay::getGameSettings().numPlayers; i++)
        {
            gfPadStatus& status = g_PadSystem.gcPads[i];
            getGamePadStatusInjection(status, i, true);
        }
        
        // save state on each simulated frame (this includes resim frames)
        Util::SaveState(gameLogicFrame);

        //OSReport("Using inputs %u %u  game frame: %u\n", inputs->playerFrameDatas[0].frame, inputs->playerFrameDatas[1].frame, gameLogicFrame);

        //Util::printFrameData(*inputs);
    }
    void fixPadInconsistency() {
        Utils::SaveRegs();
        if(!Netplay::IsInMatch())
        {
            g_PadSystem.updateLow();
        }
        Utils::RestoreRegs();
    }
    void updateLowHook() 
    {
        Utils::SaveRegs();
        bu32 padStatus;
        asm volatile(
            "mr %0, 26\n\t"
            : "=r"(padStatus)
        );
        if(Netplay::IsInMatch())
        {
            if(!shouldTrackAllocs) 
            {
                gfHeapManager::dumpAll();
                FrameLogic::SendFrameCounterPointerLoc();
                shouldTrackAllocs = true;
            }
            OSReport("~~~~~~~~~~~~~~~~ FRAME %d ~~~~~~~~~~~~~~~~\n", getCurrentFrame());
            FrameLogic::WriteInputsForFrame();
            ProcessGameSimulationFrame(&currentFrameData);
        }
        Utils::RestoreRegs();
        asm volatile(
            "lwz 4, -0x4390 (13)\n\t"
        );
    }
    void turnOnAllAppropriatePorts()
    {
        Utils::SaveRegs();
        if (Netplay::IsInMatch()) 
        {  
            for(int i = 0; i < Netplay::getGameSettings().numPlayers; i++)
            {
                ipPadConfig::getInstance()->playerNum2PadNum[i] = i;
            }
        }
        Utils::RestoreRegs();
    }
    void getGamePadStatusInjection(gfPadStatus& status, int port, bool isGamePad)
    {
        // OSReport("PAD %i 0x%x\n", 0, &PAD_SYSTEM->sysPads[0]);
        // OSReport("PAD %i 0x%x\n", 1, &PAD_SYSTEM->sysPads[1]);
        // OSReport("PAD %i 0x%x\n", 2, &PAD_SYSTEM->sysPads[2]);
        // OSReport("PAD %i 0x%x\n", 3, &PAD_SYSTEM->sysPads[3]);
        //Util::printGameInputs(PAD_SYSTEM->sysPads[0]);
        //  if((ddst->releasedButtons + ddst->newPressedButtons) != 0){
        //         OSReport("LOCAL BUTTONS(P%i)===GP(%i)===\n", port, isGamePad);
        //         OSReport("releasedButtons 0x%x\n", ddst->releasedButtons);
        //         OSReport("newPressedButtons 0x%x\n", ddst->newPressedButtons);
        // }

        // if((ddst->buttons) != 0){
        //     // OSReport("LOCAL BUTTONS(P%i)===GP(%i)===\n", port, isGamePad);
        //     // OSReport("buttons 0x%x\n", ddst->buttons);
        //     OSReport("Melee Info=====\n");
        //     OSReport("p1 charId=0x%x ptype=0x%x unk1=0x%x unk2=0x%x\n", GM_GLOBAL_MODE_MELEE->playerData[0].charId, GM_GLOBAL_MODE_MELEE->playerData[0].playerType, GM_GLOBAL_MODE_MELEE->playerData[0].unk1, GM_GLOBAL_MODE_MELEE->playerData[0].unk2);
        //     OSReport("p2 charId=0x%x ptype=0x%x unk1=0x%x unk2=0x%x\n", GM_GLOBAL_MODE_MELEE->playerData[1].charId, GM_GLOBAL_MODE_MELEE->playerData[1].playerType, GM_GLOBAL_MODE_MELEE->playerData[1].unk1, GM_GLOBAL_MODE_MELEE->playerData[1].unk2);
        //     OSReport("p3 charId=0x%x ptype=0x%x unk1=0x%x unk2=0x%x\n", GM_GLOBAL_MODE_MELEE->playerData[2].charId, GM_GLOBAL_MODE_MELEE->playerData[2].playerType, GM_GLOBAL_MODE_MELEE->playerData[2].unk1, GM_GLOBAL_MODE_MELEE->playerData[2].unk2);
        //     OSReport("p4 charId=0x%x ptype=0x%x unk1=0x%x unk2=0x%x\n", GM_GLOBAL_MODE_MELEE->playerData[3].charId, GM_GLOBAL_MODE_MELEE->playerData[3].playerType, GM_GLOBAL_MODE_MELEE->playerData[3].unk1, GM_GLOBAL_MODE_MELEE->playerData[3].unk2);

        // }
        PlayerFrameData& frameData = currentFrameData.playerFrameDatas[port];
        OSReport("PLAYERFRAMEDATA FRAME: %d\nREAL FRAME: %d\n", frameData.frame, getCurrentFrame());
        BrawlbackPad& pad = isGamePad ? frameData.pad : frameData.sysPad;
        Util::InjectBrawlbackPadToPadStatus(status, pad, port);
        // if(ddst->newPressedButtons == 0x1000){
        //     bp();
        // }

        // TODO: make whole game struct be filled in from dolphin based off a known good match between two characters on a stage like battlefield
        //if((padStatus.releasedButtons + padStatus.newPressedButtons) != 0){
            //OSReport("BUTTONS(P%i)===GP(%i)===\n", i, true);
            //OSReport("releasedButtons 0x%x\n", gamePad.releasedButtons);
            //OSReport("newPressedButtons 0x%x\n", gamePad.newPressedButtons);
        //}
        // if((ddst->buttons) != 0){
            // OSReport("BUTTONS(P%i)===GP(%i)===\n", port, isGamePad);
            // OSReport("buttons 0x%x\n", ddst->buttons);
        // }
    }
    void handleFrameAdvanceHook() {
        Utils::SaveRegs();
        setFrameAdvanceFromEmu();
        asm volatile("cmplw 19, %0\n\t"
            :
            : "r" (framesToAdvance)
        );
        Utils::RestoreRegs();
    }
    void setFrameAdvanceFromEmu() {
        EXIPacket::CreateAndSend(EXICommand::CMD_FRAMEADVANCE);
        EXIHooks::readEXI(&framesToAdvance, sizeof(bu32), EXI_CHAN_1, 0, EXI_FREQ_32HZ);
        Utils::swapByteOrder(framesToAdvance);
        if(framesToAdvance > 1)
        {
            isRollback = true;
        }
    }
}

namespace FrameLogic {
    u32 shouldSkipGfTaskNextInstr = 0x8002DC7C;
    gfTask* task;
    u32 task_type;
    PlayerFrameData playerFrame = PlayerFrameData();
    gfPadStatus lastLocalInputs = gfPadStatus();
    void WriteInputsForFrame()
    {
        bu8 localPlayerIdx = Netplay::localPlayerIdx;
        if (localPlayerIdx != Netplay::localPlayerIdxInvalid) {
            playerFrame.playerIdx = localPlayerIdx;
            Util::PopulatePlayerFrameData(playerFrame, Netplay::getGameSettings().localPlayerPort, localPlayerIdx);
            FrameAdvance::ResetFrameAdvance();
            FrameDataLogic();
        }
        else {
            OSReport("Invalid player index! Can't send inputs to emulator!\n");
        }
    }
    void FrameDataLogic()
    {
        playerFrame.frame = getCurrentFrame();
        EXIPacket::CreateAndSend(EXICommand::CMD_ONLINE_INPUTS, &playerFrame, sizeof(PlayerFrameData));
    }
    void SendFrameCounterPointerLoc()
    {
        bu32 frameCounterLocation = reinterpret_cast<bu32>(&frameCounter);
        EXIPacket::CreateAndSend(EXICommand::CMD_SEND_FRAMECOUNTERLOC, &frameCounterLocation, sizeof(bu32));
    }
    const char* nonResimTasks = "ecMgr EffectManager";
    bool ShouldSkipGfTaskProcess(gfTask* task, bu32 task_type)
    {
        if (isRollback) { // if we're resimulating, disable certain tasks that don't need to run on resim frames.
            char* taskName = task->m_taskName; // 0x0 offset of gfTask* is the task name
            //OSReport("Processing task %s\n", taskName);
            return strstr(nonResimTasks, taskName) != (char*)0x0;
        }
        return false;
    }
    void initFrameCounter()
    {
        Utils::SaveRegs();
        frameCounter = 0;
        Utils::RestoreRegs();
    }
    void updateFrameCounter()
    {
        Utils::SaveRegs();
        frameCounter++;
        Utils::RestoreRegs();
    }
    void beginningOfMainGameLoop()
    {
        Utils::SaveRegs();
        if (Netplay::IsInMatch()) {
            g_PadSystem.updateLow();
            EXIPacket::CreateAndSend(EXICommand::CMD_TIMER_START);
        }
        NetMenu::MatchmakingText();
        Utils::RestoreRegs();
    }
    void beginFrame()
    {
        Utils::SaveRegs();
        bu32 currentFrame = getCurrentFrame();
        
        //Util::printGameInputs(PAD_SYSTEM->pads[0]);
        //Util::printGameInputs(PAD_SYSTEM->sysPads[0]);

        // this is the start of all our logic for each frame. Because EXI writes/reads are synchronous,
        // you can think of the control flow going like this
        // this function -> write data to emulator through exi -> emulator processes data and possibly queues up data
        // to send back to the game -> send data to the game if there is any -> game processes that data -> repeat
        if (Netplay::IsInMatch()) {
            // reset flag to be used later
            // just resimulated/stalled/skipped/whatever, reset to normal
            // lol
            g_mtRandDefault.seed = 0x496ffd00;
            g_mtRandOther.seed = 0x496ffd00;
        }

        Utils::RestoreRegs();
    }
    void endFrame()
    {
        Utils::SaveRegs();
        if (Netplay::IsInMatch()) {
            EXIPacket::CreateAndSend(EXICommand::CMD_TIMER_END);
        }
        Utils::RestoreRegs();
    }
    void endMainLoop()
    {
        Utils::SaveRegs();
        Utils::RestoreRegs();
    }
    
    void gfTaskProcessHook()
    {
        Utils::SaveRegs();
        asm volatile (
            "mr %0, 3\n\t"
            "mr %1, 4\n\t"
            : "=r"(task), "=r"(task_type)
        );
        if(ShouldSkipGfTaskProcess(task, task_type))
        {
            shouldSkipGfTaskNextInstr = 0x8002dd28;
        }
        else 
        {
            if(task_type >= 8)
            {
                shouldSkipGfTaskNextInstr = 0x8002dd1c;
            }
            else 
            {
                shouldSkipGfTaskNextInstr = 0x8002dc7c;
            }
        }
        Utils::RestoreRegs();
    }
    __attribute__((naked)) void gfTaskProcessHook2()
    {
        asm volatile(
            "mr 12, %0\n\t"
            "mtctr 12\n\t"
            "mr 12, %1\n\t"
            "mr 3, 12\n\t"
            "mr 12, %2\n\t"
            "mr 4, 12\n\t"
            "bctr\n\t"
            :
            : "r"(shouldSkipGfTaskNextInstr), "r"(task), "r"(task_type)
        );
    }
}
u8 defaultGmGlobalModeMelee[0x320] = {0xff, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x2a, 0x81, 0x8, 0x80, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0xff, 0x78, 0x0, 0x0, 0x2, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x70, 0x80, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x3f, 0xff, 0xff, 0xff, 0x7, 0x57, 0xff, 0xf1, 0xff, 0x87, 0xf1, 0xff, 0x0, 0x3, 0xf0, 0x2f, 0x3f, 0x80, 0x0, 0x0, 0x3f, 0x80, 0x0, 0x0, 0x3f, 0x80, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x1, 0x0, 0x0, 0x0, 0x1, 0x0, 0x28, 0x1d, 0x2, 0x4, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x15, 0x0, 0x0, 0x0, 0x4, 0x0, 0x0, 0x1, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x78, 0x0, 0x0, 0x0, 0x10, 0x0, 0x0, 0x64, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x3f, 0x80, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x3f, 0x80, 0x0, 0x0, 0x3f, 0x80, 0x0, 0x0, 0x3f, 0x80, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x3f, 0x80, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x29, 0x0, 0x1, 0x0, 0x4, 0x0, 0x0, 0x2, 0x1, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x78, 0x0, 0x0, 0x0, 0x10, 0x0, 0x0, 0x64, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x3f, 0x80, 0x0, 0x0, 0x0, 0x0, 0x0, 0x1, 0x3f, 0x80, 0x0, 0x0, 0x3f, 0x80, 0x0, 0x0, 0x3f, 0x80, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x3f, 0x80, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x3e, 0x3, 0x2, 0x0, 0x0, 0x0, 0x0, 0x0, 0x2, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x78, 0x0, 0x0, 0x0, 0x10, 0x0, 0x0, 0x64, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x3f, 0x80, 0x0, 0x0, 0x0, 0x0, 0x0, 0x2, 0x3f, 0x80, 0x0, 0x0, 0x3f, 0x80, 0x0, 0x0, 0x3f, 0x80, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x3f, 0x80, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x3e, 0x3, 0x3, 0x0, 0x0, 0x0, 0x0, 0x0, 0x3, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x78, 0x0, 0x0, 0x0, 0x10, 0x0, 0x0, 0x64, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x3f, 0x80, 0x0, 0x0, 0x0, 0x0, 0x0, 0x3, 0x3f, 0x80, 0x0, 0x0, 0x3f, 0x80, 0x0, 0x0, 0x3f, 0x80, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x3f, 0x80, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x3e, 0x3, 0x4, 0x0, 0x0, 0x0, 0x0, 0x0, 0x4, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x78, 0x0, 0x0, 0x0, 0x10, 0x0, 0x0, 0x15, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x4, 0x3f, 0x80, 0x0, 0x0, 0x3f, 0x80, 0x0, 0x0, 0x3f, 0x80, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x3f, 0x80, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x3e, 0x3, 0x5, 0x0, 0x0, 0x0, 0x0, 0x0, 0x5, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x78, 0x0, 0x0, 0x0, 0x10, 0x0, 0x0, 0x15, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x5, 0x3f, 0x80, 0x0, 0x0, 0x3f, 0x80, 0x0, 0x0, 0x3f, 0x80, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x3f, 0x80, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x3e, 0x3, 0x6, 0x0, 0x0, 0x0, 0x0, 0x0, 0x6, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x78, 0x0, 0x0, 0x0, 0x10, 0x0, 0x0, 0x15, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x6, 0x3f, 0x80, 0x0, 0x0, 0x3f, 0x80, 0x0, 0x0, 0x3f, 0x80, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x3f, 0x80, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0};
namespace GMMelee {
    bool isMatchChoicesPopulated = false;
    int charChoices[MAX_NUM_PLAYERS] = {-1, -1, -1, -1};
    int costumeChoices[MAX_NUM_PLAYERS] = {-1, -1, -1, -1};
    int fileIndexChoices[MAX_NUM_PLAYERS] = {-1, -1, -1, -1};
    bool rumbleChoices[MAX_NUM_PLAYERS] = {true, true, true, true};
    BrawlbackControls controlsChoices[MAX_NUM_PLAYERS] = {BrawlbackControls{}, BrawlbackControls{}, BrawlbackControls{}, BrawlbackControls{}};
    int stageChoice = -1;
    void PopulateMatchSettings(int chars[MAX_NUM_PLAYERS], int costumes[MAX_NUM_PLAYERS], int fileIndices[MAX_NUM_PLAYERS], bool rumble[MAX_NUM_PLAYERS], BrawlbackControls controls[MAX_NUM_PLAYERS], int stageID)
    {
        for (int i = 0; i < MAX_NUM_PLAYERS; i++) {
            charChoices[i] = chars[i];
            rumbleChoices[i] = rumble[i];
            costumeChoices[i] = costumes[i];
            fileIndexChoices[i] = fileIndices[i];
            controlsChoices[i] = controls[i]; 
        }
        stageChoice = stageID;
        isMatchChoicesPopulated = true;
        OSReport("Merged!\n");
    }
    // called on match end
    void ResetMatchChoicesPopulated()
    {
        isMatchChoicesPopulated = false;
        OSReport("Turned off!\n");
    }

    void postSetupMelee() {
        Utils::SaveRegs();
        OSDisableInterrupts();
        OSReport("postSetupMelee\n");
        OSEnableInterrupts();
        FillInMeleeObj();
        Utils::RestoreRegs();
    }
}

namespace Netplay {
    GameSettings gameSettings = GameSettings();
    const bu8 localPlayerIdxInvalid = 200;
    bu8 localPlayerIdx = localPlayerIdxInvalid;
    bool isInMatch = false;
    bool foundMatch = false;
    bool isInTrainingRoom = false;
    bool IsInMatch()
    {
        return isInMatch;
    }
    void SetIsInMatch(bool isMatch)
    {
        isInMatch = isMatch;
    }

    GameSettings& getGameSettings()
    {
        return gameSettings;
    }

    void FixGameSettingsEndianness(GameSettings& settings)
    {
        Utils::swapByteOrder(settings.stageID);
        Utils::swapByteOrder(settings.randomSeed);
        for(int i = 0; i < MAX_NUM_PLAYERS; i++)
        {
            for(int f = 0; f < NAMETAG_SIZE; f++)
            {
                Utils::swapByteOrder(settings.playerSettings[i].nametag[f]);
            }
        }
    }
    
    static void* StartMatching(void*)
    {
        OSReport("Filling in game settings from game\n");
        NetMenu::text = "Finding Opponent";
        NetMenu::showText = true;
        // populate game settings
        fillOutGameSettings(gameSettings);

        // send our populated game settings to the emu
        EXIPacket::CreateAndSend(EXICommand::CMD_START_MATCH, &gameSettings, sizeof(GameSettings));

        // start emu netplay thread so it can start trying to find an opponent
        EXIPacket::CreateAndSend(EXICommand::CMD_FIND_OPPONENT);

        // Temporary. Atm, this just stalls main thread while we do our mm/connecting
        // in the future, when netmenu stuff is implemented, the organization of StartMatching and CheckIsMatched
        // will make more sense
        do 
        {
            foundMatch = CheckIsMatched();
        }
        while (!foundMatch && isInTrainingRoom);
        if(!isInTrainingRoom)
        {
            NetMenu::text = "Canceling Matchmaking";
            OSReport("Canceling Matchmaking...\n");
            EXIPacket::CreateAndSend(EXICommand::CMD_CANCEL_MATCHMAKING);
        }
        return NULL;
    }


    bool CheckIsMatched() {
        bool matched = false;
        bu8 cmd_byte = EXICommand::CMD_UNKNOWN;

        // cmd byte + game settings
        const size_t read_size = sizeof(GameSettings) + 1;
        bu8 read_data[read_size];

        // stall until we get game settings from opponent, then load those in and continue to boot up the match
        //while (cmd_byte != EXICommand::CMD_SETUP_PLAYERS) {
        EXIHooks::readEXI(read_data, read_size, EXI_CHAN_1, 0, EXI_FREQ_32HZ);
        cmd_byte = read_data[0];

        if (cmd_byte == EXICommand::CMD_SETUP_PLAYERS) {
            NetMenu::text = "Found Opponent";
            GameSettings gameSettingsFromOpponent;
            memmove(&gameSettingsFromOpponent, read_data + 1, sizeof(GameSettings));
            FixGameSettingsEndianness(gameSettingsFromOpponent);
            MergeGameSettingsIntoGame(gameSettingsFromOpponent);
            gameSettings = gameSettingsFromOpponent;
            matched = true;
        }
        else {
            //OSReport("Reading for setupplayers, didn't get it...\n");
        }
        //}
        return matched;
    }

    void EndMatch() {
        localPlayerIdx = localPlayerIdxInvalid;
        gameSettings = GameSettings();
        GMMelee::ResetMatchChoicesPopulated();
    }

}

namespace NetMenu {
    bool skipToCSS = false;
    bool setRules = false;
    bool onQuickplayMenus = false;
    char* text;
    bool showText;
    __attribute__((naked)) void setToLoggedIn() {
        asm volatile(
            "li 4, 3\n\t"
            "lis 12, 0x8014\n\t"
            "ori 12, 12, 0xB5FC\n\t"
            "mtctr 12\n\t"
            "bctr\n\t"
        );
    }
    __attribute__((naked)) void setToLoggedIn2() {
        asm volatile(
            "stw 4, -0x4048(13)\n\t"
            "lis 12, 0x8014\n\t"
            "ori 12, 12, 0xB600\n\t"
            "mtctr 12\n\t"
            "bctr\n\t"
        );
    }
    __attribute__((naked)) void disableMiiRender() {
        asm volatile(
            "lis 12, 0x8003\n\t"
            "ori 12, 12, 0x3b4c\n\t"
            "mtctr 12\n\t"
            "bctr\n\t"
        );
    }
    __attribute__((naked)) void disableMatchmakingError() {
        asm volatile(
            "lis 12, 0x800c\n\t"
            "ori 12, 12, 0xcf94\n\t"
            "mtctr 12\n\t"
            "bctr\n\t"
        );
    }
    __attribute__((naked)) void connectToAnybodyAsyncHook2() {
        asm volatile(
            "li 3, 1\n\t"
            "lis 12, 0x8014\n\t"
            "ori 12, 12, 0x94a8\n\t"
            "mtctr 12\n\t"
            "bctr\n\t"
        );
    }
    __attribute__((naked)) void disableCreateCounterOnCSS() {
        asm volatile(
            "lis 3, 0x8068\n\t"
            "ori 3, 3, 0x6aec\n\t"
            "mtctr 3\n\t"
            "bctr\n\t"
        );
    }

    __attribute__((naked)) void turnOffCSSTimer() {
        asm volatile(
            "li 0, 0\n\t"
            "lis 12, 0x8068\n\t"
            "ori 12, 12, 0x7f70\n\t"
            "mtctr 12\n\t"
            "bctr\n\t"
        );
    }
    __attribute__((naked)) void disableCreateCounterOnSSS() {
        asm volatile(
            "lis 3, 0x806b\n\t"
            "ori 3, 3, 0x1dbc\n\t"
            "mtctr 3\n\t"
            "bctr\n\t"
        );
    }
    __attribute__((naked)) void turnOffSSSTimer() {
        asm volatile(
            "li 0, 8\n\t"
            "lis 12, 0x806b\n\t"
            "ori 12, 12, 0x3f2c\n\t"
            "mtctr 12\n\t"
            "bctr\n\t"
        );
    }
    __attribute__((naked)) void disableGetNetworkErrorOnCSS() {
        asm volatile(
            "li 3, 0\n\t"
            "lis 12, 0x8068\n\t"
            "ori 12, 12, 0x7C6C\n\t"
            "mtctr 12\n\t"
            "bctr\n\t"
        );
    }
    __attribute__((naked)) void disableGetNetworkErrorOnSSS() {
        asm volatile(
            "li 3, 0\n\t"
            "lis 12, 0x806b\n\t"
            "ori 12, 12, 0x3a78\n\t"
            "mtctr 12\n\t"
            "bctr\n\t"
        );
    }
    __attribute__((naked)) void forceFriendCode() {
        asm volatile(
            "lwz 0, 0x00F8 (29)\n\t"
            "lis 12, 0x8014\n\t"
            "ori 12, 12, 0xb4f0\n\t"
            "mtctr 12\n\t"
            "bctr\n\t"
        );
    }
    __attribute__((naked)) void forceConnection() {
        asm volatile(
            "lis 12, 0x8014\n\t"
            "ori 12, 12, 0xB434\n\t"
            "mtctr 12\n\t"
            "bctr\n\t"
        );
    }
    void ChangeGfSceneField(bu32 scene)
    {
        bu32* scenePtr = ((bu32*)(((bu8*)gfSceneManager::getInstance()) + 0x288));
        *scenePtr = (bu32)scene;
        
        bu32* somePtr = ((bu32*)(((bu8*)gfSceneManager::getInstance()) + 0x278));
        *somePtr = 0; // this is checked > -1 and if so will check the sceneManager scene for idle, if so, will changeNextScene
    }
    void ChangeStruct3Scenes(bu8* structure, bu32 scene, bu32 nextScene)
    {
        bu32* scenePtr = (bu32*)(structure + 0x8);
        *scenePtr = scene;

        bu32* nextScenePtr = (bu32*)(structure + 0xc);
        *nextScenePtr = nextScene;
    }
    void ChangeStruct3Scenes(bu8* structure, bu32 scene)
    {
        bu32* scenePtr = (bu32*)(structure + 0x8);
        *scenePtr = scene;
    }
    void BootToScMelee()
    {
        OSReport("Booting to scMelee...\n");
        ChangeStruct3Scenes((u8*)0x90ff3e40, Scene::MemoryChange, Scene::InitialChange);
        gfSceneManager::getInstance()->setNextScene(gfSceneManager::getInstance(), "scMelee", 0);
        ChangeGfSceneField(Scene::Idle);
        gfSceneManager::getInstance()->changeNextScene(gfSceneManager::getInstance());
        NetMenu::showText = false;
    }
    void startMatchingCallback() {
        Utils::SaveRegs();
        OSReport("Starting matchmaking!\n");
        Utils::RestoreRegs();
    }
    __attribute__((naked)) void startMatchingCallback2() {
        asm volatile(
            "lis 12, 0x8014\n\t"
            "ori 12, 12, 0xaffc\n\t"
            "mtctr 12\n\t"
            "bctr\n\t"
        );
    }
    void setNextAnyOkirakuTop() {
        Utils::SaveRegs();
        //BootToScMelee();
        Utils::RestoreRegs();
    }
    OSThread thread;
    char stack[0x4000];
    void setNextAnyOkirakuCaseFive() {
        Utils::SaveRegs();
        OSReport("Loaded into online training room\n");

        OSCreateThread(&thread, Netplay::StartMatching, NULL, stack + 0x4000, 0x4000, 31, 0);
        OSResumeThread(&thread);
        Utils::RestoreRegs();
    }
    void netThreadTaskOverride() {
        Utils::SaveRegs();
        Utils::RestoreRegs();
    }
    __attribute__((naked)) void BBisCompleteMeleeSettingAllMember() {
        asm volatile (
            "mr 3, %0\n\t" 
            "lis 12, 0x8096\n\t"
            "ori 12, 12, 0x44D0\n\t"
            "mtctr 12\n\t"
            "bctr\n\t"
            :
            : "r"(Netplay::foundMatch)
        );
    }
    __attribute__((naked)) void BBisWifiPreloadCharacter() {
        asm volatile (
            "mr 3, %0\n\t" 
            "lis 12, 0x8096\n\t"
            "ori 12, 12, 0x4670\n\t"
            "mtctr 12\n\t"
            "bctr\n\t"
            :
            : "r"(Netplay::foundMatch)
        );
    }
    __attribute__((naked)) void BBisCompleteCloseMatchingAllNode() {
        asm volatile (
            "mr 3, %0\n\t"
            "lis 12, 0x8096\n\t"
            "ori 12, 12, 0x4544\n\t"
            "mtctr 12\n\t"
            "bctr\n\t"
            :
            : "r"(Netplay::foundMatch)
        );
    }
    __attribute__((naked)) void BBisPlayerAssignReceived() {
        asm volatile (
            "mr 3, %0\n\t"
            "lis 12, 0x8096\n\t"
            "ori 12, 12, 0x485C\n\t"
            "mtctr 12\n\t"
            "bctr\n\t"
            :
            : "r"(Netplay::foundMatch)
        );
    }
    __attribute__((naked)) void netThreadTaskOverride2() {
        asm volatile (
            "lis 12, 0x8014\n\t"
            "ori 12, 12, 0xb674\n\t"
            "mtctr 12\n\t"
            "bctr\n\t"
        );
    }
    __attribute__((naked)) void BBSkipgmInitGlobalMelee() {
       asm volatile(
            "lis 12, 0x806f\n\t"
            "ori 12, 12, 0x2a88\n\t"
            "mtctr 12\n\t"
            "bctr\n\t"
        ); 
    }
    __attribute__((naked)) void BBSkipgmInitGlobalMelee2() {
       asm volatile(
            "lis 12, 0x806f\n\t"
            "ori 12, 12, 0x254c\n\t"
            "mtctr 12\n\t"
            "bctr\n\t"
        ); 
    }
    __attribute__((naked)) void BBSkipRandomRulesetChange() {
        asm volatile(
            "lis 12, 0x806f\n\t"
            "ori 12, 12, 0x23f0\n\t"
            "mtctr 12\n\t"
            "bctr\n\t"
        );
    }
    void BBsetNextAnyOriakuBootScMelee() {
        Utils::SaveRegs();
        if(Netplay::foundMatch)
        {
            NetMenu::text = "Starting Game";
            BootToScMelee();
        }
        Utils::RestoreRegs();
    }
    void BBSetGameModeBitCorrectly() 
    {
        Utils::SaveRegs();
        g_GameGlobal->m_modeMelee->m_meleeInitData._0x0[1] = g_GameGlobal->m_setRule->gameRule << 5;
        Utils::RestoreRegs();
    }
    __attribute__((naked)) void BBSetGameModeBitCorrectly2() 
    {
        asm volatile(
            "lis 12, 0x806F\n\t"
            "ori 12, 12, 0x2A94\n\t"
            "mtctr 12\n\t"
            "bctr\n\t"
        );
    }
    void BBSetupNetMelee() {
        Utils::SaveRegs();
        setupMelee((void*)0x90ff42e0, 0x1);
        Utils::RestoreRegs();
    }
    void ExitWifiCSSReturnsToDirectOrQuickplayScreen2()
    {
        Utils::SaveRegs();
        onQuickplayMenus = false;
        Netplay::isInTrainingRoom = false;
        Utils::RestoreRegs();
    }
    __attribute__((naked)) void ExitWifiCSSReturnsToDirectOrQuickplayScreen() 
    {
        asm volatile (
            "li 5, 31\n\t"
            "lis 12, 0x806f\n\t"
            "ori 12, 12, 0x2c64\n\t"
            "mtctr 12\n\t"
            "bctr\n\t"
        );
    }
    void SkipDirectlyToCSS() 
    {
        onQuickplayMenus = true;
        gfSceneManager::getInstance()->unk1 = 0x1e;
        gfSceneManager::getInstance()->processStep = 0x2;
        render((void*)0x805b50a8);
    }
    void SkipDirectlyToTrainingRoom()
    {
        Utils::SaveRegs();
        unsigned int scene;
        asm volatile (
            "mr %0, 3\n\t"
            : "=r"(scene)
        );
        
        if((*(int*)(scene + 8)) == 2)
        {
            Netplay::isInTrainingRoom = false;
            if(gfSceneManager::getInstance()->unk1 == 1)
            {
                Netplay::isInTrainingRoom = true;
                (*(int*)(scene + 8)) = 4;
            }
        }
        else if((*(int*)(scene + 8)) == 7) 
        {
            Netplay::isInTrainingRoom = true;
            if(gfSceneManager::getInstance()->unk1 == 3)
            {
                Netplay::isInTrainingRoom = false;
                (*(int*)(scene + 8)) = 0;
            }
        }
        Utils::RestoreRegs();
        asm volatile (
            "lis 25, 0x8070\n\t"
        );
    }
    void GetRulesFromCSSBoot() 
    {
        Utils::SaveRegs();
        if(!setRules)
        {
            memmove(&Match::rules, g_GameGlobal->m_setRule, 0x88);
            setRules = true;
        }
        Utils::RestoreRegs();
        asm volatile (
            "lwz 6, 0x0028 (31)\n\t"
        );
    }
    void SetRulesFromCSSBoot() 
    {
        Utils::SaveRegs();
        if(setRules)
        {
            memmove(g_GameGlobal->m_setRule, &Match::rules, 0x88);
        }
        Utils::RestoreRegs();
        asm volatile (
            "lbz 0, 0x0040 (4)\n\t"
        );
    }
    void MatchmakingText() 
    {
        if(showText) {
            TextPrinter::setup();
            TextPrinter::start2D();
            TextPrinter::message.fontScaleY = 0.75;
            TextPrinter::message.fontScaleX = 0.75;
            TextPrinter::lineHeight = 20 * TextPrinter::message.fontScaleY;
            TextPrinter::message.xPos = 20;
            TextPrinter::message.yPos = 69;
            TextPrinter::printLine(text);
            GXColor selectedColor = GXColor();
            selectedColor.r = 0xFF;
            selectedColor.g = 0xAA;
            selectedColor.b = 0xAA;
            selectedColor.a = 0xDD;
            TextPrinter::setTextColor(selectedColor);
            TextPrinter::padToWidth(16);
        }
    }
    int register4 = 0;
    void RemoveDisconnectPanel() 
    {
        Utils::SaveRegs();
        asm volatile(
            "mr %0, 4"
            : "=r"(register4)
        );
        if(register4 == 6 && onQuickplayMenus)
        {
            register4 = 4;
        }
        Utils::RestoreRegs();
        asm volatile(
            "mr	29, 3\n\t"
        );
    }
    __attribute__((naked)) void RemoveDisconnectPanel2()
    {
        asm volatile(
            "mr 4, %0\n\t"
            "mr	30, 4\n\t"
            "cmpwi 4, 6\n\t"
            "stw 4, 0x0040 (29)\n\t"
            "lis 3, 0x8068\n\t"
            "ori 3, 3, 0x733C\n\t"
            "mtctr 3\n\t"
            "mr	3, 29\n\t"
            "bctr\n\t"
            :
            : "r"(register4)
        );
    }
}

namespace RollbackHooks {
    void InstallHooks()
    {
        // Match Namespace
        SyringeCore::syInlineHook(0x806d4c10, reinterpret_cast<void*>(Match::StopGameScMeleeHook));
        SyringeCore::syInlineHook(0x806d176c, reinterpret_cast<void*>(Match::StartSceneMelee));
        SyringeCore::syInlineHook(0x806d4844, reinterpret_cast<void*>(Match::ExitSceneMelee));
        SyringeCore::syInlineHook(0x8003fac4, reinterpret_cast<void*>(Match::setRandSeed));
        SyringeCore::syInlineHook(0x80026258, reinterpret_cast<void*>(Match::dump_gfMemoryPool_hook));
        SyringeCore::syInlineHook(0x80025c6c, reinterpret_cast<void*>(Match::alloc_gfMemoryPool_hook));
        SyringeCore::syInlineHook(0x80025ec4, reinterpret_cast<void*>(Match::allocGfMemoryPoolEndHook));
        SyringeCore::syInlineHook(0x80025f40, reinterpret_cast<void*>(Match::free_gfMemoryPool_hook));

        // FrameAdvance Namespace
        SyringeCore::syInlineHook(0x8002ba80, reinterpret_cast<void*>(FrameAdvance::fixPadInconsistency));
        SyringeCore::syInlineHook(0x80029468, reinterpret_cast<void*>(FrameAdvance::updateLowHook));
        SyringeCore::syInlineHook(0x800173a4, reinterpret_cast<void*>(FrameAdvance::handleFrameAdvanceHook));
        SyringeCore::syInlineHook(0x8004a9f8, reinterpret_cast<void*>(FrameAdvance::turnOnAllAppropriatePorts));

        // FrameLogic Namespace
        //SyringeCore::syInlineHook(0x8002dc74, reinterpret_cast<void*>(FrameLogic::gfTaskProcessHook));
        //SyringeCore::sySimpleHook(0x8002dc78, reinterpret_cast<void*>(FrameLogic::gfTaskProcessHook2));
        //SyringeCore::syHookFunction(0x800174fc, reinterpret_cast<void*>(FrameLogic::endMainLoop));
        SyringeCore::syInlineHook(0x801473a0, reinterpret_cast<void*>(FrameLogic::endFrame));
        SyringeCore::syInlineHook(0x800171b4, reinterpret_cast<void*>(FrameLogic::beginningOfMainGameLoop));
        SyringeCore::syInlineHook(0x80017760, reinterpret_cast<void*>(FrameLogic::updateFrameCounter));
        SyringeCore::syInlineHook(0x8004e884, reinterpret_cast<void*>(FrameLogic::initFrameCounter));
        SyringeCore::syInlineHook(0x80147394, reinterpret_cast<void*>(FrameLogic::beginFrame));

        // GMMelee Namespace
        SyringeCore::syInlineHook(0x806dd03c, reinterpret_cast<void*>(GMMelee::postSetupMelee));

        // NetMenu Namespace
        SyringeCore::sySimpleHook(0x8014B5F8, reinterpret_cast<void*>(NetMenu::setToLoggedIn));
        SyringeCore::sySimpleHook(0x8014B5FC, reinterpret_cast<void*>(NetMenu::setToLoggedIn2));
        SyringeCore::sySimpleHook(0x80033b48, reinterpret_cast<void*>(NetMenu::disableMiiRender));
        SyringeCore::sySimpleHook(0x800CCF70, reinterpret_cast<void*>(NetMenu::disableMatchmakingError));
        SyringeCore::sySimpleHook(0x8014b4bc, reinterpret_cast<void*>(NetMenu::forceFriendCode));
        SyringeCore::sySimpleHook(0x8014b3b8, reinterpret_cast<void*>(NetMenu::forceConnection));
        //SyringeCore::syInlineHook(0x801494A0, reinterpret_cast<void*>(NetMenu::connectToAnybodyAsyncHook));
        SyringeCore::sySimpleHook(0x801494A4, reinterpret_cast<void*>(NetMenu::connectToAnybodyAsyncHook2));
        SyringeCore::sySimpleHook(0x80686ae4, reinterpret_cast<void*>(NetMenu::disableCreateCounterOnCSS), Modules::SORA_MENU_SEL_CHAR);
        SyringeCore::sySimpleHook(0x80687f6c, reinterpret_cast<void*>(NetMenu::turnOffCSSTimer), Modules::SORA_MENU_SEL_CHAR);
        SyringeCore::sySimpleHook(0x806b1da0, reinterpret_cast<void*>(NetMenu::disableCreateCounterOnSSS), Modules::SORA_MENU_SEL_CHAR);
        SyringeCore::sySimpleHook(0x806b3f28, reinterpret_cast<void*>(NetMenu::turnOffSSSTimer), Modules::SORA_MENU_SEL_CHAR);
        SyringeCore::sySimpleHook(0x80687c68, reinterpret_cast<void*>(NetMenu::disableGetNetworkErrorOnCSS), Modules::SORA_MENU_SEL_CHAR);        
        SyringeCore::sySimpleHook(0x806b3a74, reinterpret_cast<void*>(NetMenu::disableGetNetworkErrorOnSSS), Modules::SORA_MENU_SEL_CHAR);
        SyringeCore::syInlineHook(0x8014AFF4, reinterpret_cast<void*>(NetMenu::startMatchingCallback));
        SyringeCore::sySimpleHook(0x8014aff8, reinterpret_cast<void*>(NetMenu::startMatchingCallback2));
        SyringeCore::syInlineHook(0x806f2358, reinterpret_cast<void*>(NetMenu::setNextAnyOkirakuTop));
        SyringeCore::syInlineHook(0x806f272c, reinterpret_cast<void*>(NetMenu::setNextAnyOkirakuCaseFive));
        SyringeCore::syInlineHook(0x8014B66C, reinterpret_cast<void*>(NetMenu::netThreadTaskOverride));
        SyringeCore::sySimpleHook(0x8014b670, reinterpret_cast<void*>(NetMenu::netThreadTaskOverride2));
        SyringeCore::sySimpleHook(0x809644CC, reinterpret_cast<void*>(NetMenu::BBisCompleteMeleeSettingAllMember));
        SyringeCore::sySimpleHook(0x8096466C, reinterpret_cast<void*>(NetMenu::BBisWifiPreloadCharacter));
        SyringeCore::sySimpleHook(0x80964540, reinterpret_cast<void*>(NetMenu::BBisCompleteCloseMatchingAllNode));
        SyringeCore::sySimpleHook(0x80964858, reinterpret_cast<void*>(NetMenu::BBisPlayerAssignReceived));
        SyringeCore::sySimpleHook(0x806f27fc, reinterpret_cast<void*>(NetMenu::BBSkipgmInitGlobalMelee));
        SyringeCore::sySimpleHook(0x806f2548, reinterpret_cast<void*>(NetMenu::BBSkipgmInitGlobalMelee2));
        SyringeCore::syInlineHook(0x806f2a88, reinterpret_cast<void*>(NetMenu::BBsetNextAnyOriakuBootScMelee));
        SyringeCore::sySimpleHook(0x806f23c0, reinterpret_cast<void*>(NetMenu::BBSkipRandomRulesetChange));
        SyringeCore::syInlineHook(0x806F2A8C, reinterpret_cast<void*>(NetMenu::BBSetGameModeBitCorrectly));
        SyringeCore::sySimpleHook(0x806f2a90, reinterpret_cast<void*>(NetMenu::BBSetGameModeBitCorrectly2));
        SyringeCore::syInlineHook(0x806f27f8, reinterpret_cast<void*>(NetMenu::BBSetupNetMelee));
        SyringeCore::sySimpleHook(0x806f2c60, reinterpret_cast<void*>(NetMenu::ExitWifiCSSReturnsToDirectOrQuickplayScreen));
        SyringeCore::syInlineHook(0x806F2C5C, reinterpret_cast<void*>(NetMenu::ExitWifiCSSReturnsToDirectOrQuickplayScreen2));
        SyringeCore::syReplaceFunc(0x81191d44, reinterpret_cast<void*>(NetMenu::SkipDirectlyToCSS), NULL, Modules::SORA_MENU_MAIN);
        SyringeCore::syInlineHook(0x806f233c, reinterpret_cast<void*>(NetMenu::SkipDirectlyToTrainingRoom));
        SyringeCore::syInlineHook(0x806830d8, reinterpret_cast<void*>(NetMenu::GetRulesFromCSSBoot), Modules::SORA_MENU_SEL_CHAR);
        SyringeCore::syInlineHook(0x8068300c, reinterpret_cast<void*>(NetMenu::SetRulesFromCSSBoot), Modules::SORA_MENU_SEL_CHAR);
        SyringeCore::syReplaceFunc(0x800cc540, reinterpret_cast<void*>(Utils::ReturnImmediately), NULL);
        SyringeCore::syReplaceFunc(0x801466ac, reinterpret_cast<void*>(Utils::ReturnImmediately), NULL);
        SyringeCore::syReplaceFunc(0x800ccec4, reinterpret_cast<void*>(Utils::ReturnImmediately), NULL);
        SyringeCore::syInlineHook(0x80687334, reinterpret_cast<void*>(NetMenu::RemoveDisconnectPanel), Modules::SORA_MENU_SEL_CHAR);
        SyringeCore::sySimpleHook(0x80687338, reinterpret_cast<void*>(NetMenu::RemoveDisconnectPanel2), Modules::SORA_MENU_SEL_CHAR);
        SyringeCore::syReplaceFunc(0x80146b80, reinterpret_cast<void*>(Utils::ReturnImmediately), NULL);
        // NetReport Namespace
        //SyringeCore::syInlineHook(0x800c7534, reinterpret_cast<void*>(NetReport::netReportHook));
       // SyringeCore::syInlineHook(0x8119cd58, reinterpret_cast<void*>(NetReport::netReportHook2));
        //SyringeCore::syInlineHook(0x8095f894, reinterpret_cast<void*>(NetReport::netReportHook3));
        //SyringeCore::syInlineHook(0x80147ec0, reinterpret_cast<void*>(NetReport::netReportHook4));
        //SyringeCore::syInlineHook(0x800c8f68, reinterpret_cast<void*>(NetReport::netMinReportHook));
    }
}