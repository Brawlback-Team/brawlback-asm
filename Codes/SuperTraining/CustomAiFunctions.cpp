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
#include "MovementTracker.h"
#include "FudgeMenu.h"

#define _stRayCheck_vec3f ((int (*)(Vec3f* start, Vec3f* dest, Vec3f* retValue, Vec3f* normalVec, int unkTrue, int unk0, int unk0_1, int unk1)) 0x809326d8)
#define _length_vec3f ((double (*)(Vec3f* vector)) 0x8070b94c)
#define OSReport ((void (*)(const char* text, ...)) 0x801d8600)
#define _randf ((double (*)()) 0x8003fb64)

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
    change_md_aiInput(aiInputInst, 0x2, &dummy, 0x8000, 0);
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

// SELF_TARGET_CHANGE_FIX1
STRING_WRITE(0x808fe5f8, "\x60\x00\x00\x00");
// SELF_TARGET_CHANGE_FIX2
STRING_WRITE(0x809073dc, "\x60\x00\x00\x00");
// SELF_TARGET_CHANGE_FIX3
STRING_WRITE(0x809188e0, "\x60\x00\x00\x00");
// SELF_TARGET_CHANGE_FIX4
STRING_WRITE(0x80900cb8, "\x60\x00\x00\x00");

signed char disabledMd[4] = {-1, -1, -1, -1};
INJECTION("CPUForceMd", 0x80905204, R"(
    SAVE_REGS
    mr r3, r26
    mr r4, r27
    mr r5, r28
    bl CPUForceMd
    RESTORE_REGS
)");

#define _GetPlayerNo_aiChrIdx ((int (*)(char* chrIdx)) 0x808fd68c)
extern "C" void CPUForceMd(aiInput * aiInput, unsigned int intent, int newAction) {
    // OSReport("ADDR: %08x\n", aiInput);
    if (aiInput->charId == 0x10) aiInput->aiMd = intent;
    else if (aiInput->ftEntryPtr != nullptr) {
        OSReport("-- MD CHANGE --\n");
        OSReport("current action: %04x; ", aiInput->aiActPtr->aiScript);
        OSReport("new action?: %04x;\n", newAction);
        OSReport("current md: %02x; ", aiInput->aiMd);
        OSReport("new md: %02x\n", intent);

        char pNum = _GetPlayerNo_aiChrIdx(&aiInput->cpuIdx);
        if (intent <= 0xFFFF && pNum != -1 && intent != disabledMd[pNum]) {
            aiInput->aiMd = intent;
        }
    }
}

bool disabledSwitch[4] = {false, false, false, false};
bool debugSwitch[4] = {true, true, true, true};
INJECTION("PREVENT_AUTO_CALL1", 0x80900ff8, "bl filterMDCall");
INJECTION("PREVENT_AUTO_CALL2", 0x80900eb4, "bl filterMDCall");
INJECTION("PREVENT_AUTO_CALL3", 0x808fe638, "bl filterMDCall");
INJECTION("PREVENT_AUTO_CALL4", 0x80901084, "bl filterMDCall");
INJECTION("PREVENT_AUTO_CALL5", 0x80900d38, "bl filterMDCall");
INJECTION("PREVENT_AUTO_CALL6", 0x80900e54, "bl filterMDCall");
INJECTION("PREVENT_AUTO_CALL7", 0x80900f60, "bl filterMDCall");
INJECTION("PREVENT_AUTO_CALL8", 0x80900fa4, "bl filterMDCall");
INJECTION("PREVENT_AUTO_CALL9", 0x80900fd4, "bl filterMDCall");
INJECTION("PREVENT_AUTO_CALL10", 0x8090137c, "bl filterMDCall");
INJECTION("PREVENT_AUTO_CALL11", 0x808feb2c, "bl filterMDCall");
// INJECTION("PREVENT_AUTO_CALL12", 0x80907b18, "bl filterMDCall");
// INJECTION("PREVENT_AUTO_CALL13", 0x80907b18, "bl filterMDCall");
extern "C" void filterMDCall(aiInput *aiInputInst,unsigned int newMode,unsigned char *param_3,unsigned int newOrOldAction,int param_5) {
    if (!disabledSwitch[_GetPlayerNo_aiChrIdx(&aiInputInst->cpuIdx)]) {
        change_md_aiInput(aiInputInst, newMode, param_3, newOrOldAction, param_5);
    }
    return;
}

