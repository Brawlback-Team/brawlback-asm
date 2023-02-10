#include <Brawl/GF/gfSceneManager.h>
#include "Assembly.h"
#include "Debug.h"
#include "Memory.h"
#include "Brawl/GF/GameFrame.h"
#include "Brawl/GF/gfApplication.h"
#include <Brawl/FT/ftManager.h>
#include <Brawl/GF/GameGlobal.h>
#include <Wii/mtRand.h>
#include <Brawl/IT/itManager.h>
#include "EXIPacket.h"
#include "brawlback-common/ExiStructures.h"
#include <cstdio>
#include <cstring>
#include <charconv>
#include <string_view>
#include <Brawl/SC/scMelee.h>
#include "PlaybackMenu.h"
#include "Wii/EXI/EXI.h"
#include "Brawl/GF/gfPadSystem.h"
#include "Wii/OS/OSInterrupt.h"
#include "Utilities/Utility.h"
#include "Brawl/FT/ftControllerModuleImpl.h"
#include "Playback.h"

bool isInReplay = false;
namespace ReplayLogic {
    bool replayLogicFlag = false;
    bool entryFrame = false;

    bool isGamePaused() {
        return (GF_APPLICATION->_gameFlags & 0x01000000) != 0;
    }

    // called when match starts
    void InitiateMatch() {
        entryFrame = true;
        replayLogicFlag = true;
    }

    // called when match ends
    void FinishMatch() {
        replayLogicFlag = false;
        if(!playbackDecided)
        {
            EXIPacket stagePacket = EXIPacket(EXICommand::REPLAYS_REPLAYS_END, nullptr, 0);
            stagePacket.Send();
        }
        playbackDecided = false;
        isInReplay = false;
    }

    constexpr std::string_view REPLAY_FILENAME_START = "G";

    

