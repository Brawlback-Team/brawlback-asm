#include <Brawl/FT/ftManager.h>
#include <Brawl/GF/GameGlobal.h>
#include <Wii/mtRand.h>
#include <Brawl/IT/itManager.h>
#include "Replay.h"
#include "EXIPacket.h"

namespace FrameLogic {
    bool recordInputs;
    bool entryFrame;

    // called when match starts
    void StartMatch() {
        recordInputs = true;
        entryFrame = true;
    }

    // called when match ends
    void EndMatch() {
        recordInputs = false;
        EXIPacket stagePacket = EXIPacket(EXIStatus::ENDGAME, nullptr, 0);
        stagePacket.Send();
    }

    // called at the beginning of the logic in a frame
    void BeginFrame() {
        if(recordInputs && FIGHTER_MANAGER->getEntryCount() > 0)
        {
            if(entryFrame)
            {
                entryFrame = false;

                const GameGlobal *game = GAME_GLOBAL;
                auto fighter = FIGHTER_MANAGER->getFighter(FIGHTER_MANAGER->getEntryIdFromIndex(0));
                mtRand *rand = DEFAULT_MT_RAND;
                mtRand *otherRand = OTHER_MT_RAND;

                u32 *randomSeeds = new u32[2];
                randomSeeds[0] = rand->seed;
                randomSeeds[1] = otherRand->seed;

                u8 *stage = new u8[1];
                stage[0] = game->globalModeMelee->stageID;

                auto xPos = fighter->modules->postureModule->xPos;
                auto yPos = fighter->modules->postureModule->yPos * -1;
                auto zPos = fighter->modules->postureModule->zPos;

                auto *positions = new float[3];
                positions[0] = xPos;
                positions[1] = yPos;
                positions[2] = zPos;

                auto *fighterInfo = new int[1];
                fighterInfo[0] = fighter->getFtKind();

                EXIPacket positionsPacket = EXIPacket(EXIStatus::STARTPOS, positions, 3 * sizeof(float));
                positionsPacket.Send();

                EXIPacket randomPacket = EXIPacket(EXIStatus::RANDOM, randomSeeds, 2 * sizeof(u32));
                randomPacket.Send();

                EXIPacket fighterPacket = EXIPacket(EXIStatus::STARTFIGHTER, fighterInfo, 1 * sizeof(int));
                fighterPacket.Send();

                EXIPacket stagePacket = EXIPacket(EXIStatus::STAGE, stage, 1 * sizeof(u8));
                stagePacket.Send();

                delete[] stage;
                delete[] positions;
                delete[] randomSeeds;
                delete[] fighterInfo;
            }
            ftManager *fighter = FIGHTER_MANAGER;
            const GameGlobal *game = GAME_GLOBAL;
            const soStatusModuleImpl *stageObject = fighter->getFighter(fighter->getEntryIdFromIndex(0))->modules->statusModule;

            u8 *actions = new u8[9];
            auto *stick = new float[2];
            auto *fighterInfo = new double[1];
            u32 *gameInfo = new u32[2];
            auto *positions = new float[3];
            u32 *actionState = new u32[1];
            itemIdName *itemIds;
            u16 *itemVariants;
            unsigned int *itemType = new unsigned int[1];
            bool sendItemType = false;
            int sizeOfItems = 0;

            actions[0] = fighter->getInput(fighter->getEntryIdFromIndex(0))->buttons.attack;
            actions[1] = fighter->getInput(fighter->getEntryIdFromIndex(0))->buttons.special;
            actions[2] = fighter->getInput(fighter->getEntryIdFromIndex(0))->buttons.jump;
            actions[3] = fighter->getInput(fighter->getEntryIdFromIndex(0))->buttons.shield;
            actions[4] = fighter->getInput(fighter->getEntryIdFromIndex(0))->buttons.dTaunt;
            actions[5] = fighter->getInput(fighter->getEntryIdFromIndex(0))->buttons.sTaunt;
            actions[6] = fighter->getInput(fighter->getEntryIdFromIndex(0))->buttons.uTaunt;
            actions[7] = fighter->getInput(fighter->getEntryIdFromIndex(0))->buttons.cStick;
            actions[8] = fighter->getInput(fighter->getEntryIdFromIndex(0))->buttons.tapJump;

            stick[0] = fighter->getInput(fighter->getEntryIdFromIndex(0))->leftStickX;
            stick[1] = fighter->getInput(fighter->getEntryIdFromIndex(0))->leftStickY;

            positions[0] = fighter->getFighter(fighter->getEntryIdFromIndex(0))->modules->postureModule->xPos;
            positions[1] = fighter->getFighter(fighter->getEntryIdFromIndex(0))->modules->postureModule->yPos * -1;
            positions[2] = fighter->getFighter(fighter->getEntryIdFromIndex(0))->modules->postureModule->zPos;

            actionState[0] = stageObject->action;
            sizeOfItems = ITEM_MANAGER->baseItemArrayList.size();

            if(sizeOfItems > 0) {
                itemIds = new itemIdName[sizeOfItems];
                itemVariants = new u16[sizeOfItems];
                for (int i = 0; i < sizeOfItems; i++) {
                    auto item = ITEM_MANAGER->baseItemArrayList.at(i);
                    itemIds[i] = (*item)->getItKind();
                    itemVariants[i] = (*item)->getItVariation();
                }
            }

            fighterInfo[0] = fighter->getFighter(fighter->getEntryIdFromIndex(0))->getOwner()->getDamage();

            gameInfo[0] = game->gameFrame->frameCounter;
            gameInfo[1] = game->gameFrame->persistentFrameCounter;

            EXIPacket gamePacket = EXIPacket(EXIStatus::GAME, gameInfo, 2 * sizeof(u32));
            gamePacket.Send();

            EXIPacket inputPacket = EXIPacket(EXIStatus::INPUTS, actions, 9 * sizeof(u8));
            inputPacket.Send();

            EXIPacket positionsPacket = EXIPacket(EXIStatus::POS, positions, 3 * sizeof(float));
            positionsPacket.Send();

            EXIPacket stickPacket = EXIPacket(EXIStatus::STICK, stick, 2 * sizeof(float));
            stickPacket.Send();

            EXIPacket actionStatePacket = EXIPacket(EXIStatus::ACTIONSTATE, actionState, 1 * sizeof(u32));
            actionStatePacket.Send();

            if(sizeOfItems > 0) {
                EXIPacket itemIdsPacket = EXIPacket(EXIStatus::ITEM_IDS, itemIds, sizeOfItems * sizeof(itemIdName));
                itemIdsPacket.Send();

                EXIPacket itemVarientsPacket = EXIPacket(EXIStatus::ITEM_VARIENTS, itemVariants, sizeOfItems * sizeof(u16));
                itemVarientsPacket.Send();
            }

            EXIPacket fighterPacket = EXIPacket(EXIStatus::FIGHTER, fighterInfo, 1 * sizeof(double));
            fighterPacket.Send();

            delete[] actions;
            delete[] fighterInfo;
            delete[] gameInfo;
            delete[] positions;
            delete[] stick;
            if(sizeOfItems > 0) {
                delete[] itemIds;
                delete[] itemVariants;
            }
            delete[] actionState;
            delete[] itemType;
        }
    }
    SIMPLE_INJECTION(startMatch, 0x800dc590, "li r9, 0x2") { StartMatch(); } // when exiting match
    SIMPLE_INJECTION(endMatch, 0x806d4844, "li r4, 0") { EndMatch(); } // when exiting match
    SIMPLE_INJECTION(beginFrame, 0x80147394, "li r0, 0x1") { BeginFrame(); }
}