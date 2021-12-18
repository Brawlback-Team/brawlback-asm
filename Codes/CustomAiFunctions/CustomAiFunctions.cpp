//
// Created by dareb on 7/30/2020.
//

#include <Brawl/AI/aiScriptData.h>
#include <Brawl/FT/ftManager.h>
#include <Brawl/IT/itManager.h>
#include <Wii/MATH.h>
#include <Containers/Vec3f.h>
#include <Containers/vector.h>
#include <Brawl/AI/aiMgr.h>
#include <Graphics/Drawable.h>
#include <Brawl/FT/ftCommonDataAccessor.h>
#include "Assembly.h"
#include "Brawl/FT/Fighter.h"
#include "Brawl/AI/aiStat.h"
#include "Brawl/Weapon.h"
#include "PatternManager.h"

#define OSReport ((void (*)(const char* text, ...)) 0x801d8600)

INJECTION("FORCE_AI_TAUNT_ROUTINE", 0x809112cc, R"(
    SAVE_REGS
    mr r3, r26
    bl forceAiTauntRoutine
    RESTORE_REGS
    lis r3, 0x8091
    ori r3, r3, 0x1464
    mtctr r3
    bctr
)");

#define change_md_aiInput ((void (*)(aiInput *aiInputInst,unsigned int newMode,unsigned char *param_3,unsigned int newOrOldAction,int param_5)) 0x809049d0)
extern "C" void forceAiTauntRoutine(aiInput *aiInputInst) {
    unsigned char dummy = 0xff;
    // setting it to md 0x1 will make it alternate between md 0x1 and md 0x14, and we don't want that.
    // therefor, we set it to 0x2 where this problem doesn't exist while still giving us control over
    // our scripts
    change_md_aiInput(aiInputInst, 0x2, &dummy, 0x2080, 0);
};


// because fu**ck hardcoded inputs :)
INJECTION("mdThreeFix", 0x80909b98, R"(
    nop
)");

// FORCED_JUMP_FIX
STRING_WRITE(0x809028dc, "\x60\x00\x00\x00");
// FORCED_JUMP_FIX2
STRING_WRITE(0x8090272c, "\x60\x00\x00\x00");
// FORCED_JUMP_FIX3
STRING_WRITE(0x80902110, "\x60\x00\x00\x00");
// // FORCED_JUMP_FIX4// 
// STRING_WRITE(0x80902f9c, "\x60\x00\x00\x00");
// FORCED_JUMP_FIX4
STRING_WRITE(0x80901db0, "\x60\x00\x00\x00");
// FORCED_JUMP_FIX5
STRING_WRITE(0x809019cc, "\x60\x00\x00\x00");
// FORCED_JUMP_FIX6
STRING_WRITE(0x80901a1c, "\x60\x00\x00\x00");
// FORCED_JUMP_FIX7// 
STRING_WRITE(0x809025ec, "\x60\x00\x00\x00");
// FORCED_JUMP_FIX8// 
STRING_WRITE(0x80902610, "\x60\x00\x00\x00");

// FORCED_AIRDODGE_FIX
STRING_WRITE(0x80902f9c, "\x60\x00\x00\x00");

// FORCED_INPUT_FIX1
STRING_WRITE(0x808fe93c, "\x60\x00\x00\x00");
// FORCED_INPUT_FIX2
STRING_WRITE(0x808ff77c, "\x60\x00\x00\x00");
// FORCED_INPUT_FIX3
STRING_WRITE(0x809017dc, "\x60\x00\x00\x00");
// FORCED_INPUT_FIX4
STRING_WRITE(0x80901940, "\x60\x00\x00\x00");
// FORCED_INPUT_FIX5
STRING_WRITE(0x80902710, "\x60\x00\x00\x00");
// FORCED_INPUT_FIX6
STRING_WRITE(0x80902674, "\x60\x00\x00\x00");
// FORCED_INPUT_FIX7
STRING_WRITE(0x80902280, "\x60\x00\x00\x00");
// FORCED_INPUT_FIX8
STRING_WRITE(0x809021dc, "\x60\x00\x00\x00");
// FORCED_INPUT_FIX9
STRING_WRITE(0x80902428, "\x60\x00\x00\x00");
// FORCED_INPUT_FIX10
STRING_WRITE(0x80902364, "\x60\x00\x00\x00");
// FORCED_INPUT_FIX11
STRING_WRITE(0x8090293c, "\x60\x00\x00\x00");
// FORCED_INPUT_FIX12
STRING_WRITE(0x80902e38, "\x60\x00\x00\x00");
// FORCED_INPUT_FIX13
STRING_WRITE(0x80902f0c, "\x60\x00\x00\x00");
// FORCED_INPUT_FIX14
STRING_WRITE(0x80902cb0, "\x60\x00\x00\x00");
// FORCED_INPUT_FIX15
STRING_WRITE(0x80902ba0, "\x60\x00\x00\x00");
// FORCED_INPUT_FIX16
STRING_WRITE(0x80902c50, "\x60\x00\x00\x00");
// FORCED_INPUT_FIX17
STRING_WRITE(0x80902bf8, "\x60\x00\x00\x00");
// FORCED_INPUT_FIX18
STRING_WRITE(0x80902d80, "\x60\x00\x00\x00");
// FORCED_INPUT_FIX19
STRING_WRITE(0x80902d58, "\x60\x00\x00\x00");
// FORCED_INPUT_FIX20
STRING_WRITE(0x80902f7c, "\x60\x00\x00\x00");
// FORCED_INPUT_FIX21
STRING_WRITE(0x80903018, "\x60\x00\x00\x00");


signed char disabledMd[4] = {-1, -1, -1, -1};
INJECTION("CPUForceMd", 0x80905204, R"(
    SAVE_REGS
    mr r3, r26
    mr r4, r27
    mr r5, r28
    bl CPUForceMd
    RESTORE_REGS
)");

