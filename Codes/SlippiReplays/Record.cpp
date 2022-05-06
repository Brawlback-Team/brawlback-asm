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
        EXIPacket stagePacket = EXIPacket(EXIStatus::ENDGAME, nullptr, 0);
        stagePacket.Send();
    }

    // called at the beginning of the logic in a frame
    void StartFrame() {
        if(recordInputs)
        {
            if(FIGHTER_MANAGER->getEntryCount() >= 2 && GAME_GLOBAL->gameFrame->frameCounter > 250 && !isGamePaused())
            {
                if(entryFrame)
                {
                    entryFrame = false;

                    auto* startReplay = new StartReplay();

                    const GameGlobal *game = GAME_GLOBAL;

                    mtRand *rand = DEFAULT_MT_RAND;
                    mtRand *otherRand = OTHER_MT_RAND;
                    startReplay->randomSeed = rand->seed;
                    startReplay->otherRandomSeed = otherRand->seed;

                    startReplay->stage = game->globalModeMelee->stageID;
                    startReplay->numPlayers = FIGHTER_MANAGER->getEntryCount();
                    startReplay->players = new StartReplayPlayer[FIGHTER_MANAGER->getEntryCount()];
                    for(int i = 0; i < FIGHTER_MANAGER->getEntryCount(); i++)
                    {
                        auto fighter = FIGHTER_MANAGER->getFighter(FIGHTER_MANAGER->getEntryIdFromIndex(i));
                        startReplay->players[i].fighterKind = fighter->getFtKind();
                        auto xPos = fighter->modules->postureModule->xPos;
                        auto yPos = fighter->modules->postureModule->yPos * -1;
                        auto zPos = fighter->modules->postureModule->zPos;

                        startReplay->players[i].startPlayer.xPos = xPos;
                        startReplay->players[i].startPlayer.yPos = yPos;
                        startReplay->players[i].startPlayer.zPos = zPos;
                    }

                    EXIPacket startReplayPacket = EXIPacket(EXIStatus::START_REPLAYS_STRUCT, startReplay, sizeof(StartReplay));
                    startReplayPacket.Send();
                    delete[] startReplay->players;
                    delete startReplay;
                }
                else
                {
                    ftManager *fighter = FIGHTER_MANAGER;
                    const GameGlobal *game = GAME_GLOBAL;
                    int sizeOfItems = ITEM_MANAGER->baseItemArrayList.size();

                    auto* replay = new Replay();
                    replay->numItems = sizeOfItems;
                    replay->frameCounter = game->gameFrame->frameCounter;
                    replay->persistentFrameCounter = game->gameFrame->persistentFrameCounter;

                    if(sizeOfItems > 0) {
                        replay->items = new ItemReplay[sizeOfItems];
                        for (int i = 0; i < sizeOfItems; i++) {
                            auto item = ITEM_MANAGER->baseItemArrayList.at(i);
                            replay->items[i].itemId = (*item)->getItKind();
                            replay->items[i].itemVariant = (*item)->getItVariation();
                        }
                    }
                    replay->players = new PlayerReplay[fighter->getEntryCount()];
                    replay->numPlayers = fighter->getEntryCount();
                    for(int i = 0; i < fighter->getEntryCount(); i++)
                    {
                        const soStatusModuleImpl *stageObject = fighter->getFighter(fighter->getEntryIdFromIndex(i))->modules->statusModule;
                        replay->players[i].actionState = stageObject->action;
                        replay->players[i].inputs.attack = fighter->getInput(fighter->getEntryIdFromIndex(i))->buttons.attack;
                        replay->players[i].inputs.special = fighter->getInput(fighter->getEntryIdFromIndex(i))->buttons.special;
                        replay->players[i].inputs.jump = fighter->getInput(fighter->getEntryIdFromIndex(i))->buttons.jump;
                        replay->players[i].inputs.shield = fighter->getInput(fighter->getEntryIdFromIndex(i))->buttons.shield;
                        replay->players[i].inputs.dTaunt = fighter->getInput(fighter->getEntryIdFromIndex(i))->buttons.dTaunt;
                        replay->players[i].inputs.sTaunt = fighter->getInput(fighter->getEntryIdFromIndex(i))->buttons.sTaunt;
                        replay->players[i].inputs.uTaunt = fighter->getInput(fighter->getEntryIdFromIndex(i))->buttons.uTaunt;
                        replay->players[i].inputs.tapJump = fighter->getInput(fighter->getEntryIdFromIndex(i))->buttons.tapJump;

                        replay->players[i].inputs.leftStickX = fighter->getInput(fighter->getEntryIdFromIndex(i))->leftStickX;
                        replay->players[i].inputs.leftStickY = fighter->getInput(fighter->getEntryIdFromIndex(i))->leftStickY;

                        replay->players[i].pos.xPos = fighter->getFighter(fighter->getEntryIdFromIndex(i))->modules->postureModule->xPos;
                        replay->players[i].pos.yPos = fighter->getFighter(fighter->getEntryIdFromIndex(i))->modules->postureModule->yPos * -1;
                        replay->players[i].pos.zPos = fighter->getFighter(fighter->getEntryIdFromIndex(i))->modules->postureModule->zPos;

                        replay->players[i].damage = fighter->getFighter(fighter->getEntryIdFromIndex(i))->getOwner()->getDamage();
                        replay->players[i].stockCount = fighter->getFighter(fighter->getEntryIdFromIndex(i))->getOwner()->getStockCount();
                    }

                    EXIPacket replayPacket = EXIPacket(EXIStatus::REPLAYS_STRUCT, replay, sizeof(Replay));
                    replayPacket.Send();

                    delete[] replay->items;
                    delete[] replay->players;
                    delete replay;
                }
            }
        }
    }
    SIMPLE_INJECTION(initiateMatch, 0x800dc590, "li r9, 0x2") { InitiateMatch(); } // when starting match
    SIMPLE_INJECTION(finishMatch, 0x806d4844, "li r4, 0") { FinishMatch(); } // when exiting match
    SIMPLE_INJECTION(startFrame, 0x80147394, "li r0, 0x1") { StartFrame(); } // when frame starts
}