    //write replay name directly into buffer
    u8 writeReplayFileName( u8* buffer, size_t bufferSize)
    {
        const auto calendarTime = OSTimeToCalendarTime(getTime());

        //cast buffer to char* so to_chars works correctly
        auto nameBufferChar = reinterpret_cast<char*>(buffer);
        std::memcpy(nameBufferChar, REPLAY_FILENAME_START.data(), REPLAY_FILENAME_START.size());
        
        const auto nameBufferEnd = nameBufferChar + bufferSize;
        auto res = std::to_chars( nameBufferChar + REPLAY_FILENAME_START.size(), nameBufferEnd, calendarTime.year);

        auto writeNumber = [&](int value){
            if(value < 10){
                *res.ptr = '0';
                res.ptr++;
            }
            res = std::to_chars( res.ptr, nameBufferEnd, value);
        };

        const auto month = calendarTime.mon + 1;
        writeNumber(month);
        writeNumber(calendarTime.mday);

        *res.ptr = 'T';
        res.ptr++;

        writeNumber(calendarTime.hour);
        writeNumber(calendarTime.min);
        writeNumber(calendarTime.sec);
        const size_t stringSize = std::distance(nameBufferChar, res.ptr);

        //size of string is definitely small enough to fit in u8
        return static_cast<u8>(stringSize);
    }
    #define _getScMelee_GF_SCENE_MANAGER ((scMelee* (*)(gfSceneManager* This, char* searchName)) 0x8002d3f4)
    void Record()
    {
        auto fighterManager = FIGHTER_MANAGER;
        auto gameGlobal = GAME_GLOBAL;
        auto itemManager = ITEM_MANAGER;

        u8 playerCount = fighterManager->getEntryCount();
        auto countDownEnded = _getScMelee_GF_SCENE_MANAGER(gfSceneManager::getInstance(), (char*)"scMelee")->stOperatorReadyGo1->isEnd();
        if(playerCount >= 2 && countDownEnded != 0 && !isGamePaused())
        {
            if(entryFrame)
            {
                entryFrame = false;

                StartReplay startReplay;
                
                const u8 fileNameSize = writeReplayFileName( startReplay.nameBuffer, std::size(startReplay.nameBuffer));
                startReplay.nameSize = fileNameSize;

                startReplay.firstFrame = gameGlobal->gameFrame->frameCounter;
                startReplay.randomSeed = DEFAULT_MT_RAND->seed;
                startReplay.otherRandomSeed = OTHER_MT_RAND->seed;
                memcpy(startReplay.gameData, gameGlobal->globalModeMelee, 0x320);
                startReplay.stage = gameGlobal->globalModeMelee->m_meleeInitData.m_stageID;
                startReplay.numPlayers = playerCount;
                for(int i = 0; i < playerCount; i++)
                {
                    auto fighter = fighterManager->getFighter(fighterManager->getEntryIdFromIndex(i));

                    startReplay.players[i].fighterKind = fighter->getFtKind();
                    startReplay.players[i].slotID = fighterManager->getFighterGmKind(fighterManager->getEntryIdFromIndex(i));

                    startReplay.players[i].startPlayer.xPos = fighter->modules->postureModule->xPos;
                    startReplay.players[i].startPlayer.yPos = fighter->modules->postureModule->yPos * -1;
                    startReplay.players[i].startPlayer.zPos = fighter->modules->postureModule->zPos;
                }
                OSReport("SIZE: %u\n", sizeof(StartReplay));
                EXIPacket startReplayPacket = EXIPacket(EXICommand::REPLAY_START_REPLAYS_STRUCT, &startReplay, sizeof(StartReplay));
                startReplayPacket.Send();
            }
            int sizeOfItems = itemManager->baseItemArrayList.size();

            Replay replay;
            replay.numItems = sizeOfItems;
            replay.frameCounter = gameGlobal->gameFrame->frameCounter;
            for (int i = 0; i < sizeOfItems; i++)
            {
                auto item = itemManager->baseItemArrayList.at(i);
                auto& replayItem = replay.items[i];
                replayItem.itemId = (*item)->getItKind();
                replayItem.itemVariant = (*item)->getItVariation();
            }
            replay.numPlayers = playerCount;
            for(int i = 0; i < playerCount; i++)
            {
                auto fighter = fighterManager->getFighter(fighterManager->getEntryIdFromIndex(i));
                auto& player = replay.players[i];
                auto& inputs = player.inputs;
                auto& pos = player.pos;
                auto& fighterInput = PAD_SYSTEM->pads[i];
                const soStatusModuleImpl *stageObject = fighter->modules->statusModule;

                inputs.buttons = fighterInput.buttons.bits;
                inputs.holdButtons = fighterInput.holdButtons.bits;
                inputs.rapidFireButtons = fighterInput.rapidFireButtons.bits;
                inputs.releasedButtons = fighterInput.releasedButtons.bits;
                inputs.newPressedButtons = fighterInput.newPressedButtons.bits;
                inputs.LAnalogue = fighterInput.LAnalogue;
                inputs.RAnalogue = fighterInput.RAnalogue;
                inputs.stickX = fighterInput.stickX;
                inputs.stickY = fighterInput.stickY;
                inputs.cStickX = fighterInput.cStickX;
                inputs.cStickY = fighterInput.cStickY;
                inputs.LTrigger = fighterInput.LTrigger;
                inputs.RTrigger = fighterInput.RTrigger;

                pos.xPos = fighter->modules->postureModule->xPos;
                pos.yPos = fighter->modules->postureModule->yPos * -1;
                pos.zPos = fighter->modules->postureModule->zPos;

                player.damage = fighter->getOwner()->getDamage();
                player.stockCount = fighter->getOwner()->getStockCount();
            }

            EXIPacket replayPacket = EXIPacket(EXICommand::REPLAY_REPLAYS_STRUCT, &replay, sizeof(Replay));
            replayPacket.Send();
        
        }
    }

