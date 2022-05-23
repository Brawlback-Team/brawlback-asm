#include "Record.h"

namespace ReplaysLogic {
    bool recordInputs = false;
    bool entryFrame = false;

    bool isGamePaused() {
        return (GF_APPLICATION->_gameFlags & 0x01000000) != 0;
    }

    // called when match starts
    void InitiateMatch() {
        recordInputs = true;
        entryFrame = true;
    }

    // called when match ends
    void FinishMatch() {
        recordInputs = false;
        EXIPacket stagePacket = EXIPacket(EXICommand::ENDGAME, nullptr, 0);
        stagePacket.Send();
    }

    // called at the beginning of the logic in a frame
    void StartFrame() {
        if(recordInputs)
        {
            auto fighterManager = FIGHTER_MANAGER;
            auto gameGlobal = GAME_GLOBAL;
            auto itemManager = ITEM_MANAGER;
            
            u8 playerCount = fighterManager->getEntryCount();
            if(playerCount >= 2 && gameGlobal->gameFrame->frameCounter > 250 && !isGamePaused())
            {
                if(entryFrame)
                {
                    entryFrame = false;

                    StartReplay startReplay;

                    const auto p1 = std::chrono::system_clock::now();
                    auto timestamp = std::chrono::duration_cast<std::chrono::seconds>(p1.time_since_epoch()).count();
                    char buffer[256];
                    auto timestampStr = itoa(timestamp, buffer, 10);
                    etl::string<256> name = "Game_";
                    name.append(timestampStr);

                    std::memcpy(startReplay.nameBuffer, name.data(), name.size() + 1);
                    startReplay.nameBuffer[name.size()] = '\0';
                    startReplay.nameSize = name.size() + 1;

                    startReplay.firstFrame = gameGlobal->gameFrame->frameCounter;
                    startReplay.randomSeed = DEFAULT_MT_RAND->seed;
                    startReplay.otherRandomSeed = OTHER_MT_RAND->seed;

                    startReplay.stage = gameGlobal->globalModeMelee->stageID;
                    startReplay.numPlayers = playerCount;
                    for(int i = 0; i < playerCount; i++)
                    {
                        auto fighter = fighterManager->getFighter(fighterManager->getEntryIdFromIndex(i));
                        startReplay.players[i].fighterKind = fighter->getFtKind();

                        startReplay.players[i].startPlayer.xPos = fighter->modules->postureModule->xPos;
                        startReplay.players[i].startPlayer.yPos = fighter->modules->postureModule->yPos * -1;
                        startReplay.players[i].startPlayer.zPos = fighter->modules->postureModule->zPos;
                    }

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

                    if(sizeOfItems > 0) {
                        for (int i = 0; i < sizeOfItems; i++) {
                            auto item = itemManager->baseItemArrayList.at(i);
                            auto& replayItem = replay.items[i];
                            replayItem.itemId = (*item)->getItKind();
                            replayItem.itemVariant = (*item)->getItVariation();
                        }
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