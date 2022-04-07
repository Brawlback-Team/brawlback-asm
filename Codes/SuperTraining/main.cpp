//
// Created by johno on 7/14/2020.
//

#include <Graphics/TextPrinter.h>
#include <Wii/PAD/PADStatus.h>
#include "Assembly.h"
#include "Memory.h"
#include "Graphics/Drawable.h"
#include "Containers/vector.h"

#include "Brawl/FT/ftManager.h"
#include "Brawl/AI/aiMgr.h"
#include "Brawl/AI/aiScriptData.h"
#include "Brawl/sndSystem.h"

#include "Graphics/Draw.h"
#include "Brawl/Message.h"

#include "./menu.h"
#include "./FudgeMenu.h"
#include "./hitboxHeatmap.h"

// #define sprintf ((int (*)(char* buffer, const char* format, ...)) 0x803f89fc)
// #define strcat ((int (*)(char* destination, const char* source)) 0x803fa384)
// #define strcmp ((int (*)(const char* str1, const char* str2)) 0x803fa3fc)
// #define atof ((float (*)(const char* buffer)) 0x803fbbf8)

extern float ai_customFnInjection[0x10];
extern bool ai_customFnInjectionToggle[0x10];
extern TrainingData playerTrainingData[];
extern char selectedPlayer;
extern Menu* fudgeMenu;

//unsigned int BASE_SCALE = CAMERA_MANAGER->cameras[0].scale;

//hacky way to check if in game
enum SCENE_TYPE {
    MAIN_MENU = 0x1,
    HRC_CSS = 0x2,
    DIFFICULTY_TRAINING_CSS = 0x4,
    CSS_HRC = 0x5,
    DIFFICULTY_TRAINING_SSS_EVT_CSS = 0x6,
    SSS_BTT = 0x7,
    TRAINING_MODE_MMS = 0x8,
    VS = 0xA
};

//hacky way to check if in game
unsigned int getScene() {
    u32* ptr = (u32*) (0x805b4fd8 + 0xd4);
    ptr = (u32*) *ptr;
    if(ptr < (u32*)0xA0000000) {
        ptr = (u32*) *(ptr + (0x10 / 4));
        if(ptr != nullptr) {
            u32 scene = *(ptr + (8 / 4));
            return scene;
        }
    }
    return false;
}

bool isUnPaused() {
    return (*(char*)0x805B50C5) & 0x01;
}

// global variables for the injection down-below
signed char timer = 5;
signed char cmdDelay = 50;
bool instantResponse = true;
bool SpecialMode = true;
unsigned char infoLevel = 1;
unsigned char observePNum = 0;
bool visible = false;
bool paused = false;

int modeIdx = 0;
double md_debugDamage = 0;
int md_debugTarget = 0;

#define _stRayCheck_vec3f ((int (*)(Vec3f* start, Vec3f* dest, Vec3f* retValue, Vec3f* normalVec, int unkTrue, int unk0, int unk0_1, int unk1)) 0x809326d8)
#define _randf ((double (*)()) 0x8003fb64)
void getRandSafePosition(Vec3f* pos, bool onGround) {
    float xRand;
    float yRand;

    for (int i = 0; i < 100; i++) {
        xRand = _randf() * 300 - 150;
        yRand = _randf() * 150;

        Vec3f startPos {
            (float) xRand,
            (float) yRand,
            0
        };

        Vec3f destPos {
            (float) xRand,
            (float) yRand - 80,
            0
        };

        Vec3f ret1 {-1,-1,-1};
        Vec3f ret2 {-1,-1,-1};

        _stRayCheck_vec3f(&startPos, &destPos, &ret1, &ret2, true, 0, 1, 1);
        // OSReport("OUTSIDE: %.3f, %.3f\n", ret1.f1, ret1.f2);
        if (ret1.f1 != -1 && ret1.f2 != -1) {
            if (onGround) yRand = ret1.f2;
            Vec3f destPos {
                (float) xRand,
                (float) yRand + 150,
                0
            };
            Vec3f ret1 {-1,-1,-1};
            _stRayCheck_vec3f(&startPos, &destPos, &ret1, &ret2, true, 0, 1, 1);
            // OSReport("INSIDE: %.3f, %.3f\n", ret1.f1, ret1.f2);
            if (ret1.f1 == -1 && ret1.f2 == -1) { break; }
        }
    }
    
    pos->f1 = xRand;
    pos->f2 = yRand;
}

void setPosition(TrainingData& data, Fighter *fighter, aiInput *input, u8 numPlayers) {
    if (data.debug.settingPosition) {
        if (PREVIOUS_PADS[0].stickX < -5 || 5 < PREVIOUS_PADS[0].stickX)
            data.debug.xPos += (float) PREVIOUS_PADS[0].stickX * 3 / (float) (127 * numPlayers);
        data.debug.airGroundState = fighter->modules->groundModule->unk1->unk1->airGroundState;
        if (data.debug.airGroundState != 1) {
            if (PREVIOUS_PADS[0].stickY < -5 || 5 < PREVIOUS_PADS[0].stickY)
                data.debug.yPos += (float) PREVIOUS_PADS[0].stickY * 3 / (float) (127 * numPlayers);
        }
    }

    if (data.debug.randomizePosition) {
        fighter->modules->postureModule->xPos = data.debug.randXPos;
        fighter->modules->postureModule->yPos = data.debug.randYPos;
    } else {
        fighter->modules->postureModule->xPos = data.debug.xPos;
        fighter->modules->postureModule->yPos = data.debug.yPos;
    }
}