extern "C" void CPUForceMd(aiInput * aiInput, unsigned int intent, int newAction) {
    OSReport("-- MD CHANGE --\n");
    OSReport("current action: %04x; ", aiInput->aiActPtr->aiScript);
    OSReport("new action?: %04x;\n", newAction);
    OSReport("current md: %02x; ", aiInput->aiMd);
    OSReport("new md: %02x\n", intent);

    // OSReport("DISABLED MD: %02x, INTENT: %02x", disabledMd[FIGHTER_MANAGER->getPlayerNo(aiInput->ftEntryPtr->entryId)], intent);
    if (intent <= 0xFFFF && intent != disabledMd[FIGHTER_MANAGER->getPlayerNo(aiInput->ftEntryPtr->entryId)]) {
        aiInput->aiMd = intent;
    }
}

bool autoDefend[4] = {true, true, true, true};
INJECTION("PREVENT_AUTO_DEFEND", 0x80900c60, "bl preventAutoDefend");

extern "C" void preventAutoDefend(aiInput *aiInputInst,unsigned int newMode,unsigned char *param_3,unsigned int newOrOldAction,int param_5) {
    if (autoDefend[FIGHTER_MANAGER->getPlayerNo(aiInputInst->ftEntryPtr->entryId)] || newOrOldAction == 0x30E0) {
        change_md_aiInput(aiInputInst, newMode, param_3, newOrOldAction, param_5);
    }
    return;
}

INJECTION("PREVENT_MD_CHANGE_ACT", 0x809051e0, R"(
    cmpwi r27, 0x6
    beq PREVENTED_1
    cmpwi r27, 0x7
    beq PREVENTED_1
    cmpwi r27, 0x15
    beq PREVENTED_1
    lis r12, 0x8091
    ori r12, r12, 0x8554
    mtctr r12
    bctrl

PREVENTED_1:
)");
INJECTION("PREVENT_MD_CHANGE_ACT", 0x80905248, R"(
    cmpwi r27, 0x6
    beq PREVENTED_2
    cmpwi r27, 0x7
    beq PREVENTED_2
    cmpwi r27, 0x15
    beq PREVENTED_2
    lis r12, 0x8091
    ori r12, r12, 0x8554
    mtctr r12
    bctrl

PREVENTED_2:
)");


// INJECTION("mdThreeFixTwoElectricBugaloo", 0x809013f8, R"(
//     nop
// )");

// fuck this one in particular
// because it caused me 4 hours of agony for no payoff
// INJECTION("mxThreeFixTheThird", 0x8090137c, R"(
//     nop
// )");

INJECTION("CUSTOM_AI_FUNCTIONS", 0x8091e104, R"(
    SAVE_REGS
    mr r4, r31
    mr r5, r30
    mr r6, r1
    mr r7, r2
    fmr f1, f10
    bl aiFunctionHandlers
    RESTORE_REGS
    bl outputAiFunctionResult
    cmpwi r12, 0
    beq _CUSTOM_AI_FUNCTIONS_CONTINUE
    lis r12, 0x8091
    ori r12, r12, 0xE440
    mtctr r12
    bctr

_CUSTOM_AI_FUNCTIONS_CONTINUE:
    subi r0,r31,0x1000
)" );

int fn_shouldReturnResult = 0;
extern float ai_customFnInjection[0x10];
extern bool ai_customFnInjectionToggle[0x10];

PatternManager rpsManagers[0x10] = {
    PatternManager(),
    PatternManager(),
    PatternManager(),
    PatternManager(),
    PatternManager(),
    PatternManager(),
    PatternManager(),
    PatternManager(),
    PatternManager(),
    PatternManager(),
    PatternManager(),
    PatternManager(),
    PatternManager(),
    PatternManager(),
    PatternManager(),
    PatternManager()
};

// vector<char> viableMoveList[4] = {
//     vector<char>(),
//     vector<char>(),
//     vector<char>(),
//     vector<char>()
// };

SIMPLE_INJECTION(clearPredictions, 0x800dc590, "li r9, 2") {
    for (int i = 0; i < 0xF; i++) {
        rpsManagers[i].clearAll();
    }
}