    void Playback(Replay replay, int port, gfPadGamecube* ddst)
    {
        auto fighterManager = FIGHTER_MANAGER;
        u8 playerCount = fighterManager->getEntryCount();
        auto countDownEnded = _getScMelee_GF_SCENE_MANAGER(gfSceneManager::getInstance(), (char*)"scMelee")->stOperatorReadyGo1->isEnd();

        if(playerCount >= 2 && countDownEnded != 0 && !isGamePaused())
        {
            auto& player = replay.players[port];
            auto& inputs = player.inputs;

            ddst->buttons.bits = inputs.buttons;
            ddst->holdButtons.bits = inputs.holdButtons;
            ddst->releasedButtons.bits = inputs.releasedButtons;
            ddst->rapidFireButtons.bits = inputs.rapidFireButtons;
            ddst->newPressedButtons.bits = inputs.newPressedButtons;
            ddst->cStickX = inputs.cStickX;
            ddst->cStickY = inputs.cStickY;
            ddst->stickX = inputs.stickX;
            ddst->stickY = inputs.stickY;
            ddst->LAnalogue = inputs.LAnalogue;
            ddst->RAnalogue = inputs.RAnalogue;
            ddst->LTrigger = inputs.LTrigger;
            ddst->RTrigger = inputs.RTrigger;
        }
    }
    
    Replay GetFrame(u32 frameNum)
    { 
        EXIPacket framePacket = EXIPacket(EXICommand::GET_NEXT_FRAME, &frameNum, sizeof(u32));
        framePacket.Send();
        u8 cmd_byte = 0;
        Replay nextFrame;
        do
        {
            readEXI(&cmd_byte, 1, EXIChannel::slotB, EXIDevice::device0, EXIFrequency::EXI_32MHz);
        } while (cmd_byte != EXICommand::BAD_FRAME && cmd_byte != EXICommand::GET_NEXT_FRAME);
        
        if(cmd_byte == BAD_FRAME)
        {
            OSReport("End of replay!\n");
            scMelee* melee = _getScMelee_GF_SCENE_MANAGER(gfSceneManager::getInstance(), (char*)"scMelee");
            melee->flags &= ~SC_MELEE_GAME_END_FLAG;
        }
        else 
        {
            readEXI(&nextFrame, sizeof(Replay), EXIChannel::slotB, EXIDevice::device0, EXIFrequency::EXI_32MHz);
        }
        return nextFrame;
    }
    // called at the beginning of the logic in a frame
    void StartFrame() 
    {
        _OSDisableInterrupts();
        if(replayLogicFlag && !playbackDecided)
        {
            Record();
        }
        _OSEnableInterrupts();
    }
    INJECTION("getGamePadStatusHook", 0x8002ae40, R"(
        SAVE_REGS
        bl StartPlayback
        RESTORE_REGS
        li r3, 0x1
    )");
    extern "C" void StartPlayback(gfPadSystem* pad_system, int port, gfPadGamecube* ddst)
    {
        if(replayLogicFlag && playbackDecided)
        {
            auto countDownEnded = _getScMelee_GF_SCENE_MANAGER(gfSceneManager::getInstance(), (char*)"scMelee")->stOperatorReadyGo1->isEnd();
            if(countDownEnded != 0)
            {
                Replay frame = GetFrame(GAME_GLOBAL->gameFrame->frameCounter);
                Playback(frame, port, ddst);
                isInReplay = true;
            }
        }
    }
    INJECTION("exitReplay", 0x806d49a4, R"(
        lis r3, isInReplay@ha
        lbz r3, isInReplay@l(r3)
    )");
    SIMPLE_INJECTION(postSetupMelee, 0x806dd03c, "addi	sp, sp, 48") {
        if(playbackDecided)
        {
            DEFAULT_MT_RAND->seed = PlaybackLogic::replayHeader.randomSeed;
            OTHER_MT_RAND->seed = PlaybackLogic::replayHeader.otherRandomSeed;
        }
    }
    SIMPLE_INJECTION(initiateMatch, 0x800dc590, "li r9, 0x2") { InitiateMatch(); } // when starting match
    SIMPLE_INJECTION(finishMatch, 0x806d4844, "li r4, 0") { FinishMatch(); } // when exiting match
    SIMPLE_INJECTION(startFrame, 0x80147394, "li r0, 0x1") { StartFrame(); } // when frame start
}