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

namespace ReplaysLogic {
    bool recordInputs = false;
    bool entryFrame = false;

    bool isGamePaused() {
        return (GF_APPLICATION->_gameFlags & 0x01000000) != 0;
    }

    // called when match starts
    void InitiateMatch() {
        entryFrame = true;
        recordInputs = true;
    }

    // called when match ends
    void FinishMatch() {
        recordInputs = false;
        EXIPacket stagePacket = EXIPacket(EXICommand::ENDGAME, nullptr, 0);
        stagePacket.Send();
    }

    constexpr std::string_view REPLAY_FILENAME_START = "Game_";

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
        res = std::to_chars( res.ptr, nameBufferEnd, calendarTime.sec);
        const size_t stringSize = std::distance(nameBufferChar, res.ptr);

        //size of string is definitely small enough to fit in u8
        return static_cast<u8>(stringSize);
    }


    #define _getScMelee_GF_SCENE_MANAGER ((scMelee* (*)(gfSceneManager* This, char* searchName)) 0x8002d3f4)
    // called at the beginning of the logic in a frame
    void StartFrame() {
        if(recordInputs)
        {
            auto fighterManager = FIGHTER_MANAGER;
            auto gameGlobal = GAME_GLOBAL;
            auto itemManager = ITEM_MANAGER;

            u8 playerCount = fighterManager->getEntryCount();
            auto countDownEnded = _getScMelee_GF_SCENE_MANAGER(gfSceneManager::getInstance(), (char*)"scMelee")->stOperatorReadyGo1->isEnd();
            if(playerCount >= 2 &&
               countDownEnded != 0 &&
               !isGamePaused())
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

                    startReplay.stage = gameGlobal->globalModeMelee->stageID;
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
                    EXIPacket startReplayPacket = EXIPacket(EXICommand::START_REPLAYS_STRUCT, &startReplay, sizeof(StartReplay));
                    startReplayPacket.Send();
                }
                else
                {
                    int sizeOfItems = itemManager->baseItemArrayList.size();

                    Replay replay;
                    replay.numItems = sizeOfItems;
                    replay.frameCounter = gameGlobal->gameFrame->frameCounter;
                    replay.persistentFrameCounter = gameGlobal->gameFrame->persistentFrameCounter;
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
                        auto fighterInput = fighterManager->getInput(fighterManager->getEntryIdFromIndex(i));
                        const soStatusModuleImpl *stageObject = fighter->modules->statusModule;

                        player.actionState = stageObject->action;
                        inputs.attack = fighterInput->buttons.attack;
                        inputs.special = fighterInput->buttons.special;
                        inputs.jump = fighterInput->buttons.jump;
                        inputs.shield = fighterInput->buttons.shield;
                        inputs.dTaunt = fighterInput->buttons.dTaunt;
                        inputs.sTaunt = fighterInput->buttons.sTaunt;
                        inputs.uTaunt = fighterInput->buttons.uTaunt;
                        inputs.tapJump = fighterInput->buttons.tapJump;

                        inputs.leftStickX = fighterInput->leftStickX;
                        inputs.leftStickY = fighterInput->leftStickY;

                        pos.xPos = fighter->modules->postureModule->xPos;
                        pos.yPos = fighter->modules->postureModule->yPos * -1;
                        pos.zPos = fighter->modules->postureModule->zPos;

                        player.damage = fighter->getOwner()->getDamage();
                        player.stockCount = fighter->getOwner()->getStockCount();
                    }

                    EXIPacket replayPacket = EXIPacket(EXICommand::REPLAYS_STRUCT, &replay, sizeof(Replay));
                    replayPacket.Send();
                }
            }
        }
    }
    SIMPLE_INJECTION(initiateMatch, 0x800dc590, "li r9, 0x2") { InitiateMatch(); } // when starting match
    SIMPLE_INJECTION(finishMatch, 0x806d4844, "li r4, 0") { FinishMatch(); } // when exiting match
    SIMPLE_INJECTION(startFrame, 0x80147394, "li r0, 0x1") { StartFrame(); } // when frame starts
}