INJECTION("INIT_AI_TRAINING_SCRIPTS", 0x8081f4b0, R"(
    SAVE_REGS
    mr r3, r31
    bl initAiTrainingScripts
    RESTORE_REGS
    stb r0, 0x0011 (r31)
)");

// const char* STR_DEFAULT = "DEFAULT"; 
#define _GetPlayerNo_aiChrIdx ((int (*)(char* chrIdx)) 0x808fd68c)
extern "C" void initAiTrainingScripts(ftEntry* fighterEntry) {
    auto AIData = fighterEntry->owner->ftInputPtr->aiActPtr->AIScriptPac;
    if (AIData == nullptr) return;
    int numEntries = AIData->numEntries;
    int pNum = _GetPlayerNo_aiChrIdx(&fighterEntry->input->cpuIdx);
    if (pNum > 3) return;

    if (fighterEntry->owner->ftInputPtr->fighterId != playerTrainingData[pNum].aiData.fighterID) {
        playerTrainingData[pNum].aiData.fighterID = fighterEntry->owner->ftInputPtr->fighterId;
        playerTrainingData[pNum].aiData.trainingScripts->clearOptions();
        playerTrainingData[pNum].aiData.trainingScripts->addOption(new AITrainingScriptOption(
            0xFFFF,
            "DEFAULT",
            pNum
        ));
        for (int i = 0; i < numEntries; i++) {
            int strCount = AIData->getStringCount(i);
            if (strCount == 2 && strcmp(AIData->getStringEntry(i, 0), "*") == 0) {
                AITrainingScriptOption* data = new AITrainingScriptOption(
                    AIData->getCEEntry(i)->ID,
                    AIData->getStringEntry(i, 1),
                    pNum
                );
                // OSReport("FOUND SCRIPT ID: %s\n", data->name);
                playerTrainingData[pNum].aiData.trainingScripts->addOption(data);
            } else if (strCount > 2 && strcmp(AIData->getStringEntry(i, 0), "*") == 0) {
                AITrainingScriptSubmenu* data = new AITrainingScriptSubmenu(
                    AIData->getCEEntry(i)->ID,
                    AIData->getStringEntry(i, 1),
                    pNum,
                    strCount - 2
                );
                data->addOption(new BoolOption("pause", fudgeMenu->paused));
                signed char varIdx = 0;
                for (int j = 2; j < strCount; j++) {
                    if (AIData->getStringEntry(i, j)[0] != ':') {
                        data->addOption(new FloatOption(AIData->getStringEntry(i, j), ai_customFnInjection[varIdx]));
                        if (j+1 != strCount && AIData->getStringEntry(i, j + 1)[0] == ':') {
                            data->addDefault(new AITrainingDefaultVal{ varIdx, atof(AIData->getStringEntry(i, j + 1) + 1) });
                            j += 1;
                        }
                        varIdx ++;
                    }
                }
                playerTrainingData[pNum].aiData.trainingScripts->addOption(data);
            }
        }
    } 
}

INJECTION("TOGGLE_PAUSE", 0x8002E5B0, R"(
    mr r3, r25
    bl checkMenuPaused 
    lwz r3, 0 (r25)
)");

extern "C" void checkMenuPaused(char* gfTaskSchedulerInst) {
    // OSReport("Visible: %s, paused: %s\n", visible ? "T" : "F", paused ? "T" : "F");
    if (paused && visible) { gfTaskSchedulerInst[0xB] |= 0x8; }
    else { gfTaskSchedulerInst[0xB] &= ~0x8; }
}

// INJECTION("priorityCheck")