extern "C" {
    double fn_result = 0;
    void aiFunctionHandlers(float unk_f10, aiStat* targetAiStat, unsigned int switchCase, aiScriptData* selfAi, u32 sp, u32 rtoc) {
        fn_shouldReturnResult = 0;

        // if (((switchCase - 0x1000) & 0xFF) == 0xFF) {
        //     fn_result = md_customFnInjection;
        //     fn_shouldReturnResult = 1;
        //     return;
        // }

        ftEntry * targetFighterEntry;
        bool shouldGetAiTarget = (switchCase & 0x0100) >> 8;
        if (shouldGetAiTarget) {
            switchCase -= 0x100;
            targetFighterEntry = targetAiStat->input->ftEntryPtr;
        } else {
            targetFighterEntry = selfAi->ftInputPtr->ftEntryPtr;
        }

        switchCase -= 0x1000;
        if (switchCase == 0x4C) { // IsOnStage
            fn_shouldReturnResult = 1;
            Vec3f targetPos {
                    targetFighterEntry->ftStageObject->modules->groundModule->unk1->unk1->unk1->landingCollisionBottomXPos + (float) 0.1,
                    targetFighterEntry->ftStageObject->modules->postureModule->yPos,
                    targetFighterEntry->ftStageObject->modules->postureModule->zPos
            };

            targetFighterEntry->ftStageObject->modules->groundModule->getDistanceFromUnderGrCol(
                    150,
                    &targetPos,
                    true
            );

            asm("stfd f1, 0x00(%0)"
            :
            : "r" (&fn_result));
            if (fn_result != -1) {
                fn_result = 1;
                return;
            }

            targetPos.f1 -= 0.2;
            targetFighterEntry->ftStageObject->modules->groundModule->getDistanceFromUnderGrCol(
                    150,
                    &targetPos,
                    true
            );
            asm("stfd f1, 0x00(%0)"
            :
            : "r" (&fn_result));
            if (fn_result != -1) {
                fn_result = 1;
                return;
            }

            fn_result = 0;
            return;
        }

        if (switchCase == 0x4B) {
            Vec3f targetPos {
                    targetFighterEntry->ftStageObject->modules->groundModule->unk1->unk1->unk1->landingCollisionBottomXPos,
                    targetFighterEntry->ftStageObject->modules->postureModule->yPos,
                    targetFighterEntry->ftStageObject->modules->postureModule->zPos
            };

            targetFighterEntry->ftStageObject->modules->groundModule->getDistanceFromUnderGrCol(
                    150,
                    &targetPos,
                    true
            );
            asm("stfd f1, 0x00(%0)"
                :
                : "r" (&fn_result));
            fn_shouldReturnResult = 1;
        }
        if (switchCase == 0x51) {
            fn_result = FIGHTER_MANAGER->getInput(targetFighterEntry->entryId)->aiMd;
            fn_shouldReturnResult = 1;
        }
        if (switchCase == 0x52) {
            auto entryID = targetFighterEntry->entryId;
            fn_result = entryID & 0x0000FFFF;
            fn_shouldReturnResult = 1;
        }
        if (switchCase == 0x53) {
            fn_result = 0;
//            OSReport("move id: %08x\n", targetFighterEntry->owner->ownerDataPtr->currStaleQueueNum);
            for (int i = 0; i < 9; i++) {
//                OSReport("i: %d; moveNum: %08x\n", i, targetFighterEntry->owner->ownerDataPtr->staleMoveQueue[i].attack);
                if (targetFighterEntry->owner->ownerDataPtr->staleMoveQueue[i].attack == targetFighterEntry->owner->ownerDataPtr->currStaleQueueNum) {
                    fn_result++;
                }
            }
            fn_shouldReturnResult = 1;
        }
        if (switchCase == 0x54) {
            fn_result = targetFighterEntry->ftStageObject->modules->groundModule->isPassableGround(0);
            fn_shouldReturnResult = 1;
        }

        if (switchCase == 0x55) {
//            OSReport("ftEntry Address: %08x\n", targetFighterEntry);
//            OSReport("ftSo Address: %08x\n", targetFighterEntry->ftStageObject);
//            OSReport("UnkFtPtr Address: %08x\n", targetFighterEntry->ftStageObject->modFnAccessor);
//            OSReport("Supposed cancelModule address: %08x\n", targetFighterEntry->ftStageObject->modFnAccessor->getFtCancelModule(targetFighterEntry->ftStageObject));
            fn_result = targetFighterEntry
                    ->ftStageObject
                    ->getCancelModule()
                    ->isEnableCancel();

            fn_shouldReturnResult = 1;
        }

        // weight
        if (switchCase == 0x56) {
            fn_result = targetFighterEntry->ftStageObject->modules->paramCustomizeModule->weight;
            fn_shouldReturnResult = 1;
        }
        // gravity
        if (switchCase == 0x57) {
            fn_result = targetFighterEntry->ftStageObject->modules->paramCustomizeModule->gravity;
            fn_shouldReturnResult = 1;
        }
        // fastfallspeed
        if (switchCase == 0x58) {
            fn_result = targetFighterEntry->ftStageObject->modules->paramCustomizeModule->fastFallSpeed;
            fn_shouldReturnResult = 1;
        }
        // endframe
        if (switchCase == 0x59) {
            fn_result = targetFighterEntry->ftStageObject->modules->motionModule->getEndFrame();
            fn_shouldReturnResult = 1;
        }

        if (switchCase == 0x60) {
            fn_result = FIGHTER_MANAGER->getPlayerNo(selfAi->ftInputPtr->ftEntryPtr->entryId)
        }
    };
    void outputAiFunctionResult() {
        asm(R"(
            lfd f1, 0x00(%0)
            mr 12, %1
        )"
        :
        : "r" (&fn_result), "r" (fn_shouldReturnResult));
    };
}

int gotoCmdStack[5] = {0, 0, 0, 0, 0}; 
int gotoCmdStackPtr = 0;
INJECTION("AI_GOTO_WITH_STACK_PUSH", 0x80917620, R"(
    SAVE_REGS
    mr r3, r30
    bl aiGotoPush
    RESTORE_REGS
    mr r29, r30
)");
INJECTION("AI_GOTO_WITH_STACK_POP", 0x809174c4, R"(
    bl aiGotoPop
    mr r29, r3
    mr r30, r29
)");
INJECTION("AI_GOTO_WITH_STACK_FIX1", 0x80917548, R"(
    bl clearGotoStack
    lhz r0, 0x2(r30)
)");
INJECTION("AI_GOTO_WITH_STACK_FIX2", 0x80917470, R"(
    bl clearGotoStack
    lhz r0, 0x7e(r26)
)");
INJECTION("AI_GOTO_WITH_STACK_FIX3", 0x80917604, R"(
    bl clearGotoStack
    stw r6, 0xa8(r26)
)");
INJECTION("AI_GOTO_WITH_STACK_FIX4", 0x80917c34, R"(
    bl clearGotoStack
    lbz r0,0x1(r30)
)");
INJECTION("AI_GOTO_WITH_STACK_FIX5", 0x80918148, R"(
    bl clearGotoStack
    lhz r4,0x7a(r26)
)");

extern "C" {
    void aiGotoPush(int nextPlace) {
        gotoCmdStack[gotoCmdStackPtr] = nextPlace;
        gotoCmdStackPtr += 1;
    };
    int aiGotoPop() {
        if (gotoCmdStackPtr > 0) {
            gotoCmdStackPtr -= 1;
            return gotoCmdStack[gotoCmdStackPtr];
        }
        return 0;
    };
    void clearGotoStack() {
        gotoCmdStackPtr = 0;
    };
}

INJECTION("CUSTOM_AI_COMMANDS", 0x80917450, R"(
    lbz r4, 0x00(r30)
    SAVE_REGS
    mr r3, r26
    mr r4, r30
    mr r5, r28
    bl aiCommandHandlers
    RESTORE_REGS
)");