bool autoDefend[4] = {true, true, true, true};
INJECTION("PREVENT_AUTO_DEFEND", 0x80900c60, "bl preventAutoDefend");

extern "C" void preventAutoDefend(aiInput *aiInputInst,unsigned int newMode,unsigned char *param_3,unsigned int newOrOldAction,int param_5) {
    if (autoDefend[_GetPlayerNo_aiChrIdx(&aiInputInst->cpuIdx)] || newOrOldAction == 0x30E0) {
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
extern TrainingData playerTrainingData[];

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

MovementTracker movementTrackers[4] = {
    MovementTracker(),
    MovementTracker(),
    MovementTracker(),
    MovementTracker()
};

SIMPLE_INJECTION(clearPredictions, 0x800dc590, "li r9, 2") {
    for (int i = 0; i < 0x10; i++) {
        if (i < 4) {
            movementTrackers[i].reset();
            disabledSwitch[i] = false;
            disabledMd[i] = -1;
            autoDefend[i] = true;
            debugSwitch[i] = true;
        }
        rpsManagers[i].clearAll();
    }
};

INJECTION("TRACK_ACTION", 0x8077f9d8, R"(
    SAVE_REGS
    mr r3, r4
    mr r4, r5
    bl trackActionChange
    RESTORE_REGS
    cmpwi r4, -1
)")

extern "C" {
    double fn_result = 0;
    void trackActionChange(int action, soModuleAccessor * accesser) {
        if (action == -1) return;
        // HOPEFULLY only actual fighters have a "controller" module implementation
        // 0x80AEB140 = controllerModuleNull
        if (***((void****)accesser->paramCustomizeModule) != (void*)0x80b0ad44) return;
        auto pNum = _GetPlayerNo_aiChrIdx(&((Fighter*) accesser->owner)->getOwner()->ftInputPtr->cpuIdx);
        if (pNum >= 4) return;
        movementTrackers[pNum].trackAction(action);
    }
    void aiFunctionHandlers(float unk_f10, aiStat* targetAiStat, unsigned int switchCase, aiScriptData* selfAi, u32 sp, u32 rtoc) {
        fn_shouldReturnResult = 0;

        // if (((switchCase - 0x1000) & 0xFF) == 0xFF) {
        //     fn_result = md_customFnInjection;
        //     fn_shouldReturnResult = 1;
        //     return;
        // }

        ftEntry * targetFighterEntry;
        Fighter * targetFighter;
        char targetPlayerNo = -1;
        bool shouldGetAiTarget = (switchCase & 0x0100) >> 8;
        if (shouldGetAiTarget) {
            switchCase -= 0x100;
            targetFighterEntry = targetAiStat->input->ftEntryPtr;
            bool getChild = targetFighterEntry == nullptr;
            targetPlayerNo = _GetPlayerNo_aiChrIdx(&targetAiStat->input->cpuIdx);
            targetFighter = FIGHTER_MANAGER->getFighter(FIGHTER_MANAGER->getEntryId(targetPlayerNo), getChild);
        } else {
            targetFighterEntry = selfAi->ftInputPtr->ftEntryPtr;
            targetPlayerNo = _GetPlayerNo_aiChrIdx(&selfAi->ftInputPtr->cpuIdx);
            bool getChild = targetFighterEntry == nullptr;
            targetFighter = FIGHTER_MANAGER->getFighter(FIGHTER_MANAGER->getEntryId(targetPlayerNo), getChild);
        }

        switchCase -= 0x1000;
        if (switchCase == 0x4C) { // IsOnStage
            fn_shouldReturnResult = 1;

            auto groundModule = targetFighter->modules->groundModule->unk1->unk1->unk1;
            Vec3f startPos {
                    groundModule->landingCollisionBottomXPos,
                    groundModule->landingCollisionBottomYPos,
                    targetFighter->modules->postureModule->zPos
            };

            Vec3f destPos {
                startPos.f1,
                startPos.f2 - 150,
                0
            };

            Vec3f ret1 {-1,-1,-1};
            Vec3f ret2 {-1,-1,-1};

            _stRayCheck_vec3f(&startPos, &destPos, &ret1, &ret2, true, 0, 1, 1);
            
            fn_result = -1;
            if (ret1.f3 != -1) {
                startPos.f1 -= ret1.f1;
                startPos.f2 -= ret1.f2;
                fn_result = _length_vec3f(&startPos);
            }

            if (fn_result != -1) {
                fn_result = 1;
                return;
            }

            fn_result = 0;
            return;
        }

        if (switchCase == 0x4B) {
            auto groundModule = targetFighter->modules->groundModule->unk1->unk1->unk1;
            
            Vec3f startPos {
                    groundModule->landingCollisionBottomXPos,
                    targetFighter->modules->postureModule->yPos,
                    targetFighter->modules->postureModule->zPos
            };

            Vec3f destPos {
                startPos.f1,
                startPos.f2 - 150,
                0
            };

            Vec3f ret1 {-1,-1,-1};
            Vec3f ret2 {-1,-1,-1};

            _stRayCheck_vec3f(&startPos, &destPos, &ret1, &ret2, true, 0, 1, 1);
            
            fn_result = (double) (ret1.f1 != destPos.f1 || ret1.f2 != destPos.f2);
            fn_shouldReturnResult = 1;
        }

        if (switchCase == 0x51) {
            fn_result = FIGHTER_MANAGER->getInput(targetFighterEntry->entryId)->aiMd;
            fn_shouldReturnResult = 1;
        }
        if (switchCase == 0x52) {
            fn_result = targetPlayerNo;
        }
        if (switchCase == 0x53) {
            if (targetFighterEntry == nullptr) {
                fn_result = -1;
            } else {
                fn_result = 0;
    //            OSReport("move id: %08x\n", targetFighterEntry->owner->ownerDataPtr->currStaleQueueNum);
                for (int i = 0; i < 9; i++) {
    //                OSReport("i: %d; moveNum: %08x\n", i, targetFighterEntry->owner->ownerDataPtr->staleMoveQueue[i].attack);
                    if (targetFighterEntry->owner->ownerDataPtr->staleMoveQueue[i].attack == targetFighterEntry->owner->ownerDataPtr->currStaleQueueNum) {
                        fn_result++;
                    }
                }
            }
            fn_shouldReturnResult = 1;
        }
        if (switchCase == 0x54) {
            fn_result = targetFighter->modules->groundModule->isPassableGround(0);
            fn_shouldReturnResult = 1;
        }

        if (switchCase == 0x55) {
//            OSReport("ftEntry Address: %08x\n", targetFighterEntry);
//            OSReport("ftSo Address: %08x\n", targetFighter);
//            OSReport("UnkFtPtr Address: %08x\n", targetFighter->modFnAccessor);
//            OSReport("Supposed cancelModule address: %08x\n", targetFighter->modFnAccessor->getFtCancelModule(targetFighter));
            fn_result = targetFighter
                    ->getCancelModule()
                    ->isEnableCancel();

            fn_shouldReturnResult = 1;
        }

        // weight
        if (switchCase == 0x56) {
            fn_result = targetFighter->modules->paramCustomizeModule->weight;
            fn_shouldReturnResult = 1;
        }
        // gravity
        if (switchCase == 0x57) {
            fn_result = targetFighter->modules->paramCustomizeModule->gravity;
            fn_shouldReturnResult = 1;
        }
        // fastfallspeed
        if (switchCase == 0x58) {
            fn_result = targetFighter->modules->paramCustomizeModule->fastFallSpeed;
            fn_shouldReturnResult = 1;
        }
        // endframe
        if (switchCase == 0x59) {
            auto motionModule = targetFighter->modules->motionModule;
            if (motionModule->mainAnimationData.resPtr != nullptr) {
                fn_result = motionModule->getEndFrame();
                fn_shouldReturnResult = 1;
            }
        }

        if (switchCase == 0x60) {
            fn_result = playerTrainingData[targetPlayerNo].aiData.scriptID;
            fn_shouldReturnResult = 1;
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

int* gotoCmdStack[0x10] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}; 
int gotoCmdScripts[0x10] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
int* gotoCmdScriptHeads[0x10] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
int gotoCmdStackPtr = 0;
INJECTION("AI_GOTO_WITH_STACK_PUSH", 0x80917620, R"(
    SAVE_REGS
    mr r3, r30
    bl aiGotoPush
    RESTORE_REGS
    mr r29, r30
)");
INJECTION("AI_GOTO_WITH_STACK_POP", 0x809174c4, R"(
    mr r3, r26
    bl aiGotoPop
    mr r29, r3
    mr r30, r29
)");
INJECTION("AI_GOTO_WITH_STACK_FIX1", 0x80917548, R"(
    mr r3, r26
    bl clearGotoStack
    lhz r0, 0x2(r30)
)");
INJECTION("AI_GOTO_WITH_STACK_FIX2", 0x80917470, R"(
    mr r3, r26
    bl clearGotoStack
    lhz r0, 0x7e(r26)
)");
INJECTION("AI_GOTO_WITH_STACK_FIX3", 0x80917604, R"(
    mr r3, r26
    bl clearGotoStack
    stw r6, 0xa8(r26)
)");
INJECTION("AI_GOTO_WITH_STACK_FIX4", 0x80917c34, R"(
    mr r3, r26
    bl clearGotoStack
    lbz r0,0x1(r30)
)");
INJECTION("AI_GOTO_WITH_STACK_FIX5", 0x80918148, R"(
    mr r3, r26
    bl clearGotoStack
    lhz r4,0x7a(r26)
)");
INJECTION("CLEAR_DYNAMIC_DICE", 0x80918500, R"(
    mr r3, r26
    bl clearDynamicDice
    lfd f31, 0x100(r1)
)")

// THIS TAKES PLACE IN IF_CHK ON THE REQUIREMENT SIDE OF THINGS
INJECTION("CUSTOM_AI_XGOTO_REQ_FIX", 0x8091ea68, R"(
    bl aiReqCalledAsFix
)");

vector<const void*> NoRepeatInstructions = vector<const void*>();
vector<int> dynamicDice = vector<int>();
#define _target_check_aiInput ((void (*)(aiInput* self)) 0x80907ba4)
#define _getEntity_ftEntryManager ((ftEntry* (*)(ftEntryManager* self, entryID entryid)) 0x80823b24)
SIMPLE_INJECTION(clearNoRepeatInstruction, 0x809171f4, "li r31, 0x0") {
    NoRepeatInstructions.reallocate(0);
    NoRepeatInstructions.reallocate(1);
    dynamicDice.reallocate(0);
    dynamicDice.reallocate(1);
}

int* forcedNextInstruction = nullptr;
int forcedNextScript = 0;
int originScript = 0;
#define _act_change ((void (*)(aiScriptData * self, unsigned int nextScript, char* unk1, int unk2, int unk3)) 0x80918554)
extern "C" {
    void aiReqCalledAsFix() {
        if (originScript != 0) {
            asm("mr r0, %0"
                :
                : "r" (originScript));
        } else {
            // otherwise use the default code
            asm("lhz r0,0x78(r23)");
        }
    }
    void clearDynamicDice(aiScriptData* aiActInst) { 
        dynamicDice.reallocate(0);
        dynamicDice.reallocate(1);
    }
    void aiGotoPush(int* nextPlace) {
        gotoCmdStack[gotoCmdStackPtr] = nextPlace;
        gotoCmdScripts[gotoCmdStackPtr] = 0;
        gotoCmdScriptHeads[gotoCmdStackPtr] = 0;
        gotoCmdStackPtr += 1;
    };
    void aiXGotoPush(aiScriptData* aiActInst, int* nextPlace, int nextScript) {
        if (originScript == 0) originScript = aiActInst->aiScript;
        gotoCmdStack[gotoCmdStackPtr] = nextPlace;
        gotoCmdScripts[gotoCmdStackPtr] = aiActInst->aiScript;
        gotoCmdScriptHeads[gotoCmdStackPtr] = aiActInst->constPtr;
        OSReport("(%08x) ==> %d: %08x\n", aiActInst->aiScript, gotoCmdStackPtr, aiActInst->constPtr);
        gotoCmdStackPtr += 1;
    };
    char dummy = 0xFF;
    int* aiGotoPop(aiScriptData* aiActInst) {
        if (gotoCmdStackPtr > 0) {
            gotoCmdStackPtr -= 1;
            if (gotoCmdScripts[gotoCmdStackPtr] != 0) {
                aiActInst->aiScript = 0;
                _act_change(aiActInst, gotoCmdScripts[gotoCmdStackPtr], &dummy, 0, 0);
                aiActInst->constPtr = gotoCmdScriptHeads[gotoCmdStackPtr];
                OSReport("(%08x) <== %d: %08x\n", gotoCmdScripts[gotoCmdStackPtr], gotoCmdStackPtr, aiActInst->constPtr);
            }
            if (gotoCmdStackPtr == 0) originScript = 0;
            return gotoCmdStack[gotoCmdStackPtr];
        }
        if (gotoCmdStackPtr == 0) originScript = 0;
        return 0;
    };
    void clearGotoStack(aiScriptData* aiActInst) {
        asm("SAVE_REGS");
        OSReport("CLEARED GOTO STACK\n");
        aiActInst->aiScript = aiActInst->intermediateCurrentAiScript;
        asm("RESTORE_REGS");
        gotoCmdStackPtr = 0;
        originScript = 0;
    };
}



bool forcedReturnStatement = false;
INJECTION("CUSTOM_AI_COMMANDS", 0x80917450, R"(
    lbz r4, 0x00(r30)
    SAVE_REGS
    mr r3, r26
    mr r4, r30
    mr r5, r28
    bl aiCommandHandlers
    RESTORE_REGS
    bl RELOCATE_INSTRUCTION
    bl FORCE_RETURN
)");

#define _get_script_value_aiScriptData ((double (*)(aiScriptData * self, int soughtValue, int isPartOfVector)) 0x8091dfc4)
#define _getButtonMask_soController ((unsigned int (*)(int btn)) 0x8076544c)
extern "C" {
    void RELOCATE_INSTRUCTION() {
        if (forcedNextInstruction != nullptr) {
            asm("mr r30, %0"
                :
                : "r" (forcedNextInstruction));
        }
    }
    void FORCE_RETURN() {
        if (forcedReturnStatement) {
            forcedReturnStatement = false;
            asm("li r4, 0x4");
        }
    }
    void aiCommandHandlers(aiScriptData* aiActInst, const int* args, unsigned int* buttons) {
        forcedNextInstruction = nullptr;
        // char targetChrIdx = (aiActInst) ? : ;
        int cmd = (args[0] & 0xFF000000) >> 24;
        if (cmd < 0x35) return;
        if (cmd <= 0x3A) {
            int varToMod = args[1];
            double index = _get_script_value_aiScriptData(aiActInst, *(int *) &args[2], 0);
            bool shouldGetTarget = _get_script_value_aiScriptData(aiActInst, *(int *) &args[3], 0);

            soWorkManageModuleImpl* targetWorkModule;
            if (shouldGetTarget) {
                auto targetPlayerNum = AI_MANAGER->getAiCpuTarget(_GetPlayerNo_aiChrIdx(&aiActInst->ftInputPtr->cpuIdx));
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
                auto targetPlayerNum = AI_MANAGER->getAiCpuTarget(_GetPlayerNo_aiChrIdx(&aiActInst->ftInputPtr->cpuIdx));
                Fighter* target = FIGHTER_MANAGER->getFighter(FIGHTER_MANAGER->getEntryId(targetPlayerNum));
                if (target == nullptr) return;
                targetGroundModule = target->modules->groundModule;
            } else {
                targetGroundModule = FIGHTER_MANAGER->getFighter(aiActInst->ftInputPtr->fighterId)->modules->groundModule;
            }

            Vec3f startPos {
                    targetGroundModule->unk1->unk1->unk1->landingCollisionBottomXPos + (float) xOffset,
                    targetGroundModule->unk1->unk1->unk1->landingCollisionBottomYPos + (float) yOffset,
                    0
            };

            Vec3f destPos {
                startPos.f1,
                startPos.f2 - 150,
                0
            };

            Vec3f ret1 {-1,-1,-1};
            Vec3f ret2 {-1,-1,-1};

            _stRayCheck_vec3f(&startPos, &destPos, &ret1, &ret2, true, 0, 1, 1);
            OSReport("YDISTFLOOR OFFSET RESULT: %.3f, %.3f\n", ret1.f1, ret1.f2);
            OSReport("YDISTFLOOR OFFSET RET2: %.3f, %.3f\n", ret2.f1, ret2.f2);

            float res = -1;
            if (ret1.f3 != -1) {
                startPos.f1 -= ret1.f1;
                startPos.f2 -= ret1.f2;
                res = _length_vec3f(&startPos);
                OSReport("NORMALIZED RESULT: %.3f\n", res);
            }

            aiActInst->variables[varToMod] = (float) res;
            return;
        }

        // staleMoveFrequency
        // YDistFloor Absolute
        if (cmd == 0x3C) {
            int varToMod = args[1];
            double xPos = _get_script_value_aiScriptData(aiActInst, *(int *) &args[2], 0);
            double yPos = _get_script_value_aiScriptData(aiActInst, *(int *) &args[3], 0);

            double res = -1;

            Vec3f startPos {
                    (float) xPos,
                    (float) yPos,
                    0
            };

            Vec3f destPos {
                startPos.f1,
                startPos.f2 - 150,
                0
            };

            Vec3f ret1 {-1,-1,-1};
            Vec3f ret2 {-1,-1,-1};

            _stRayCheck_vec3f(&startPos, &destPos, &ret1, &ret2, true, 0, 1, 1);
            
            if (ret1.f3 != -1) {
                startPos.f1 -= ret1.f1;
                startPos.f2 -= ret1.f2;
                res = _length_vec3f(&startPos);
            }

            aiActInst->variables[varToMod] = (float) res;
            return;
        }

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
        if (cmd == 0x3F) {
            int varToMod = args[1];
            int attributeIndex = _get_script_value_aiScriptData(aiActInst, *(int *) &args[2], 0);
            bool fromTarget = _get_script_value_aiScriptData(aiActInst, *(int *) &args[3], 0);

            Fighter* targetFighter;
            if (fromTarget) {
                targetFighter = FIGHTER_MANAGER->getFighter(FIGHTER_MANAGER->getEntryId(_GetPlayerNo_aiChrIdx(&aiActInst->ftInputPtr->cpuIdx)));
            } else {
                targetFighter = FIGHTER_MANAGER->getFighter(aiActInst->ftInputPtr->fighterId);
            }
            aiActInst->variables[varToMod] = *(float*)((int)&targetFighter->modules->paramCustomizeModule->walkInitVel + attributeIndex * 0x4);
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
            autoDefend[_GetPlayerNo_aiChrIdx(&aiActInst->ftInputPtr->cpuIdx)] = onOff;
            return;
        }
        // disable md
        if (cmd == 0x46) {
            int mdValue = _get_script_value_aiScriptData(aiActInst, *(int *) &args[1], 0);
            disabledMd[_GetPlayerNo_aiChrIdx(&aiActInst->ftInputPtr->cpuIdx)] = mdValue;
            return;
        }
        // disable force switch md altogether
        if (cmd == 0x47) {
            bool onOff = _get_script_value_aiScriptData(aiActInst, *(int *) &args[1], 0);
            disabledSwitch[_GetPlayerNo_aiChrIdx(&aiActInst->ftInputPtr->cpuIdx)] = onOff;
            return;
        }
        // getDynamicAtkData
        if (cmd == 0x48) {
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

        #define _calcArraivePosX_aiStat ((double (*)(double time, aiStat * stat)) 0x80916884)
        #define _calcArraivePosY_aiStat ((double (*)(double time, aiStat * stat)) 0x809168c8)
        if (cmd == 0x49 || cmd == 0x4A) {
            double time = _get_script_value_aiScriptData(aiActInst, *(int *) &args[2], 0);
            
            double result;
            if (cmd == 0x49) result = _calcArraivePosX_aiStat(time, aiActInst->scriptValues);
            else result = _calcArraivePosY_aiStat(time, aiActInst->scriptValues);

            aiActInst->variables[args[1]] = (float) result;
            return;
        }

        // #define _stRayCheck_vec3f ((void (*)(Vec3f* start, Vec3f* dest, float* unk, Vec3f* collisionPoint, Vec3f* normalVec, int unk0, int unk0_1, int unk1)) 0x809327ec)
        if (cmd == 0x4B || cmd == 0x4C) {
            int retX = args[1];
            int retY = args[2];
            // int grTypeTarget = args[2];
            double xPos = _get_script_value_aiScriptData(aiActInst, *(int *) &args[3], 0);
            double yPos = _get_script_value_aiScriptData(aiActInst, *(int *) &args[4], 0);
            double xDest = _get_script_value_aiScriptData(aiActInst, *(int *) &args[5], 0);
            double yDest = _get_script_value_aiScriptData(aiActInst, *(int *) &args[6], 0);
            bool detectPlats = _get_script_value_aiScriptData(aiActInst, *(int *) &args[7], 0);

            Vec3f startPos {
                    (float) xPos,
                    (float) yPos,
                    0
            };

            Vec3f destPos {
                (float) ((cmd == 0x4B) ? (xDest - xPos) : xDest),
                (float) ((cmd == 0x4B) ? (yDest - yPos) : yDest),
                0
            };

            Vec3f ret1 {-1,-1,-1};
            Vec3f ret2 {-1,-1,-1};

            _stRayCheck_vec3f(&startPos, &destPos, &ret1, &ret2, detectPlats, 0, 1, 1);
            aiActInst->variables[retX] = (float) ret1.f1;
            aiActInst->variables[retY] = (float) ret1.f2;
            return;
        }

        if (cmd == 0x4D) {
            bool value = _get_script_value_aiScriptData(aiActInst, *(int *) &args[1], 0);
            debugSwitch[_GetPlayerNo_aiChrIdx(&aiActInst->ftInputPtr->cpuIdx)] = value;
            return;
        }

        // Push to Trackers
        if (cmd == 0x50) {
            int managerNum = _get_script_value_aiScriptData(aiActInst, *(int *) &args[1], 0);
            if (0 <= managerNum && managerNum < 0x10) {
                rpsManagers[managerNum].pushNew(_GetPlayerNo_aiChrIdx(&aiActInst->ftInputPtr->cpuIdx), (int) _get_script_value_aiScriptData(aiActInst, *(int *) &args[2], 0));
            }
            return;
        }
        // calcOption
        if (cmd == 0x51) {
            int varToMod = args[1];
            int managerNum = _get_script_value_aiScriptData(aiActInst, *(int *) &args[2], 0);
            int lookAmount = _get_script_value_aiScriptData(aiActInst, *(int *) &args[3], 0) / 20;
            aiActInst->variables[varToMod] = rpsManagers[managerNum].calcOption(_GetPlayerNo_aiChrIdx(&aiActInst->ftInputPtr->cpuIdx), lookAmount);
            return;
        }
        // calcOptionConfidence
        if (cmd == 0x52) {
            int varToMod = args[1];
            int managerNum = _get_script_value_aiScriptData(aiActInst, *(int *) &args[2], 0);
            int lookAmount = _get_script_value_aiScriptData(aiActInst, *(int *) &args[3], 0) / 20;
            aiActInst->variables[varToMod] = rpsManagers[managerNum].calcOptionConfidence(_GetPlayerNo_aiChrIdx(&aiActInst->ftInputPtr->cpuIdx), lookAmount);
            return;
        }
        // calcAverage
        if (cmd == 0x53) {
            int varToMod = args[1];
            int managerNum = _get_script_value_aiScriptData(aiActInst, *(int *) &args[2], 0);
            int lookAmount = _get_script_value_aiScriptData(aiActInst, *(int *) &args[3], 0) / 20;
            aiActInst->variables[varToMod] = rpsManagers[managerNum].average(_GetPlayerNo_aiChrIdx(&aiActInst->ftInputPtr->cpuIdx), lookAmount);
            return;
        }
        // increment
        if (cmd == 0x54) {
            int managerNum = _get_script_value_aiScriptData(aiActInst, *(int *) &args[1], 0);
            rpsManagers[managerNum].plusOne(_GetPlayerNo_aiChrIdx(&aiActInst->ftInputPtr->cpuIdx));
            return;
        }
        // getCurrent
        if (cmd == 0x55) {
            int varToMod = args[1];
            int managerNum = _get_script_value_aiScriptData(aiActInst, *(int *) &args[2], 0);
            aiActInst->variables[varToMod] = rpsManagers[managerNum].get(_GetPlayerNo_aiChrIdx(&aiActInst->ftInputPtr->cpuIdx));
            return;
        }
        // approximateAction
        if (cmd == 0x58) {
            int varToMod = args[1];
            int levelValue = _get_script_value_aiScriptData(aiActInst, *(int *) &args[2], 0);
            aiActInst->variables[varToMod] = movementTrackers[_GetPlayerNo_aiChrIdx(&aiActInst->ftInputPtr->aiTarget)].approxChance((float) levelValue);
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
                auto targetPlayerNum = AI_MANAGER->getAiCpuTarget(_GetPlayerNo_aiChrIdx(&aiActInst->ftInputPtr->cpuIdx));
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

        // CallI
        if (cmd == 0x80) {
            unsigned int nextScript = args[1] & 0xffff;
            char dummy = 0xff;
            aiActInst->aiScript = 0;
            _act_change(aiActInst, nextScript, &dummy, 0, 0);
            // force change current instruction in memory
            clearGotoStack(aiActInst);
            aiActInst->framesSinceScriptChanged = -1;
            forcedNextInstruction = (int*)((int) aiActInst->currentInstruction + 0x0);
            OSReport("FNInst (1): %08x\n", forcedNextInstruction);

            // aiActInst
            return;
        }
        // XGoto
        if (cmd == 0x81) {
            unsigned int nextScript = args[1] & 0xffff;
            char dummy = 0xff;
            aiXGotoPush(aiActInst, (int*)((int) args + 0x8), nextScript);
            // auto currScr = aiActInst->aiScript;
            // OSReport("BEFORE CHANGE: %08x\n", aiActInst->constPtr);
            aiActInst->aiScript = 0;
            _act_change(aiActInst, nextScript, &dummy, 0, 0);
            // OSReport("AFTER CHANGE: %08x\n", aiActInst->constPtr);
            // aiActInst->aiScript = currScr;
            // OSReport("TARGET SCRIPT: %04x\n", nextScript);
            // OSReport("NEW SCRIPT: %04x\n", aiActInst->aiScript);
            // force change current instruction in memory
            aiActInst->framesSinceScriptChanged = -1;
            forcedNextInstruction = (int*)((int) aiActInst->currentInstruction + 0x0);
            OSReport("FNInst (2): %08x\n", forcedNextInstruction);
            return;
        }
        // NoRepeat
        if (cmd == 0x82) {
            OSReport("ARGS0 ADDR: %08x\n", &args[0]);
            for (int i = 0; i < (int) NoRepeatInstructions.size(); i++) {
                OSReport("RepInst[%d]: %08x\n", i, NoRepeatInstructions[i]);
                if (NoRepeatInstructions[i] == &args[0]) {
                    forcedNextInstruction = aiGotoPop(aiActInst);
                    if (forcedNextInstruction == nullptr) {
                        forcedReturnStatement = true;
                    }
                    return;
                }
            }
            NoRepeatInstructions.push(&args[0]);
            return;
        }

        if (cmd == 0x84) {
            dynamicDice.push((int) _get_script_value_aiScriptData(aiActInst, *(int *) &args[1], 0));
            return;
        }
        if (cmd == 0x85) {
            int varToMod = args[1];
            if (dynamicDice.size() == 0) {
                aiActInst->variables[varToMod] = -1;
                return;
            }
            aiActInst->variables[varToMod] = dynamicDice[(int) (_randf() * dynamicDice.size())];
            return;
        }
        if (cmd == 0x86) {
            dynamicDice.reallocate(0);
            dynamicDice.reallocate(1);
            return;
        }

        if (cmd < 0xC0 && cmd >= 0xB0) {
            if (ai_customFnInjection != nullptr && !ai_customFnInjectionToggle[cmd & 0xF]) ai_customFnInjection[cmd & 0xF] = _get_script_value_aiScriptData(aiActInst, *(int *) &args[1], 0);
            return;
        }
        if (cmd < 0xD0 && cmd >= 0xC0) {
            if (ai_customFnInjection != nullptr && ai_customFnInjectionToggle[cmd & 0xF]) aiActInst->variables[args[1]] = ai_customFnInjection[cmd & 0xF];
            return;
        }
        int pNum = _GetPlayerNo_aiChrIdx(&aiActInst->ftInputPtr->cpuIdx);
        if (pNum < 4 && debugSwitch[pNum]) {
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
                        // OSReport("%08x", toConvert);
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