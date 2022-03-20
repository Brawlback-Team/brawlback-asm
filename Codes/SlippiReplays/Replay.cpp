#include "Replay.h"

namespace ReplaysLogic {
    bool recordInputs;
    bool entryFrame;

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
        if(recordInputs && FIGHTER_MANAGER->getEntryCount() >= 2 && GAME_GLOBAL->gameFrame->frameCounter > 250 && !isGamePaused())
        {
            if(entryFrame)
            {
                entryFrame = false;
                
                int *numPlayers = new int[1];
                numPlayers[0] = FIGHTER_MANAGER->getEntryCount();

                EXIPacket numPlayersPacket = EXIPacket(EXIStatus::NUM_PLAYERS, numPlayers, 1 * sizeof(int));
                numPlayersPacket.Send();

                const GameGlobal *game = GAME_GLOBAL;
                
                mtRand *rand = DEFAULT_MT_RAND;
                mtRand *otherRand = OTHER_MT_RAND;

                u32 *randomSeeds = new u32[2];
                randomSeeds[0] = rand->seed;
                randomSeeds[1] = otherRand->seed;

                EXIPacket randomPacket = EXIPacket(EXIStatus::RANDOM, randomSeeds, 2 * sizeof(u32));
                randomPacket.Send();

                u8 *stage = new u8[1];
                stage[0] = game->globalModeMelee->stageID;

                EXIPacket stagePacket = EXIPacket(EXIStatus::STAGE, stage, 1 * sizeof(u8));
                stagePacket.Send();

                delete[] stage;
                delete[] randomSeeds;
                delete[] numPlayers;

                for(int i = 0; i < FIGHTER_MANAGER->getEntryCount(); i++) 
                {
                    auto fighter = FIGHTER_MANAGER->getFighter(FIGHTER_MANAGER->getEntryIdFromIndex(i));
                    auto xPos = fighter->modules->postureModule->xPos;
                    auto yPos = fighter->modules->postureModule->yPos * -1;
                    auto zPos = fighter->modules->postureModule->zPos;

                    auto *positions = new float[3];
                    positions[0] = xPos;
                    positions[1] = yPos;
                    positions[2] = zPos;

                    auto *fighterInfo = new int[1];
                    fighterInfo[0] = fighter->getFtKind();

                    auto *index = new int[1];
                    index[0] = i;

                    EXIPacket indexPacket = EXIPacket(EXIStatus::INDEX, index, 1 * sizeof(int));
                    indexPacket.Send();

                    EXIPacket positionsPacket = EXIPacket(EXIStatus::STARTPOS, positions, 3 * sizeof(float));
                    positionsPacket.Send();

                    EXIPacket fighterPacket = EXIPacket(EXIStatus::STARTFIGHTER, fighterInfo, 1 * sizeof(int));
                    fighterPacket.Send();
                    delete[] positions;
                    delete[] fighterInfo;
                }
            }
            ftManager *fighter = FIGHTER_MANAGER;
            const GameGlobal *game = GAME_GLOBAL;
            itemIdName *itemIds;
            u16 *itemVariants;
            u32 *gameInfo = new u32[2];
            int sizeOfItems = ITEM_MANAGER->baseItemArrayList.size();

            gameInfo[0] = game->gameFrame->frameCounter;
            gameInfo[1] = game->gameFrame->persistentFrameCounter;

            EXIPacket gamePacket = EXIPacket(EXIStatus::GAME, gameInfo, 2 * sizeof(u32));
            gamePacket.Send();
            delete[] gameInfo;

            if(sizeOfItems > 0) {
                itemIds = new itemIdName[sizeOfItems];
                itemVariants = new u16[sizeOfItems];
                for (int i = 0; i < sizeOfItems; i++) {
                    auto item = ITEM_MANAGER->baseItemArrayList.at(i);
                    itemIds[i] = (*item)->getItKind();
                    itemVariants[i] = (*item)->getItVariation();
                }
                
                EXIPacket itemIdsPacket = EXIPacket(EXIStatus::ITEM_IDS, itemIds, sizeOfItems * sizeof(itemIdName));
                itemIdsPacket.Send();

                EXIPacket itemVarientsPacket = EXIPacket(EXIStatus::ITEM_VARIENTS, itemVariants, sizeOfItems * sizeof(u16));
                itemVarientsPacket.Send();
                
                delete[] itemIds;
                delete[] itemVariants;
            }

            for(int i = 0; i < fighter->getEntryCount(); i++) 
            {
                u8 *actions = new u8[9];
                auto *stick = new float[2];
                auto *fighterInfo = new double[1];
                auto *stockCount = new int[1];
                auto *positions = new float[3];
                u32 *actionState = new u32[1];
                const soStatusModuleImpl *stageObject = fighter->getFighter(fighter->getEntryIdFromIndex(i))->modules->statusModule;
                actionState[0] = stageObject->action;
                actions[0] = fighter->getInput(fighter->getEntryIdFromIndex(i))->buttons.attack;
                actions[1] = fighter->getInput(fighter->getEntryIdFromIndex(i))->buttons.special;
                actions[2] = fighter->getInput(fighter->getEntryIdFromIndex(i))->buttons.jump;
                actions[3] = fighter->getInput(fighter->getEntryIdFromIndex(i))->buttons.shield;
                actions[4] = fighter->getInput(fighter->getEntryIdFromIndex(i))->buttons.dTaunt;
                actions[5] = fighter->getInput(fighter->getEntryIdFromIndex(i))->buttons.sTaunt;
                actions[6] = fighter->getInput(fighter->getEntryIdFromIndex(i))->buttons.uTaunt;
                actions[7] = fighter->getInput(fighter->getEntryIdFromIndex(i))->buttons.cStick;
                actions[8] = fighter->getInput(fighter->getEntryIdFromIndex(i))->buttons.tapJump;

                stick[0] = fighter->getInput(fighter->getEntryIdFromIndex(i))->leftStickX;
                stick[1] = fighter->getInput(fighter->getEntryIdFromIndex(i))->leftStickY;

                positions[0] = fighter->getFighter(fighter->getEntryIdFromIndex(i))->modules->postureModule->xPos;
                positions[1] = fighter->getFighter(fighter->getEntryIdFromIndex(i))->modules->postureModule->yPos * -1;
                positions[2] = fighter->getFighter(fighter->getEntryIdFromIndex(i))->modules->postureModule->zPos;

                fighterInfo[0] = fighter->getFighter(fighter->getEntryIdFromIndex(i))->getOwner()->getDamage();
                stockCount[0] = fighter->getFighter(fighter->getEntryIdFromIndex(i))->getOwner()->getStockCount();

                auto *index = new int[1];
                index[0] = i;

                EXIPacket indexPacket = EXIPacket(EXIStatus::INDEX, index, 1 * sizeof(int));
                indexPacket.Send();

                EXIPacket inputPacket = EXIPacket(EXIStatus::INPUTS, actions, 9 * sizeof(u8));
                inputPacket.Send();

                EXIPacket positionsPacket = EXIPacket(EXIStatus::POS, positions, 3 * sizeof(float));
                positionsPacket.Send();

                EXIPacket stickPacket = EXIPacket(EXIStatus::STICK, stick, 2 * sizeof(float));
                stickPacket.Send();

                EXIPacket actionStatePacket = EXIPacket(EXIStatus::ACTIONSTATE, actionState, 1 * sizeof(u32));
                actionStatePacket.Send();

                EXIPacket stockPacket = EXIPacket(EXIStatus::STOCK_COUNT, stockCount, 1 * sizeof(int));
                stockPacket.Send();

                EXIPacket fighterPacket = EXIPacket(EXIStatus::FIGHTER, fighterInfo, 1 * sizeof(double));
                fighterPacket.Send();

                delete[] actions;
                delete[] fighterInfo;
                delete[] positions;
                delete[] stick;
                delete[] actionState;
                delete[] stockCount;
                delete[] index;
            }
        }
    }
    SIMPLE_INJECTION(initiateMatch, 0x800dc590, "li r9, 0x2") { InitiateMatch(); } // when starting match
    SIMPLE_INJECTION(finishMatch, 0x806d4844, "li r4, 0") { FinishMatch(); } // when exiting match
    SIMPLE_INJECTION(startFrame, 0x80147394, "li r0, 0x1") { StartFrame(); } // when frame starts
}