#define _get_script_value_aiScriptData ((double (*)(aiScriptData * self, int soughtValue, int isPartOfVector)) 0x8091dfc4)
#define _getButtonMask_soController ((unsigned int (*)(int btn)) 0x8076544c)
#define _randf ((double (*)()) 0x8003fb64)
extern "C" {
    void aiCommandHandlers(aiScriptData* aiActInst, const int* args, unsigned int* buttons) {
        int cmd = (args[0] & 0xFF000000) >> 24;
        if (cmd < 0x35) return;
        if (cmd <= 0x3A) {
            int varToMod = args[1];
            double index = _get_script_value_aiScriptData(aiActInst, *(int *) &args[2], 0);
            bool shouldGetTarget = _get_script_value_aiScriptData(aiActInst, *(int *) &args[3], 0);

            soWorkManageModuleImpl* targetWorkModule;
            if (shouldGetTarget) {
                auto targetPlayerNum = AI_MANAGER->getAiCpuTarget(FIGHTER_MANAGER->getPlayerNo(aiActInst->ftInputPtr->fighterId));
                Fighter* target = FIGHTER_MANAGER->getFighter(FIGHTER_MANAGER->getEntryId(targetPlayerNum));
                if (target == nullptr) return;
                targetWorkModule = target->modules->workModule;
            } else {
                targetWorkModule = FIGHTER_MANAGER->getFighter(aiActInst->ftInputPtr->fighterId)->modules->workModule;
            }

            switch (cmd) {
                case 0x35:
                    aiActInst->variables[varToMod] = (float) (*(bool (*)[targetWorkModule->RAVariables->bitsSize]) (targetWorkModule->RAVariables->bitVariables))[(int) index];
                    return;
                case 0x36:
                    aiActInst->variables[varToMod] = (float) (*(int (*)[targetWorkModule->RAVariables->basicsSize]) (targetWorkModule->RAVariables->basics))[(int) index];
                    return;
                case 0x37:
                    aiActInst->variables[varToMod] = (float) (*(int (*)[targetWorkModule->RAVariables->floatsSize]) (targetWorkModule->RAVariables->floats))[(int) index];
                    return;
                case 0x38:
                    aiActInst->variables[varToMod] = (float) (*(bool (*)[targetWorkModule->LAVariables->bitsSize]) (targetWorkModule->LAVariables->bitVariables))[(int) index];
                    return;
                case 0x39:
                    aiActInst->variables[varToMod] = (float) (*(int (*)[targetWorkModule->LAVariables->basicsSize]) (targetWorkModule->LAVariables->basics))[(int) index];
                    return;
                case 0x3A:
                    aiActInst->variables[varToMod] = (float) (*(int (*)[targetWorkModule->LAVariables->floatsSize]) (targetWorkModule->LAVariables->floats))[(int) index];
                    return;
            }
        }

        // YDistFloor at Offset
        if (cmd == 0x3B) {
            int varToMod = args[1];
            double xOffset = _get_script_value_aiScriptData(aiActInst, *(int *) &args[2], 0);
            double yOffset = _get_script_value_aiScriptData(aiActInst, *(int *) &args[3], 0);
            bool shouldGetTarget = _get_script_value_aiScriptData(aiActInst, *(int *) &args[4], 0);

            soGroundModuleImpl* targetGroundModule;
            if (shouldGetTarget) {
                auto targetPlayerNum = AI_MANAGER->getAiCpuTarget(FIGHTER_MANAGER->getPlayerNo(aiActInst->ftInputPtr->fighterId));
                Fighter* target = FIGHTER_MANAGER->getFighter(FIGHTER_MANAGER->getEntryId(targetPlayerNum));
                if (target == nullptr) return;
                targetGroundModule = target->modules->groundModule;
            } else {
                targetGroundModule = FIGHTER_MANAGER->getFighter(aiActInst->ftInputPtr->fighterId)->modules->groundModule;
            }

            double res;

            Vec3f targetPos {
                    targetGroundModule->unk1->unk1->unk1->landingCollisionBottomXPos + (float) xOffset,
                    targetGroundModule->unk1->unk1->unk1->landingCollisionBottomYPos + (float) yOffset,
                    0
            };

            targetGroundModule->getDistanceFromUnderGrCol(
                    150,
                    &targetPos,
                    true
            );

            asm("stfd f1, 0x00(%0)"
            :
            : "r" (&res));
            aiActInst->variables[varToMod] = (float) res;
            return;
        }

        // staleMoveFrequency
        // maybe i'll come back to this at some point? seems kinda unnecessary...
//        if (cmd == 0x3D) {
//            int varToMod = args[1];
//            int actionToFind = _get_script_value_aiAct(aiActInst, *(int *) &args[2], 0);
//            bool shouldGetTarget = _get_script_value_aiAct(aiActInst, *(int *) &args[3], 0);
//
//            int targetFighterId;
//            staleMoveEntry* targetStaleQueue;
//            if (shouldGetTarget) {
//                auto targetPlayerNum = AI_MANAGER->getAiCpuTarget(FIGHTER_MANAGER->getPlayerNo(aiActInst->ftInputPtr->fighterId));
//                Fighter* target = FIGHTER_MANAGER->getFighter(FIGHTER_MANAGER->getEntryId(targetPlayerNum));
//                if (target == nullptr) return;
//                targetFighterId = target->ftKind;
//                targetStaleQueue = target->staleMoveQueue;
//            } else {
//                Fighter * target = FIGHTER_MANAGER->getFighter(aiActInst->ftInputPtr->fighterId, 0);
//                targetFighterId = target->ftKind;
//                targetStaleQueue = target->staleMoveQueue;
//            }
//
//            unsigned int valueToFind = *FIGHTER_COMMON_DATA_ACCESSOR->getFtStatusData(targetFighterId, actionToFind);
//            if (valueToFind & 0xff == 0x40) {
//                switch (actionToFind) {
//                    case 0x76:
//                        valueToFind =
//                }
//            } else {
//                valueToFind = valueToFind >> 10 & 0xff;
//
//            }
//
//            // 80fb2f0c
//
//            // 8128ba7c -- queue
//            // 805b4a90 -- locals where stuff is loaded
//            // 91ab6d20 -> 20000040 (fAir part 1)
//            // 91ab6be8 -> 14000001 (fAir part 2)
//        }

        // isTeammateCloser
        if (cmd == 0x3E) {
            int varToMod = args[1];

            aiActInst->variables[varToMod] = 0;
            Fighter* target = FIGHTER_MANAGER->getFighter(FIGHTER_MANAGER->getEntryId(aiActInst->ftInputPtr->aiTarget));
//            OSReport("(myRes, mgrRes): (%08x, %08x)\n", aiActInst->ftInputPtr->aiTarget);
            int targetXPos = target->modules->postureModule->xPos;

            auto entryCount = FIGHTER_MANAGER->getEntryCount();
            for (int i = 0; i < entryCount; i++) {
                auto id = FIGHTER_MANAGER->getEntryIdFromIndex(i);
                ftOwner* fighterOwner = FIGHTER_MANAGER->getOwner(id);
//                OSReport("(self team, t team): (%08x, %08x)\n", fighterOwner->ftInputPtr->ftEntryPtr->team, aiActInst->ftInputPtr->ftEntryPtr->team);
                if (id != aiActInst->ftInputPtr->fighterId
                    && fighterOwner->ownerDataPtr->team == aiActInst->ftInputPtr->ftEntryPtr->owner->ownerDataPtr->team
                    && !(FIGHTER_MANAGER->getFighter(id)->modules->statusModule->action >= 0x3E
                    && FIGHTER_MANAGER->getFighter(id)->modules->statusModule->action <= 0x48)) {
                    auto xDiffTeammate = FIGHTER_MANAGER->getFighter(id)->modules->postureModule->xPos - targetXPos;
                    auto xDiffSelf = aiActInst->ftInputPtr->ftEntryPtr->ftStageObject->modules->postureModule->xPos - targetXPos;
                    auto xDiffSelfAbs = (xDiffSelf < 0) ? xDiffSelf * -1 : xDiffSelf;
                    auto xDiffTeammateAbs = (xDiffTeammate < 0) ? xDiffTeammate * -1 : xDiffTeammate;
                    if ((xDiffTeammate > 0 && xDiffSelf > 0 && xDiffTeammate < xDiffSelf)
                        || (xDiffTeammate < 0 && xDiffSelf < 0 && xDiffTeammate > xDiffSelf)
                        || (xDiffTeammateAbs < xDiffSelfAbs && xDiffSelfAbs - xDiffTeammateAbs <= 30)) {
                        aiActInst->variables[varToMod] = 1;
                        break;
                    }
                }
            }
            return;
        }

            // Taunt command
        if (cmd == 0x40) {
            int tauntInput = _get_script_value_aiScriptData(aiActInst, *(int *) &args[1], 0);
            switch (tauntInput) {
                case 1:
                    *buttons |= _getButtonMask_soController(6); // utaunt
                    break;
                case 2:
                    *buttons |= _getButtonMask_soController(8); // staunt
                    break;
                case 3:
                    *buttons |= _getButtonMask_soController(7); // dtaunt
                    break;
            }
            return;
        }

        if (cmd == 0x41) {
            int newMode = _get_script_value_aiScriptData(aiActInst, *(int *) &args[1], 0);
            int newScript = _get_script_value_aiScriptData(aiActInst, *(int *) &args[2], 0);

            unsigned char dummy = 0xff;
            change_md_aiInput(aiActInst->ftInputPtr, newMode, &dummy, newScript, 0);
            return;
        }

        // SwitchTarget
        if (cmd == 0x42) {
            auto entryCount = FIGHTER_MANAGER->getEntryCount();
            int newTargetId;
            for (int i = 0; i < entryCount; i++) {
                newTargetId = FIGHTER_MANAGER->getEntryIdFromIndex(i);
                if (FIGHTER_MANAGER->getOwner(newTargetId)->ownerDataPtr->team != aiActInst->ftInputPtr->ftEntryPtr->owner->ownerDataPtr->team) {
                    break;
                }
            }
            aiActInst->ftInputPtr->aiTarget = FIGHTER_MANAGER->getPlayerNo(newTargetId);
            return;
        }

        // Knockback Calculation
        #define _floor ((float (*)(float value)) 0x804005ac)
        if (cmd == 0x43) {
            int varToMod = args[1];
            float damage = _get_script_value_aiScriptData(aiActInst, *(int *) &args[2], 0);
            float atkDamage = _get_script_value_aiScriptData(aiActInst, *(int *) &args[3], 0);
            float bkb = _get_script_value_aiScriptData(aiActInst, *(int *) &args[4], 0);
            float kbg = _get_script_value_aiScriptData(aiActInst, *(int *) &args[5], 0);
            float weight = _get_script_value_aiScriptData(aiActInst, *(int *) &args[6], 0);
            int isWeightDependent = _get_script_value_aiScriptData(aiActInst, *(int *) &args[7], 0);

            if (isWeightDependent == 1) {
                damage = 0;
                atkDamage = 0;
            }
            aiActInst->variables[varToMod] = (kbg / 100) * (1.4 * (((atkDamage + 2) * ((atkDamage - atkDamage * 0.2) + _floor(damage)))/20) * (2 - ((2 * weight) / (weight + 1))) + 18) + bkb;
            return;
        }

        // Calc Y Change
        if (cmd == 0x44) {
            int varToMod = args[1];
            int frameCount = _get_script_value_aiScriptData(aiActInst, *(int *) &args[2], 0);
            float ySpeed = _get_script_value_aiScriptData(aiActInst, *(int *) &args[3], 0);
            float gravity = _get_script_value_aiScriptData(aiActInst, *(int *) &args[4], 0);
            float maxFallSpeed = _get_script_value_aiScriptData(aiActInst, *(int *) &args[5], 0);
            float fastFallSpeed = _get_script_value_aiScriptData(aiActInst, *(int *) &args[6], 0);
            bool fastFallImmediate = _get_script_value_aiScriptData(aiActInst, *(int *) &args[7], 0);
            
            float accumulator = 0;
            float tracker = ySpeed;
            for (int i = 0; i < frameCount; i++) {
                accumulator += tracker;
                tracker += gravity;
                if (tracker > fastFallSpeed || (tracker >= 0 && fastFallImmediate)) tracker = fastFallSpeed;
                else if (tracker > maxFallSpeed) tracker = maxFallSpeed;
            }

            aiActInst->variables[varToMod] = accumulator;
        }
        // prevent auto defend
        if (cmd == 0x45) {
            bool onOff = _get_script_value_aiScriptData(aiActInst, *(int *) &args[1], 0);
            autoDefend[FIGHTER_MANAGER->getPlayerNo(aiActInst->ftInputPtr->ftEntryPtr->entryId)] = onOff;
            return;
        }
        // disable md
        if (cmd == 0x46) {
            int mdValue = _get_script_value_aiScriptData(aiActInst, *(int *) &args[1], 0);
            disabledMd[FIGHTER_MANAGER->getPlayerNo(aiActInst->ftInputPtr->ftEntryPtr->entryId)] = mdValue;
            return;
        }
        // getDynamicAtkData
        if (cmd == 0x47) {
            int unkVar = args[1];
            int startVar = args[2];
            int endVar = args[3];
            int xMinVar = args[4];
            int xMaxVar = args[5];
            int yMinVar = args[6];
            int yMaxVar = args[7];
            int subaction = _get_script_value_aiScriptData(aiActInst, *(int *) &args[8], 0);
            bool shouldGetOpponent = _get_script_value_aiScriptData(aiActInst, *(int *) &args[9], 0);

            aiParam targetAIParam;
            if (shouldGetOpponent) {
                targetAIParam = FIGHTER_MANAGER->getOwner(FIGHTER_MANAGER->getEntryId(aiActInst->ftInputPtr->aiTarget))->ftInputPtr->aiParamPtr;
            } else {
                targetAIParam = aiActInst->ftInputPtr->aiParamPtr;
            }
            ATKDContent* data = targetAIParam.searchAtkData(subaction);
            if (data == nullptr) {
                aiActInst->variables[unkVar] = -1;
                return;
            }

            aiActInst->variables[unkVar] = data->unk;
            aiActInst->variables[startVar] = data->start;
            aiActInst->variables[endVar] = data->end;
            aiActInst->variables[xMinVar] = data->xmin;
            aiActInst->variables[xMaxVar] = data->xmax;
            aiActInst->variables[yMinVar] = data->ymin;
            aiActInst->variables[yMaxVar] = data->ymax;
            return;
        }

        // Push to Trackers
        if (cmd == 0x50) {
            int managerNum = _get_script_value_aiScriptData(aiActInst, *(int *) &args[1], 0);
            rpsManagers[managerNum].pushNew(FIGHTER_MANAGER->getPlayerNo(aiActInst->ftInputPtr->ftEntryPtr->entryId), (int) _get_script_value_aiScriptData(aiActInst, *(int *) &args[2], 0));
            return;
        }
        // calcOption
        if (cmd == 0x51) {
            int varToMod = args[1];
            int managerNum = _get_script_value_aiScriptData(aiActInst, *(int *) &args[2], 0);
            int lookAmount = _get_script_value_aiScriptData(aiActInst, *(int *) &args[3], 0) / 20;
            aiActInst->variables[varToMod] = rpsManagers[managerNum].calcOption(FIGHTER_MANAGER->getPlayerNo(aiActInst->ftInputPtr->ftEntryPtr->entryId), lookAmount);
            return;
        }
        // calcOptionConfidence
        if (cmd == 0x52) {
            int varToMod = args[1];
            int managerNum = _get_script_value_aiScriptData(aiActInst, *(int *) &args[2], 0);
            int lookAmount = _get_script_value_aiScriptData(aiActInst, *(int *) &args[3], 0) / 20;
            aiActInst->variables[varToMod] = rpsManagers[managerNum].calcOptionConfidence(FIGHTER_MANAGER->getPlayerNo(aiActInst->ftInputPtr->ftEntryPtr->entryId), lookAmount);
            return;
        }
        // calcAverage
        if (cmd == 0x53) {
            int varToMod = args[1];
            int managerNum = _get_script_value_aiScriptData(aiActInst, *(int *) &args[2], 0);
            int lookAmount = _get_script_value_aiScriptData(aiActInst, *(int *) &args[3], 0) / 20;
            aiActInst->variables[varToMod] = rpsManagers[managerNum].average(FIGHTER_MANAGER->getPlayerNo(aiActInst->ftInputPtr->ftEntryPtr->entryId), lookAmount);
            return;
        }
        // increment
        if (cmd == 0x54) {
            int managerNum = _get_script_value_aiScriptData(aiActInst, *(int *) &args[1], 0);
            rpsManagers[managerNum].plusOne(FIGHTER_MANAGER->getPlayerNo(aiActInst->ftInputPtr->ftEntryPtr->entryId));
            return;
        }
        // getCurrent
        if (cmd == 0x55) {
            int varToMod = args[1];
            int managerNum = _get_script_value_aiScriptData(aiActInst, *(int *) &args[2], 0);
            aiActInst->variables[varToMod] = rpsManagers[managerNum].get(FIGHTER_MANAGER->getPlayerNo(aiActInst->ftInputPtr->ftEntryPtr->entryId));
            return;
        }

        // boolean OR
        if (cmd == 0x60) {
            int varToMod = args[1];
            int op1 = _get_script_value_aiScriptData(aiActInst, *(int *) &args[2], 0);
            int op2 = _get_script_value_aiScriptData(aiActInst, *(int *) &args[3], 0);
            aiActInst->variables[varToMod] = op1 | op2; 
            return;
        }
        // boolean AND
        if (cmd == 0x61) {
            int varToMod = args[1];
            int op1 = _get_script_value_aiScriptData(aiActInst, *(int *) &args[2], 0);
            int op2 = _get_script_value_aiScriptData(aiActInst, *(int *) &args[3], 0);
            aiActInst->variables[varToMod] = op1 & op2; 
            return;
        }
        // bit shift left <<
        if (cmd == 0x62) {
            int varToMod = args[1];
            int op1 = _get_script_value_aiScriptData(aiActInst, *(int *) &args[2], 0);
            int op2 = _get_script_value_aiScriptData(aiActInst, *(int *) &args[3], 0);
            aiActInst->variables[varToMod] = op1 << op2; 
            return;
        }
        // bit shift right >>
        if (cmd == 0x63) {
            int varToMod = args[1];
            int op1 = _get_script_value_aiScriptData(aiActInst, *(int *) &args[2], 0);
            int op2 = _get_script_value_aiScriptData(aiActInst, *(int *) &args[3], 0);
            aiActInst->variables[varToMod] = op1 >> op2; 
            return;
        }
        // modulo %
        if (cmd == 0x64) {
            int varToMod = args[1];
            int op1 = _get_script_value_aiScriptData(aiActInst, *(int *) &args[2], 0);
            int op2 = _get_script_value_aiScriptData(aiActInst, *(int *) &args[3], 0);
            aiActInst->variables[varToMod] = op1 % op2; 
            return;
        }
        // approximate cosine
        #define math_cos ((double (*)(double param1)) 0x804004d8)
        #define math_rad (*(float *) 0x805a4ad8)
        if (cmd == 0x65) {
            int varToMod = args[1];
            float angleValue = _get_script_value_aiScriptData(aiActInst, *(int *) &args[2], 0);
            aiActInst->variables[varToMod] = math_cos(angleValue * math_rad);
            return;
        }
        // approximate sine
        #define math_sin ((double (*)(double param1)) 0x804009e0)
        if (cmd == 0x66) {
            int varToMod = args[1];
            float angleValue = _get_script_value_aiScriptData(aiActInst, *(int *) &args[2], 0);            
            aiActInst->variables[varToMod] = math_sin(angleValue * math_rad);
            return;
        }

        // item stuff
        if (cmd == 0x70) {
            int xPosDest = args[1];
            int yPosDest = args[2];
            int itemIndex = _get_script_value_aiScriptData(aiActInst, *(int *) &args[3], 0);
            BaseItem * it = ITEM_MANAGER->getItemFromIndex(itemIndex);
            if (it == nullptr) {
                aiActInst->variables[xPosDest] = 0;
                aiActInst->variables[yPosDest] = 0;
                return;
            }
            aiActInst->variables[xPosDest] = it->modules->postureModule->xPos;
            aiActInst->variables[yPosDest] = it->modules->postureModule->yPos;
            return;
        }
        if (cmd == 0x71) {
            int xPosDest = args[1];
            int yPosDest = args[2];
            int articleKind = _get_script_value_aiScriptData(aiActInst, *(int *) &args[3], 0);
            bool shouldGetTarget = _get_script_value_aiScriptData(aiActInst, *(int *) &args[4], 0);

            Fighter * target;
            if (shouldGetTarget) {
                auto targetPlayerNum = AI_MANAGER->getAiCpuTarget(FIGHTER_MANAGER->getPlayerNo(aiActInst->ftInputPtr->fighterId));
                target = FIGHTER_MANAGER->getFighter(FIGHTER_MANAGER->getEntryId(targetPlayerNum));
                if (target == nullptr) {
                    aiActInst->variables[xPosDest] = 0;
                    aiActInst->variables[yPosDest] = 0;
                    return;
                }
            } else {
                target = aiActInst->ftInputPtr->ftEntryPtr->ftStageObject;
            }
            Weapon* article = target->modules->generateArticleManageModule->getArticle(articleKind);

            if (article == nullptr) {
                aiActInst->variables[xPosDest] = 0;
                aiActInst->variables[yPosDest] = 0;
                return;
            }

            OSReport("article: %08x\n", article);
            // 812865ac | 812865ac

            // 81286524 | 81286524
            asm(R"(
                mr r3, %1
                li r4, 0
                lwz r5, 0(r3)
                lwz r5, 0(r5)
                lis r6, 0x80AE
                ori r6, r6, 0xB7D8
                li r7, 1
                lis r12, 0x803f
                ori r12, r12, 0x0f44
                mtctr r12
                bctrl
                mr %0, r3
            )"
            : "=r" (article)
            : "r" (article));

            // OSReport("article address: %08x\n", &article);
            // OSReport("article: %08x\n", article);
            // OSReport("article module addr: %08x\n", article->modules);
            // OSReport("article module posture addr: %08x\n", article->modules->groundModule);
            // OSReport("article module posture xpos addr: %08x\n", article->modules->groundModule->unk1->unk1->unk1->landingCollisionBottomXPos);
        

            aiActInst->variables[xPosDest] = article->modules->groundModule->unk1->unk1->unk1->landingCollisionBottomXPos;
            aiActInst->variables[yPosDest] = article->modules->groundModule->unk1->unk1->unk1->landingCollisionBottomYPos;
            return;
        }
        // if (cmd == 0x72) {
        //     int xPosDest = args[1];
        //     int yPosDest = args[2];
        //     int articleKind = _get_script_value_aiScriptData(aiActInst, *(int *) &args[3], 0);

        //     Weapon* weapon = _search_aiWeaponManager(AI_MANAGER->weaponManager, 0, articleKind);
        //     if (weapon == nullptr) {
        //         aiActInst->variables[xPosDest] = 0;
        //         aiActInst->variables[yPosDest] = 0;
        //         return;
        //     }      

        //     OSReport("weapon address: %08x\n", &weapon);
        //     OSReport("weapon: %08x\n", weapon);
        //     OSReport("weapon module addr: %08x\n", weapon->modules);
        //     OSReport("weapon module posture addr: %08x\n", weapon->modules->groundModule);
        //     OSReport("weapon module posture xpos addr: %08x\n", weapon->modules->groundModule->unk1->unk1->unk1->landingCollisionBottomXPos);
      

        //     aiActInst->variables[xPosDest] = weapon->modules->groundModule->unk1->unk1->unk1->landingCollisionBottomXPos;
        //     aiActInst->variables[yPosDest] = weapon->modules->groundModule->unk1->unk1->unk1->landingCollisionBottomYPos;
        //     return;
        // }

        if (cmd < 0xC0 && cmd >= 0xB0) {
            if (ai_customFnInjection != nullptr && !ai_customFnInjectionToggle[cmd & 0xF]) ai_customFnInjection[cmd & 0xF] = _get_script_value_aiScriptData(aiActInst, *(int *) &args[1], 0);
            return;
        }
        if (cmd < 0xD0 && cmd >= 0xC0) {
            if (ai_customFnInjection != nullptr && ai_customFnInjectionToggle[cmd & 0xF]) aiActInst->variables[args[1]] = ai_customFnInjection[cmd & 0xF];
            return;
        }
        if (cmd < 0xE0) {
            switch (cmd) {
                case 0xD0: {
                    double x1 = _get_script_value_aiScriptData(aiActInst, *(int *) &args[1], 0);
                    double y1 = _get_script_value_aiScriptData(aiActInst, *(int *) &args[2], 0);
                    int red = _get_script_value_aiScriptData(aiActInst, *(int *) &args[3], 0);
                    int green = _get_script_value_aiScriptData(aiActInst, *(int *) &args[4], 0);
                    int blue = _get_script_value_aiScriptData(aiActInst, *(int *) &args[5], 0);
                    int alpha = _get_script_value_aiScriptData(aiActInst, *(int *) &args[6], 0);
                    if (alpha == 255) {
                        Point * pt = new Point{
                                0x000000FF,
                                (float) x1,
                                (float) y1,
                                42,
                                false
                        };
                        pt->autoTimer = false;
                        renderables.items.tick.push(pt);
                    }
                    Point * pt = new Point{
                            (red << 24) | (green << 16) | (blue << 8) | alpha,
                            (float) x1,
                            (float) y1,
                            30,
                            false
                    };
                    pt->autoTimer = false;
                    renderables.items.tick.push(pt);
                    return;
                }
                case 0xD1: {
                    double x1 = _get_script_value_aiScriptData(aiActInst, *(int *) &args[1], 0);
                    double y1 = _get_script_value_aiScriptData(aiActInst, *(int *) &args[2], 0);
                    double x2 = _get_script_value_aiScriptData(aiActInst, *(int *) &args[3], 0);
                    double y2 = _get_script_value_aiScriptData(aiActInst, *(int *) &args[4], 0);
                    int red = _get_script_value_aiScriptData(aiActInst, *(int *) &args[5], 0);
                    int green = _get_script_value_aiScriptData(aiActInst, *(int *) &args[6], 0);
                    int blue = _get_script_value_aiScriptData(aiActInst, *(int *) &args[7], 0);
                    int alpha = _get_script_value_aiScriptData(aiActInst, *(int *) &args[8], 0);
                    if (alpha == 255) {
                        Line * ln = new Line{
                                0x000000FF,
                                (float) x1,
                                (float) y1,
                                (float) x2,
                                (float) y2,
                                42,
                                false
                        };
                        ln->autoTimer = false;
                        renderables.items.tick.push(ln);
                    }
                    Line * ln = new Line{
                            (red << 24) | (green << 16) | (blue << 8) | alpha,
                            (float) x1,
                            (float) y1,
                            (float) x2,
                            (float) y2,
                            30,
                            false
                    };
                    ln->autoTimer = false;
                    renderables.items.tick.push(ln);
                    return;
                }
                case 0xD2: {
                    double x = _get_script_value_aiScriptData(aiActInst, *(int *) &args[1], 0);
                    double y = _get_script_value_aiScriptData(aiActInst, *(int *) &args[2], 0);
                    double width = _get_script_value_aiScriptData(aiActInst, *(int *) &args[3], 0);
                    double height = _get_script_value_aiScriptData(aiActInst, *(int *) &args[4], 0);
                    int red = _get_script_value_aiScriptData(aiActInst, *(int *) &args[5], 0);
                    int green = _get_script_value_aiScriptData(aiActInst, *(int *) &args[6], 0);
                    int blue = _get_script_value_aiScriptData(aiActInst, *(int *) &args[7], 0);
                    int alpha = _get_script_value_aiScriptData(aiActInst, *(int *) &args[8], 0);
                    if (alpha == 255) {
                        RectOutline * ro = new RectOutline{
                                0x000000FF,
                                (float) (y - height),
                                (float) (y + height),
                                (float) (x - width),
                                (float) (x + width),
                                42,
                                false
                        };
                        ro->autoTimer = false;
                        renderables.items.tick.push(ro);
                    }
                    RectOutline * ro = new RectOutline{
                        (red << 24) | (green << 16) | (blue << 8) | alpha,
                        (float) (y - height),
                        (float) (y + height),
                        (float) (x - width),
                        (float) (x + width),
                        30,
                        false
                    };
                    ro->autoTimer = false;
                    renderables.items.tick.push(ro);
                    return;
                }
            }
        }
        if (cmd < 0xF0) {
            auto colorModule = FIGHTER_MANAGER->getFighter(aiActInst->ftInputPtr->fighterId)->modules->colorBlendModule;
            switch (cmd) {
                case 0xE0:
                    colorModule->isEnabled = 1;
                    return;
                case 0xE1:
                    colorModule->isEnabled = 0;
                    return;
                case 0xE2:
                    int red = _get_script_value_aiScriptData(aiActInst, *(int *) &args[1], 0);
                    int green = _get_script_value_aiScriptData(aiActInst, *(int *) &args[2], 0);
                    int blue = _get_script_value_aiScriptData(aiActInst, *(int *) &args[3], 0);
                    int alpha = _get_script_value_aiScriptData(aiActInst, *(int *) &args[4], 0);
                    colorModule->red = red;
                    colorModule->green = green;
                    colorModule->blue = blue;
                    colorModule->alpha = alpha;
                    return;
            }
        }
        if (cmd < 0x100) {
            switch (cmd) {
                case 0xF0:
                    OSReport("LOGGED VALUE: %.3f\n", _get_script_value_aiScriptData(aiActInst, *(int *) &args[1], 0));
                    return;
                case 0xF1:
                    OSReport("LOGGED STRING: ");
                    for (int i = 1; i <= 5; i++) {
                        unsigned int toConvert = _get_script_value_aiScriptData(aiActInst, *(int *) &args[i], 0);
                        OSReport("%c%c%c",
                                (toConvert & 0xFF000000) >> 24,
                                (toConvert & 0x00FF0000) >> 16,
                                (toConvert & 0x0000FF00) >> 8);
                    }
                    OSReport("\n");
            }
        }
    }
}