void collectData(Fighter* fighter, int pNum) {
    auto& currData = playerTrainingData[pNum];
    auto& anmData = fighter->modules->motionModule->mainAnimationData;
    
    currData.debug.psaData.currentEndFrame = (anmData.resPtr == nullptr) ? -1 : anmData.resPtr->CHR0Ptr->animLength;
    sprintf(currData.debug.psaData.currSubactionName, "%.19s", (anmData.resPtr == nullptr) ? "" : anmData.resPtr->CHR0Ptr->getString());
    currData.debug.psaData.currentFrame = anmData.animFrame;
    currData.debug.psaData.frameSpeedModifier = anmData.frameSpeedModifier;
    auto prevAction = fighter->modules->statusModule->previousAction;
    if (currData.debug.psaData.action == prevAction) {
        currData.hasPlayedSE = false;
    }
    currData.debug.psaData.prevAction = prevAction;
    currData.debug.psaData.action = fighter->modules->statusModule->action;
    currData.debug.psaData.subaction = fighter->modules->motionModule->subAction;

    // OSReport("%s: %d\n", __FILE__, __LINE__);
    // OSReport("Free Size: %08x\n", getFreeSize(mainHeap));
    currData.debug.psaData.fullScript->reallocate(0);
    currData.debug.psaData.fullScript->reallocate(1);
    auto* threads = &fighter->modules->animCmdModule->threadList->instanceUnitFullPropertyArrayVector;
    auto* thread = &threads->threadUnion.asArray[currData.debug.psaData.threadIdx];
    if (thread != nullptr && thread->cmdInterpreter->currCommand != nullptr) {
        soAnimCmd* currCommand = thread->getCommand(0);
        int commandIdx = 0;
        currData.debug.psaData.scriptLocation = -1;
        while (currCommand != nullptr && !(currCommand->_module == 0 && currCommand->code == 0) && !(currCommand->_module == 0xFF && currCommand->code == 0xFF)) {
            if (currCommand->_module != 0xFA && currCommand->_module != 0xFF) {
                currData.debug.psaData.fullScript->push(currCommand);
                // OSReport("Idx: %d; psaVecSize: %d\n", commandIdx, currData.debug.psaData.fullScript->size());
            } else {
                break;
            }
            currCommand = thread->getCommand(++commandIdx);
            if (currCommand == thread->cmdInterpreter->currCommand) {
                currData.debug.psaData.scriptLocation = commandIdx;
            }
        }
    }
    // OSReport("%s: %d\n", __FILE__, __LINE__);
    auto& aiInput = fighter->getOwner()->ftInputPtr;

    currData.aiData.currentScript = aiInput->aiActPtr->aiScript;
    currData.aiData.frameCount = aiInput->aiActPtr->framesSinceScriptChanged;

    auto workModule = fighter->modules->workModule;
    if (workModule != nullptr) {
        auto RABasicsArr = (*(int (*)[workModule->RAVariables->basicsSize])workModule->RAVariables->basics);
        auto LAFloatArr = (*(float (*)[workModule->LAVariables->floatsSize])workModule->LAVariables->floats);
        currData.debug.shieldValue = LAFloatArr[0x3];

        currData.debug.prevFrameShieldstun = currData.debug.shieldstun;
        currData.debug.shieldstun = RABasicsArr[0x5];
        if (currData.debug.shieldstun != currData.debug.prevFrameShieldstun - 1 && currData.debug.shieldstun != 0) {
            currData.debug.maxShieldstun = RABasicsArr[0x5];
        }

        auto LABasicsArr = (*(int (*)[workModule->LAVariables->basicsSize])workModule->LAVariables->basics);
        auto remainingHitstun = LABasicsArr[56];
        currData.debug.prevFrameHitstun = currData.debug.hitstun;
        currData.debug.hitstun = remainingHitstun;
        if (currData.debug.hitstun != currData.debug.prevFrameHitstun - 1 && currData.debug.hitstun != 0) {
            currData.debug.maxHitstun = remainingHitstun;
        }
    }
}

// INJECTION("ALT_COLOR", 0x8016c3fc, R"(
//     nop
// )");

// struct Color {
//     unsigned char red;
//     unsigned char green;
//     unsigned char blue;
// };

// extern "C" Color* changeColor() {
//     Color col = Color {
//         0xFF,
//         0x00,
//         0xFF
//     };
//     return &col;
// } 
// INJECTION("PROCESS_ONLY_WITH_Z", 0x8002e614, R"(
//     bl stopProcess
// )");

// unsigned short shouldAdvance = 0;
// char procDelay = 0;
// int procTimer = 5;
// bool procInstant = true;
// extern "C" void stopProcess(char** currTask, int kind) {
//     if (kind == 0) {
//         OSReport("task kind: %s\n", *currTask);
//     }
//     if (strcmp(*currTask, "FALCO") != 0) {
//         ((void (*)(char** task, int processKind)) 0x8002dc74)(currTask, kind);
//         return;
//     }
//     // OSReport("taskKind: %08x\n", kind);
//     if (PREVIOUS_PADS[0].button.Z) {
//         if (procTimer <= 0) {
//             // process/[gfTask]
//             ((void (*)(char** task, int processKind)) 0x8002dc74)(currTask, kind);    
//             procInstant = false;
//         }
//     }
// }

// INJECTION("CMD_STEPPER", 0x8077be0c, R"(
//     bl stepCommand
//     cmpwi r12, 0
//     bne _CMD_STEPPER_CONTINUE
//     lis r12, 0x8077
//     ori r12, r12, 0xBEA4
//     mtctr r12
//     bctr

// _CMD_STEPPER_CONTINUE:
//     lha r0, 0(r5)
// )");

// extern "C" void stepCommand() {
//     asm("mr r12, %0"
//         :
//         : "r" (shouldAdvance));
//     shouldAdvance ++;
//     if (shouldAdvance >= 2) {
//         shouldAdvance = 0;
//     }
// }


INJECTION("forceVisMemPool", 0x80025dc8, R"(
    cmpwi r3, 69
)");

// struct HeapData {
//     int id;
//     char* heapName;
//     unsigned int heapSize;
//     unsigned int heapOffset;
// };
// vector<HeapData*> collectedHeapData;
// INJECTION("GET_HEAP_DATA", 0x80024560, R"(
//     SAVE_REGS
//     bl getHeapData
//     RESTORE_REGS
//     cmpwi r5, 1
// )");
// extern "C" void getHeapData(int heapID, char* heapName, int memArenaID, unsigned int heapSize) {
//     collectedHeapData.push(new HeapData {heapID, heapName, heapSize});
// }
// int frame = 0;

// INJECTION("GET_HEAP_OFFSET", 0x800246ec, R"(
//     SAVE_REGS
//     bl getHeapOffset
//     RESTORE_REGS
//     li r0, 1
// )");
// extern "C" void getHeapOffset(unsigned int heapOffset) {
//     collectedHeapData[collectedHeapData.size() - 1]->heapOffset = heapOffset;
// }

INJECTION("frameUpdate", 0x8001792c, R"(
    bl updateOnFrame
    addi r3, r30, 280
)");

extern "C" void updateOnFrame() {
    // if (collectedHeapData.size() > 0) {
    //     if (frame % collectedHeapData.size() == 0) {
    //         OSReport("========== HEAP INFOS ==========\n");
    //     }
    //     HeapData* d = collectedHeapData[frame % collectedHeapData.size()];
    //     OSReport("%s (%d): %08x @ %08x\n", d->heapName, d->id, d->heapSize, d->heapOffset);
    //     frame++;
    // }
    if (fudgeMenu == nullptr) {
        fudgeMenu = new Menu();
        Page* mainPage = new Page(fudgeMenu);
        mainPage->setTitle("main");

        PlayerPage* p1Page = new PlayerPage(fudgeMenu, 0);
        PageLink* p1PageLink = new PageLink("Player 1", p1Page);

        PlayerPage* p2Page = new PlayerPage(fudgeMenu, 1);
        PageLink* p2PageLink = new PageLink("Player 2", p2Page);

        PlayerPage* p3Page = new PlayerPage(fudgeMenu, 2);
        PageLink* p3PageLink = new PageLink("Player 3", p3Page);

        PlayerPage* p4Page = new PlayerPage(fudgeMenu, 3);
        PageLink* p4PageLink = new PageLink("Player 4", p4Page);
        
        mainPage->addOption(p1PageLink);
        mainPage->addOption(p2PageLink);
        mainPage->addOption(p3PageLink);
        mainPage->addOption(p4PageLink);
        // mainPage->addOption(new PageLink("Items", new ItemPage(fudgeMenu)));
        
        fudgeMenu->nextPage(mainPage);
    }
    
    // if (procTimer <= 0) {
    //     procTimer = 50;
    // }
    // OSReport("size: %d (%08x)\n", sizeof(MEMiHeapHead), sizeof(MEMiHeapHead));

    printer.setup();
    printer.drawBoundingBoxes(0);

    startNormalDraw();

    auto scene = getScene();
    printer.setup();

    Message * message = &printer.message;
    message->fontScaleX = 0.1;
    message->fontScaleY = 0.1;
    printer.lineHeight = 20 * message->fontScaleY;

    char buffer[200] = {};
    char aiInputBuffer[100] = {};

    message->xPos = 1;
    message->yPos = 1;
    message->zPos = 0;

    setupDrawPrimitives();

    PADButtons btn;
    btn.bits = PREVIOUS_PADS[0].button.bits | PREVIOUS_PADS[1].button.bits | PREVIOUS_PADS[2].button.bits | PREVIOUS_PADS[3].button.bits;
    auto cData = playerTrainingData[observePNum];
    paused = fudgeMenu->paused;
    visible = fudgeMenu->visible;
    bool selected = fudgeMenu->selected;
    if (btn.L && btn.R && btn.UpDPad && btn.B) {
        if (instantResponse) {
            fudgeMenu->toggle();
            instantResponse = false;
            SOUND_SYSTEM->playSE(34);
        }
    } else if (btn.L && btn.R && btn.DownDPad) {
        if (instantResponse) {
            if (selected) fudgeMenu->deselect();
            fudgeMenu->visible = false;
            fudgeMenu->paused = false;
            instantResponse = false;
        }
    } else if (visible) {
        if (btn.B && fudgeMenu->path.size() <= 1 && !selected) {
            if (instantResponse) {
                fudgeMenu->toggle();
                instantResponse = false;
                SOUND_SYSTEM->playSE(34);
            }
        } else if (btn.A && paused) {
            if (instantResponse) {
                fudgeMenu->select();
                instantResponse = false;
                SOUND_SYSTEM->playSE(1);
            }
        } else if (btn.B && paused) {
            if (instantResponse) {
                fudgeMenu->deselect();
                instantResponse = false;
                SOUND_SYSTEM->playSE(2);
            }
        } else if (btn.DownDPad) {
            timer -= 10;
            if (timer < 0 || instantResponse) {
                fudgeMenu->down();
                instantResponse = false;
                SOUND_SYSTEM->playSE(0);
            }
        } else if (btn.UpDPad && btn.L && selected && !paused) {
            if (instantResponse) {
                fudgeMenu->modify(-1);
                fudgeMenu->deselect();
                instantResponse = false;
                SOUND_SYSTEM->playSE(34);
            }
        } else if (btn.UpDPad) {
            timer -= 10;
            if (timer < 0 || instantResponse) {
                fudgeMenu->up();
                instantResponse = false;
                SOUND_SYSTEM->playSE(0);
            }
        } else if (btn.LeftDPad) {
            timer -= 10;
            if (timer < 0 || instantResponse) {
                fudgeMenu->modify(btn.Y ? -10 : -(btn.X ? 0.1 : 1));
                instantResponse = false;
                SOUND_SYSTEM->playSE(37);
            }
        } else if (btn.RightDPad) {
            timer -= 10;
            if (timer < 0 || instantResponse) {
                fudgeMenu->modify(btn.Y ? 10 : (btn.X ? 0.1 : 1));
                instantResponse = false;
                SOUND_SYSTEM->playSE(37);
            }
        } else {
            instantResponse = true;
            timer = 80;
            cmdDelay = 0;
        }
    } else if (paused && btn.B) {
        paused = false;
    } else {
        instantResponse = true;
        timer = 80;
        cmdDelay = 0;
    }
    if(scene == SCENE_TYPE::VS || scene == SCENE_TYPE::TRAINING_MODE_MMS) {        
        auto entryCount = FIGHTER_MANAGER->getEntryCount();
        for (int i = 0; i < entryCount; i++) {
            auto id = FIGHTER_MANAGER->getEntryIdFromIndex(i);

            auto fighter = FIGHTER_MANAGER->getFighter(id);
            auto input = FIGHTER_MANAGER->getInput(id);
            auto playerNum = FIGHTER_MANAGER->getPlayerNo(id);

            if (fighter == nullptr) continue;

            if (selectedPlayer == playerNum) {
                collectData(fighter, playerNum);
            }

            auto action = fighter->modules->statusModule->action;
            auto prevAction = fighter->modules->statusModule->previousAction;
            auto& currData = playerTrainingData[playerNum];
            if (currData.actionableOverlay) {
                auto CBM = fighter->modules->colorBlendModule;
                auto SMM = fighter->modules->motionModule;

                if (selectedPlayer != playerNum) {
                    if (currData.debug.psaData.action == prevAction) {
                        currData.hasPlayedSE = false;
                    }
                    currData.debug.psaData.prevAction = prevAction;
                    currData.debug.psaData.action = action;
                }

                if (fighter->getCancelModule()->isEnableCancel() == 1) {
                    CBM->isEnabled = true;
                    CBM->red = 0x00;
                    CBM->green = 0x88;
                    CBM->blue = 0x00;
                    CBM->alpha = 0x88;
                    if (currData.actionableSE != -1 && !currData.hasPlayedSE) {
                        SOUND_SYSTEM->playSE(currData.actionableSE);
                        currData.hasPlayedSE = true;
                    }
                } else if (action == 0x0 || action == 0x1 || action == 0x12 || action == 0x49 || ((action == 0x16 || action == 0x17) && SMM->mainAnimationData.animFrame > 4)) {
                    CBM->isEnabled = true;
                    CBM->red = 0x00;
                    CBM->green = 0xFF;
                    CBM->blue = 0x00;
                    CBM->alpha = 0x88;
                    if (currData.actionableSE != -1 && !currData.hasPlayedSE) {
                        SOUND_SYSTEM->playSE(currData.actionableSE);
                        currData.hasPlayedSE = true;
                    }
                } else {
                    CBM->isEnabled = false;
                }
            }
            auto xPos = (playerNum + 0.5) * (640 / 4);
            auto yPos = 75;
            #define IP_DISPLAY_SCALE 3
            if (currData.inputDisplay) {
                auto isHuman = !fighter->getOwner()->isCpu();
                auto& ipbtn = input->buttons;
                renderables.items.frame.push(new Rect (
                    xPos + (2) * IP_DISPLAY_SCALE,
                    yPos - (7.5) * IP_DISPLAY_SCALE,
                    (30) * IP_DISPLAY_SCALE,
                    (20) * IP_DISPLAY_SCALE,
                    true,
                    GXColor(0x000000AA)
                ));
                renderables.items.frame.push(new Rect (
                    xPos + (5) * IP_DISPLAY_SCALE,
                    yPos - (10) * IP_DISPLAY_SCALE,
                    (5) * IP_DISPLAY_SCALE,
                    (5) * IP_DISPLAY_SCALE,
                    true,
                    GXColor((isHuman ? currData.playerInputs.button.A : ipbtn.attack) ? 0x00FF00FF : 0x007700FF)
                ));
                renderables.items.frame.push(new Rect (
                    xPos + (0) * IP_DISPLAY_SCALE,
                    yPos - (8) * IP_DISPLAY_SCALE,
                    (2.5) * IP_DISPLAY_SCALE,
                    (2.5) * IP_DISPLAY_SCALE,
                    true,
                    GXColor((isHuman ? currData.playerInputs.button.B : ipbtn.special) ? 0xFF0000FF : 0x770000FF)
                ));
                renderables.items.frame.push(new Rect (
                    xPos + (5) * IP_DISPLAY_SCALE,
                    yPos - (15) * IP_DISPLAY_SCALE,
                    (5) * IP_DISPLAY_SCALE,
                    (2.5) * IP_DISPLAY_SCALE,
                    true,
                    GXColor((isHuman ? currData.playerInputs.button.Y : ipbtn.jump) ? 0xFFFFFFFF : 0x777777FF)
                ));
                
                renderables.items.frame.push(new Rect (
                    xPos + (10) * IP_DISPLAY_SCALE,
                    yPos - (10) * IP_DISPLAY_SCALE,
                    (2.5) * IP_DISPLAY_SCALE,
                    (5) * IP_DISPLAY_SCALE,
                    true,
                    GXColor((isHuman ? currData.playerInputs.button.X : ipbtn.jump) ? 0xFFFFFFFF : 0x777777FF)
                ));

                renderables.items.frame.push(new Rect (
                    xPos + (10) * IP_DISPLAY_SCALE,
                    yPos - (15) * IP_DISPLAY_SCALE,
                    (2.5) * IP_DISPLAY_SCALE,
                    (2.5) * IP_DISPLAY_SCALE,
                    true,
                    GXColor((isHuman ? currData.playerInputs.button.Z : (ipbtn.attack && ipbtn.shield)) ? 0x8800FFFF : 0x770077FF)
                ));

                renderables.items.frame.push(new Rect (
                    xPos - (5) * IP_DISPLAY_SCALE,
                    yPos - (10) * IP_DISPLAY_SCALE,
                    (5) * IP_DISPLAY_SCALE,
                    (5) * IP_DISPLAY_SCALE,
                    true,
                    GXColor(0x777777FF)
                ));

                renderables.items.frame.push(new Rect (
                    xPos - (5 - 2 * input->leftStickX) * IP_DISPLAY_SCALE,
                    yPos - (10 + 2 * input->leftStickY) * IP_DISPLAY_SCALE,
                    (1.5) * IP_DISPLAY_SCALE,
                    (1.5) * IP_DISPLAY_SCALE,
                    true,
                    GXColor(0xFFFFFFFF)
                ));

                if (isHuman) {
                    renderables.items.frame.push(new Rect (
                        xPos + (5) * IP_DISPLAY_SCALE,
                        yPos - (2) * IP_DISPLAY_SCALE,
                        (3) * IP_DISPLAY_SCALE,
                        (3) * IP_DISPLAY_SCALE,
                        true,
                        GXColor(0x777700FF)
                    ));

                    renderables.items.frame.push(new Rect (
                        xPos + (5 + 2 * currData.playerInputs.substickX / 100) * IP_DISPLAY_SCALE,
                        yPos - (2 + 2 * currData.playerInputs.substickY / 100) * IP_DISPLAY_SCALE,
                        (1.5) * IP_DISPLAY_SCALE,
                        (1.5) * IP_DISPLAY_SCALE,
                        true,
                        GXColor(0xFFDD00FF)
                    ));


                    renderables.items.frame.push(new Rect (
                        xPos - (10) * IP_DISPLAY_SCALE,
                        yPos - (12) * IP_DISPLAY_SCALE,
                        (2.5) * IP_DISPLAY_SCALE,
                        (9) * IP_DISPLAY_SCALE,
                        true,
                        GXColor(0x333333FF)
                    ));
                    float LTrigger = (float) currData.playerInputs.triggerLeft / 200;
                    renderables.items.frame.push(new Rect (
                        xPos - (10) * IP_DISPLAY_SCALE,
                        yPos - ((currData.playerInputs.button.L) ? 12 : (7.5 + 4 * LTrigger)) * IP_DISPLAY_SCALE,
                        (2.5) * IP_DISPLAY_SCALE,
                        (8 * LTrigger) * IP_DISPLAY_SCALE,
                        true,
                        GXColor(currData.playerInputs.button.L ? 0xFFFFFFFF : 0x888888FF)
                    ));

                    renderables.items.frame.push(new Rect (
                        xPos + (13.5) * IP_DISPLAY_SCALE,
                        yPos - (12) * IP_DISPLAY_SCALE,
                        (2.5) * IP_DISPLAY_SCALE,
                        (9) * IP_DISPLAY_SCALE,
                        true,
                        GXColor(0x333333FF)
                    ));

                    float RTrigger = (float) currData.playerInputs.triggerRight / 200;
                    renderables.items.frame.push(new Rect (
                        xPos + (13.5) * IP_DISPLAY_SCALE,
                        yPos - ((currData.playerInputs.button.R) ? 12 : (7.5 + 4 * RTrigger)) * IP_DISPLAY_SCALE,
                        (2.5) * IP_DISPLAY_SCALE,
                        (8 * RTrigger) * IP_DISPLAY_SCALE,
                        true,
                        GXColor(currData.playerInputs.button.R ? 0xFFFFFFFF : 0x888888FF)
                    ));
                } else {
                    renderables.items.frame.push(new Rect (
                        xPos + (5) * IP_DISPLAY_SCALE,
                        yPos - (2) * IP_DISPLAY_SCALE,
                        (2.5) * IP_DISPLAY_SCALE,
                        (2.5) * IP_DISPLAY_SCALE,
                        true,
                        GXColor(ipbtn.cStick ? 0xFFDD00FF : 0x777700FF)
                    ));

                    renderables.items.frame.push(new Rect (
                        xPos - (10) * IP_DISPLAY_SCALE,
                        yPos - (12) * IP_DISPLAY_SCALE,
                        (2.5) * IP_DISPLAY_SCALE,
                        (9) * IP_DISPLAY_SCALE,
                        true,
                        GXColor(ipbtn.shield ? 0xFFFFFFFF : 0x777777FF)
                    ));

                    renderables.items.frame.push(new Rect (
                        xPos + (13.5) * IP_DISPLAY_SCALE,
                        yPos - (12) * IP_DISPLAY_SCALE,
                        (2.5) * IP_DISPLAY_SCALE,
                        (9) * IP_DISPLAY_SCALE,
                        true,
                        GXColor(ipbtn.shield ? 0xFFFFFFFF : 0x777777FF)
                    ));
                }
                
                renderables.items.frame.push(new Rect (
                    xPos - (5) * IP_DISPLAY_SCALE,
                    yPos - (2) * IP_DISPLAY_SCALE,
                    (6) * IP_DISPLAY_SCALE,
                    (2) * IP_DISPLAY_SCALE,
                    true,
                    GXColor(ipbtn.sTaunt ? 0xFFFFFFFF : 0x777777FF)
                ));

                renderables.items.frame.push(new Rect (
                    xPos - (5) * IP_DISPLAY_SCALE,
                    yPos - (4) * IP_DISPLAY_SCALE,
                    (2) * IP_DISPLAY_SCALE,
                    (2) * IP_DISPLAY_SCALE,
                    true,
                    GXColor(ipbtn.uTaunt ? 0xFFFFFFFF : 0x777777FF)
                ));

                renderables.items.frame.push(new Rect (
                    xPos - (5) * IP_DISPLAY_SCALE,
                    yPos - (0) * IP_DISPLAY_SCALE,
                    (2) * IP_DISPLAY_SCALE,
                    (2) * IP_DISPLAY_SCALE,
                    true,
                    GXColor(ipbtn.dTaunt ? 0xFFFFFFFF : 0x777777FF)
                ));
            }
            if (currData.trajectoryOpts.active && fighter->modules->motionModule->mainAnimationData.animFrame >= 3) {
                GXColor playerColor;
                switch(playerNum) {
                    case 0: playerColor.value = 0xFF0000DD; break;
                    case 1: playerColor.value = 0x0000FFDD; break;
                    case 2: playerColor.value = 0x00FF00DD; break;
                    case 3: playerColor.value = 0xFFFF00DD; break;
                    default: playerColor.value = 0x222222DD; break;
                }
                auto sv = fighter->getOwner()->ftInputPtr->aiActPtr->scriptValues;
                auto fgm = fighter->modules->groundModule;
                float prevPosX = fgm->unk1->unk1->unk1->landingCollisionBottomXPos;
                float prevPosY = fgm->unk1->unk1->unk1->landingCollisionBottomYPos;
                float calcPosX;
                float calcPosY;
                int time = currData.trajectoryOpts.segmentLength;
                int opacityChange = (int)(255 / currData.trajectoryOpts.segments);
                float offset = (fgm->getUpPos().yPos - fgm->getDownPos().yPos) / 2;
                for (int seg = 0; seg < currData.trajectoryOpts.segments; seg++) {
                    calcPosX = sv->calcArrivePosX(time);
                    calcPosY = sv->calcArrivePosY(time);
                    renderables.items.frame.push(new Line{
                            playerColor,
                            prevPosX,
                            prevPosY + offset,
                            calcPosX,
                            calcPosY + offset,
                            21 * currData.trajectoryOpts.thickness,
                            false
                    });
                    playerColor.alpha -= opacityChange; 
                    prevPosX = calcPosX;
                    prevPosY = calcPosY;
                    time += currData.trajectoryOpts.segmentLength;
                }
            }
        }
        
        startNormalDraw();
        renderAllStoredHitboxes();
    }

    renderables.renderAll();
    startNormalDraw();
    if (infoLevel >= 1 && visible) {
        printer.setup();
        printer.start2D();

        message->fontScaleY = RENDER_SCALE_Y;
        message->fontScaleX = RENDER_SCALE_X;
        printer.lineHeight = 20 * message->fontScaleY;
        message->xPos = LEFT_PADDING;
        message->yPos = TOP_PADDING;
        fudgeMenu->render(&printer, buffer);
    }

    startNormalDraw();

    if (timer <= 0) {
        timer = 40 - (cmdDelay - (5 - cmdDelay % 5));
        cmdDelay += 1;
        // if (cmdDelay > 45) cmdDelay = 45;
    }
}

SIMPLE_INJECTION(updateUnpaused, 0x8082f140, "lwz r4, 0xc(r3)") {
    renderables.updateTick();
    storedHitboxTick();
    
    auto scene = getScene();
    if (scene == SCENE_TYPE::VS || scene == SCENE_TYPE::TRAINING_MODE_MMS) {
        auto entryCount = FIGHTER_MANAGER->getEntryCount();

        for (int i = 0; i < entryCount; i++) {
            auto id = FIGHTER_MANAGER->getEntryIdFromIndex(i);

            auto fighter = FIGHTER_MANAGER->getFighter(id);

            if (fighter == nullptr) continue;

            auto input = FIGHTER_MANAGER->getInput(id);
            auto pNum = FIGHTER_MANAGER->getPlayerNo(id);

            auto& currData = playerTrainingData[pNum];
            currData.playerInputs = PREVIOUS_PADS[pNum];

            auto& aiInput = fighter->getOwner()->ftInputPtr;
    
            currData.aiData.md = aiInput->aiMd;
            currData.aiData.target = aiInput->aiTarget;
            auto btn = aiInput->buttons;
            sprintf(currData.aiData.buttons, "");
            if (btn.attack == 1) strcat(currData.aiData.buttons, "A; "); 
            if (btn.special == 1) strcat(currData.aiData.buttons, "B; "); 
            if (btn.jump == 1) strcat(currData.aiData.buttons, "X; "); 
            if (btn.shield == 1) strcat(currData.aiData.buttons, "R; "); 
            if (btn.dTaunt == 1) strcat(currData.aiData.buttons, "DT; "); 
            if (btn.uTaunt == 1) strcat(currData.aiData.buttons, "UT; "); 
            if (btn.sTaunt == 1) strcat(currData.aiData.buttons, "ST; "); 
            currData.aiData.aiButtons = aiInput->buttons;
            currData.aiData.lstickX = aiInput->leftStickX;
            currData.aiData.lstickY = aiInput->leftStickY;

            // [0] = snapback enabled
            // [1] = leniency
            if (currData.aiData.scriptID == 0x8201 && ai_customFnInjection[0] > 0) {
                if (fighter->modules->statusModule->action == 0x1D) {
                    currData.aiData.snapbackShieldtimer = ai_customFnInjection[1];
                } else {
                    if (currData.aiData.snapbackShieldtimer <= 0) {
                        auto LAVars = fighter->modules->workModule->LAVariables;
                        auto LAFloatArr = (*(float (*)[LAVars->floatsSize])LAVars->floats);
                        LAFloatArr[0x3] = 50;
                    } else { 
                        currData.aiData.snapbackShieldtimer --; 
                    }
                }
            }
            
            if (currData.debug.enabled && (currData.debug.fixPosition || currData.debug.settingPosition)) {
                auto LAVars = fighter->modules->workModule->LAVariables;
                auto LABasicsArr = (*(int (*)[LAVars->basicsSize])LAVars->basics);
                auto remainingHitstun = LABasicsArr[56];
                if (remainingHitstun == 0 || remainingHitstun + currData.debug.comboTimerAdjustment <= 0) {
                    auto action = fighter->modules->statusModule->action;
                    if (currData.debug.noclip) { 
                        currData.debug.noclipInternal = true; 
                        fighter->modules->groundModule->setCorrect(0);
                    }
                    if (!((action >= 0x4E && action <= 0x64) || (action >= 0x3D && action <= 0x42))) {    
                        currData.debug.comboTimer--;
                        if (currData.debug.comboTimer == 0) {
                            currData.debug.noclipInternal = true;
                            fighter->modules->groundModule->setCorrect(0);
                            if (currData.debug.randomizeDamage) { currData.debug.randDmg = ((int)(_randf() * 100)); }
                            if (currData.debug.randomizePosition) { 
                                Vec3f pos;
                                getRandSafePosition(&pos, currData.debug.randOnGround);
                                currData.debug.randXPos = pos.f1;
                                currData.debug.randYPos = pos.f2;
                            }
                        }
                        if (currData.debug.comboTimer <= 0) {
                            setPosition(currData, fighter, input, entryCount);
                            if (fighter->modules->statusModule->action == 0x10) {
                                fighter->modules->statusModule->changeStatusForce(0xE, fighter->modules);
                            }
                            FIGHTER_MANAGER->getOwner(id)->setDamage(currData.debug.randomizeDamage ? currData.debug.randDmg : currData.debug.damage, 0);
                            currData.debug.comboTimer = 0;
                            if (!currData.debug.noclip && currData.debug.noclipInternal && currData.debug.comboTimer == -1) {
                                currData.debug.noclipInternal = false;
                                fighter->modules->groundModule->setCorrect(5);
                            }
                        }
                    }
                } else {
                    currData.debug.comboTimer = remainingHitstun + currData.debug.comboTimerAdjustment;
                }
            } else if (currData.debug.enabled && currData.debug.damage != 0) {
                FIGHTER_MANAGER->getOwner(id)->setDamage(currData.debug.damage, 0);
            }
        }
    }

}

int intendedScript = 0;
INJECTION("CPUStoreIntentionASM", 0x80918570, R"(
    SAVE_REGS
    mr r3, r4
    bl CPUStoreIntention
    RESTORE_REGS
    lhz r0, 0x78(r3)
)");
extern "C" void CPUStoreIntention(int intended) { 
    // OSReport("INTENDED: %08x\n", intended);
    intendedScript = intended; 
}
INJECTION("CPUForceBehavior", 0x809188B0, R"(
    SAVE_REGS
    mr r3, r26
    mr r4, r25
    bl CPUForceBehavior
    addi r26, r3, 0
    sth r26, 120(r25)
    RESTORE_REGS
)");
extern "C" short CPUForceBehavior(int param1, aiScriptData * aiActPtr) {
    char pNum = _GetPlayerNo_aiChrIdx(&aiActPtr->ftInputPtr->cpuIdx);
    if (playerTrainingData[pNum].aiData.scriptID == 0xFFFF) {
        OSReport("intermediate: %04x; ", aiActPtr->intermediateCurrentAiScript);
        OSReport("current: %04x; ", aiActPtr->aiScript);
        OSReport("next: %04x\n", intendedScript);

        return param1; // normal routine
    }

    auto action = aiActPtr->ftInputPtr->ftEntryPtr->ftStageObject->modules->statusModule->action;

    return (aiActPtr->intermediateNextAiScript != 0 || (action >= 0x34 && action <= 0x3B) || action == 0x4D || (action >= 0x74 && action <= 0x7C)) ? param1 : playerTrainingData[pNum].aiData.scriptID;
}