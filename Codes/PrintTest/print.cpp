//
// Created by johno on 7/14/2020.
//

#include <Graphics/TextPrinter.h>
#include <Wii/PAD/PADStatus.h>
#include "Assembly.h"
#include "Memory.h"
#include "Graphics/Drawable.h"

#include "Brawl/FT/ftManager.h"
#include "Brawl/AI/aiMgr.h"

#include "Graphics/Draw.h"
#include "Brawl/Message.h"

#define sprintf ((int (*)(char* buffer, const char* format, ...)) 0x803f89fc)
#define strcat ((int (*)(char* destination, const char* source)) 0x803fa384)
#define strcmp ((int (*)(const char* str1, const char* str2)) 0x803fa3fc)
#define OSReport ((void (*)(const char* text, ...)) 0x801d8600)


char CAMERA_SCALE[] = "cam scale: %.3f";
char TARGET[] = "Target Idx: %d";
char LSTICK[] = "lstick: %.3f; %.3f";
char INPUTS_VALUE[] = "Inputs Value: %04x";
char INPUTS[] = "Inputs: %s";
char INPUTS_NAMES[][9] = {
        "attack ",
        "special ",
        "jump ",
        "shield ",
        "cstick ",
        "uTaunt ",
        "sTaunt ",
        "dTaunt ",
        "tapJump "
};
char AI_SCRIPT[] = "AI Script: %04x";
char AI_MD[] = "AI Md: %02x";
char SELECTED_SCRIPT[] = "Selected Script: %04x";
char LAST_SCRIPT_CHANGE[] = "script active for: %04d frames";
char VARIABLES[] = "Ai Vars:";
char VARIABLE[] = "[%02d]: %.3f";

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

float RENDER_X_SPACING = 80;
float RENDER_SCALE_X = 0.5;
float RENDER_SCALE_Y = 0.5;
float TOP_PADDING = 69; // nice
float LEFT_PADDING = 20;

// global variables used by CustomAiFunctions
double md_customFnInjection[0x10] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
bool md_customFnInjectionToggle[0x10] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
unsigned char md_customFnModIdx;

// global variables for the injection down-below
signed char timer = 5;
signed char cmdDelay = 50;
bool SpecialMode = false;
unsigned char infoLevel = 1;
unsigned char observePNum = 1;
bool aiCanCall = true;
int modeIdx = 0;
int md_debugThreshold = 20;
int md_debugTimer = 0;
double md_debugDamage = 0;
int md_debugTarget = 0;
const char *SpecialModes[] = {
        "OFF",
        "DEFAULT",
        "DEBUG",
        "MD"
};


unsigned short AIRoutineList[] = {
//region
        0xFFFF,
        0x0000,

        0x8000,
        0x8001,
        0x8002,
        0x8003,
        0x8004,
        0x8005,
        0x8006,
        0x8007,
        0x8008,
        0x8009,
        0x800A,
        0x800B,
        0x800C,
        0x800D,
        0x800E,
        0x800F,

        0x8010,
        0x8020,
        0x8021,
        0x8022,
        0x8023,
        0x8024,
        0x8030,
        0x8031,
        0x8032,
        0x8033,
        0x8040,
        0x8050,
        0x8051,
        0x8052,
        0x8053,
        0x8054,
        0x8055,
        0x8056,
        0x8057,
        0x8058,
        0x8060,
        0x8070,
        0x8071,
        0x8072,
        0x8080,
        0x8090,
        0x1010,
        0x1020,
        0x1030,
        0x1040,
        0x1050,
        0x1060,
        0x1070,
        0x1071,
        0x1072,
        0x1073,
        0x1074,
        0x1075,
        0x1076,
        0x1077,
        0x1078,
        0x1080,
        0x1090,
        0x10A0,
        0x10A1,
        0x10A2,
        0x10A3,
        0x10F0,
        0x1100,
        0x1120,
        0x1130,
        0x1140,
        0x1150,
        0x1160,
        0x1170,
        0x2010,
        0x2011,
        0x2012,
        0x2013,
        0x2014,
        0x2015,
        0x2016,
        0x2017,
        0x2018,
        0x2019,
        0x2020,
        0x2030,
        0x2040,
        0x2041,
        0x2042,
        0x2043,
        0x2044,
        0x2045,
        0x2046,
        0x2047,
        0x2048,
        0x2049,
        0x2050,
        0x2051,
        0x2060,
        0x2070,
        0x3010,
        0x3020,
        0x3030,
        0x3040,
        0x3050,
        0x3060,
        0x3080,
        0x3090,
        0x30A0,
        0x30B0,
        0x30D0,
        0x30E0,
        0x4010,
        0x4020,
        0x4030,
        0x4031,
        0x4032,
        0x4033,
        0x4034,
        0x4035,
        0x4036,
        0x4037,
        0x4038,
        0x4039,
        0x403A,
        0x403B,
        0x403C,
        0x403D,
        0x403E,
        0x403F,
        0x4040,
        0x4041,
        0x4042,
        0x4043,
        0x4044,
        0x4045,
        0x4046,
        0x4047,
        0x4048,
        0x4049,
        0x404A,
        0x404B,
        0x404C,
        0x404D,
        0x404E,
        0x404F,
        0x4050,
        0x4051,
        0x4052,
        0x4053,
        0x4054,
        0x4055,
        0x4056,
        0x4057,
        0x4058,
        0x4059,
        0x405A,
        0x405B,
        0x405C,
        0x405D,
        0x405E,
        0x405F,
        0x4060,
        0x4061,
        0x4062,
        0x4063,
        0x4064,
        0x4065,
        0x4066,
        0x4067,
        0x4068,
        0x4069,
        0x406A,
        0x406B,
        0x406C,
        0x406D,
        0x406E,
        0x406F,
        0x4070,
        0x4071,
        0x4072,
        0x4073,
        0x4074,
        0x4075,
        0x4076,
        0x4077,
        0x4078,
        0x4079,
        0x407A,
        0x407B,
        0x407C,
        0x407D,
        0x407E,
        0x407F,
        0x5000,
        0x5001,
        0x5002,
        0x5003,
        0x5004,
        0x5005,
        0x5006,
        0x5007,
        0x5008,
        0x5009,
        0x500A,
        0x500B,
        0x500C,
        0x500D,
        0x500E,
        0x500F,
        0x5010,

        0x6000,
        0x6001,
        0x6002,
        0x6003,
        0x6004,
        0x6005,
        0x6006,
        0x6007,
        0x6008,
        0x6009,
        0x600A,
        0x600B,
        0x600C,
        0x600D,
        0x600E,
        0x600F,

        0x601A,
        0x6022,
        0x6023,
        0x6024,
        0x6025,

        0x6031,
        0x6032,
        0x6033,
        0x6034,
        0x6035,
        0x6036,
        0x6037,
        0x6038,
        0x6039,
        0x603A,
        0x603B,
        0x603C,
        0x603D,

        0x6040,
        0x6041,
        0x6042,
        0x6043,
        0x6044,
        0x6045,
        0x6046,
        0x6047,
        0x6048,
        0x6049,

        0x6100,
        0x7001,
        0x7002,
        0x7003,
        0x7004,
        0x7005,
        0x7006,
        0x7007,
        0x7008,
        0x7009,
        0x700A,
        0x700B,
        0x700C,
        0x700D,
        0x700E,
        0x700F,
        0x7010
//endregion
};
int aiRoutineIdx = 0;


int forcedAiMd = 0;

// we need to do this manually for char-based ones :C
void ModSpecialIdx(int amount) {
    modeIdx += amount;
    if (modeIdx >= 4) {
        modeIdx = 0;
    } else if (modeIdx < 0) {
        modeIdx = 3;
    }
}

void ModAiRoutineIdx(int amount) {
    aiRoutineIdx += amount;
    if (aiRoutineIdx > sizeof(AIRoutineList) / 2) {
        aiRoutineIdx = 0;
    } else if (aiRoutineIdx <= 0) {
        aiRoutineIdx = sizeof(AIRoutineList) / 2;
    }
}

void ModCustomFnInjectIdx(int amount) {
    md_customFnModIdx += amount;
    if (md_customFnModIdx == 0xFF) md_customFnModIdx = 0xF;
    else if (md_customFnModIdx > 0xF) md_customFnModIdx = 0;
}

void ModInfoLevel(int amount) {
    infoLevel += amount;
    OSReport("infoLevel: %d", infoLevel);
    if (infoLevel == 255) infoLevel = 0;
    else if (infoLevel > 4) infoLevel = 4;
}

void ModObservePNum(int amount) {
    observePNum += amount;
    OSReport("oPNum: %d", observePNum);
    if (observePNum == 255) observePNum = 0;
    else if (observePNum > 3) observePNum = 3;
}

float fighterXPos = 0;
float fighterYPos = 0;
bool noClip = false;
char airGroundState = 0;
void setPosition(Fighter *fighter, ftInput *input, u8 numPlayers) {
    if (PREVIOUS_PADS[0].stickX < -5 || 5 < PREVIOUS_PADS[0].stickX)
        fighterXPos += (float) PREVIOUS_PADS[0].stickX * 3 / (float) (127 * numPlayers);
    airGroundState = fighter->modules->groundModule->unk1->unk1->airGroundState;
    if (airGroundState != 1) {
        if (PREVIOUS_PADS[0].stickY < -5 || 5 < PREVIOUS_PADS[0].stickY)
            fighterYPos += (float) PREVIOUS_PADS[0].stickY * 3 / (float) (127 * numPlayers);
    }

    fighter->modules->postureModule->xPos = fighterXPos;
    fighter->modules->postureModule->yPos = fighterYPos;
}

void setDamage(ftOwner * owner) {
    owner->setDamage(md_debugDamage, 0);
}

SIMPLE_INJECTION(testPrint, 0x8001792c, "addi r3, r30, 280") {
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

    if(scene == SCENE_TYPE::VS || scene == SCENE_TYPE::TRAINING_MODE_MMS) {
        auto entryCount = FIGHTER_MANAGER->getEntryCount();
        setupDrawPrimitives();
        printer.startNormal();

        renderables.renderAll();

        for(int i = 0; i < entryCount; i++) {
            printer.setup();
            printer.startNormal();
            _GXLoadPosMtxImm(&CAMERA_MANAGER->cameras[0].modelView, 0);
            auto id = FIGHTER_MANAGER->getEntryIdFromIndex(i);

            auto fighter = FIGHTER_MANAGER->getFighter(id);
            auto input = FIGHTER_MANAGER->getInput(id);

            if (forcedAiMd != 0) input->aiMd = forcedAiMd;

            auto xPos = fighter->modules->postureModule->xPos;
            auto yPos = fighter->modules->postureModule->yPos * -1;
            auto zPos = fighter->modules->postureModule->zPos;
//
            printer.lineHeight = 20 * 0.1;
            message->xPos = xPos + 5;
            message->yPos = yPos - printer.lineHeight * 6;
            message->fontScaleX = 0.1;
            message->fontScaleY = 0.1;
            printer.lineStart = xPos + 5;
//            message->zPos = zPos;
//
            if (infoLevel >= 3) {
                printer.startBoundingBox();
                if (infoLevel >= 4) {
                    auto target = AI_MANAGER->getAiCpuTarget(FIGHTER_MANAGER->getPlayerNo(id));

                    sprintf(buffer, TARGET, target);
                    printer.printLine(buffer);
                }
                //
                sprintf(buffer, LSTICK, input->leftStickX, input->leftStickY);
                printer.printLine(buffer);
                //
                //            sprintf(buffer, INPUTS_VALUE, input->buttons.bits);
                //            printer.printLine(buffer);
                //
                sprintf(aiInputBuffer, "");
                auto buttons = input->buttons;
                if (buttons.attack == 1) { strcat(aiInputBuffer, INPUTS_NAMES[0]); }
                if (buttons.special == 1) { strcat(aiInputBuffer, INPUTS_NAMES[1]); }
                if (buttons.jump == 1) { strcat(aiInputBuffer, INPUTS_NAMES[2]); }
                if (buttons.shield == 1) { strcat(aiInputBuffer, INPUTS_NAMES[3]); }
                if (buttons.cStick == 1) { strcat(aiInputBuffer, INPUTS_NAMES[4]); }
                if (buttons.uTaunt == 1) { strcat(aiInputBuffer, INPUTS_NAMES[5]); }
                if (buttons.sTaunt == 1) { strcat(aiInputBuffer, INPUTS_NAMES[6]); }
                if (buttons.dTaunt == 1) { strcat(aiInputBuffer, INPUTS_NAMES[7]); }
                //            if (buttons.tapJump == 1) { strcat(aiInputBuffer, INPUTS_NAMES[8]); }

                sprintf(buffer, INPUTS, aiInputBuffer);
                printer.printLine(buffer);
                //
                sprintf(buffer, AI_SCRIPT, input->aiActPtr->aiScript);
                printer.print(buffer);
                printer.padToWidth(RENDER_X_SPACING / 5);
                sprintf(buffer, AI_MD, input->aiMd);
                printer.print(buffer);
                //
                //            sprintf(buffer, LAST_SCRIPT_CHANGE, input->aiActPtr->framesSinceScriptChanged);
                //            printer.print(buffer);
                printer.saveBoundingBox(0, 0x00000088, 2);
            }

            auto playerNum = FIGHTER_MANAGER->getPlayerNo(id);
            if (playerNum == observePNum && infoLevel >= 1) {
                printer.setup();
                printer.start2D();

                message->fontScaleY = RENDER_SCALE_Y;
                message->fontScaleX = RENDER_SCALE_X;
                printer.lineHeight = 20 * message->fontScaleY;
                message->xPos = LEFT_PADDING;
                message->yPos = TOP_PADDING;

                printer.startBoundingBox();
                sprintf(buffer, "[player: %d]", playerNum + 1);
                printer.print(buffer);

                if (infoLevel >= 2) {
                    sprintf(buffer, "; AI Can Call?: %d", aiCanCall);
                    printer.print(buffer);
                }
                printer.printLine("");

                if (SpecialMode) { sprintf(buffer, "Selected Script: %s", SpecialModes[modeIdx]); }
                else { sprintf(buffer, SELECTED_SCRIPT, AIRoutineList[aiRoutineIdx]); }
                printer.printLine(buffer);

                if (strcmp(SpecialModes[modeIdx], "DEBUG") == 0 && infoLevel >= 2) {
                    auto player0 = FIGHTER_MANAGER->getFighter(FIGHTER_MANAGER->getEntryIdFromIndex(0));
                    auto LAVars = player0->modules->workModule->LAVariables;
                    auto LABasicsArr = (*(int (*)[LAVars->basicsSize])LAVars->basics);
                    auto remainingHitstun = LABasicsArr[56];

                    printer.padToWidth(RENDER_X_SPACING / 2);
                    sprintf(buffer, "hitstun: %d", remainingHitstun);
                    printer.print(buffer);

                    if (md_debugTimer > 0) printer.setTextColor(0xff8888ff);
                    printer.padToWidth(RENDER_X_SPACING);
                    sprintf(buffer, "timer (%d): %d", md_debugThreshold, md_debugTimer + remainingHitstun);
                    printer.printLine(buffer);
                    printer.setTextColor(0xffffffff);
                }

                if (infoLevel >= 2) {
                    printer.padToWidth(RENDER_X_SPACING / 2);
                    if (!md_customFnInjectionToggle[md_customFnModIdx]) printer.setTextColor(0xffffff88);
                    sprintf(buffer, "custom value [%d]: %.3f", md_customFnModIdx,
                            md_customFnInjection[md_customFnModIdx]);
                    printer.printLine(buffer);
                    printer.setTextColor(0xffffffff);

                    sprintf(buffer, "Injected:");
                    printer.printLine(buffer);

                    int printedCount = 0;
                    for (int j = 0; j < 0x10; j++) {
                        if (md_customFnInjectionToggle[j]) {
                            printedCount += 1;
                            if (printedCount % 7 == 0) { printer.newLine(); }
                            sprintf(buffer, "[%1x]: %.3f", j, md_customFnInjection[j]);
                            if (j == md_customFnModIdx) {
                                printer.setTextColor(0xffff00ff);
                                printer.print(buffer);
                                printer.setTextColor(0xffffffff);
                            } else {
                                printer.print(buffer);
                            }
                            printer.padToWidth(RENDER_X_SPACING);
                        }
                    }
                    printer.newLine();
                    printer.newLine();
                }

                sprintf(buffer, AI_SCRIPT, input->aiActPtr->aiScript);
                printer.print(buffer);
                printer.padToWidth(RENDER_X_SPACING + 10);
                sprintf(buffer, AI_MD, input->aiMd);
                printer.printLine(buffer);

                sprintf(aiInputBuffer, "");
                auto buttons = input->buttons;
                if (buttons.attack == 1) { strcat(aiInputBuffer, INPUTS_NAMES[0]); }
                if (buttons.special == 1) { strcat(aiInputBuffer, INPUTS_NAMES[1]); }
                if (buttons.jump == 1) { strcat(aiInputBuffer, INPUTS_NAMES[2]); }
                if (buttons.shield == 1) { strcat(aiInputBuffer, INPUTS_NAMES[3]); }
                if (buttons.cStick == 1) { strcat(aiInputBuffer, INPUTS_NAMES[4]); }
                if (buttons.uTaunt == 1) { strcat(aiInputBuffer, INPUTS_NAMES[5]); }
                if (buttons.sTaunt == 1) { strcat(aiInputBuffer, INPUTS_NAMES[6]); }
                if (buttons.dTaunt == 1) { strcat(aiInputBuffer, INPUTS_NAMES[7]); }

                sprintf(buffer, INPUTS, aiInputBuffer);
                printer.print(buffer);

                printer.padToWidth(RENDER_X_SPACING + 10);
                sprintf(buffer, LSTICK, input->leftStickX, input->leftStickY);
                printer.printLine(buffer);

                sprintf(buffer, LAST_SCRIPT_CHANGE, input->aiActPtr->framesSinceScriptChanged);
                printer.printLine(buffer);

                if (infoLevel >= 4) {
                    printer.newLine();
                    sprintf(buffer, VARIABLES);
                    printer.printLine(buffer);

                    auto aiVars = input->aiActPtr->variables;
                    for (int j = 0; j < 24; j++) {
                        if ((j+1) % 7 == 0) { printer.newLine(); }
                        sprintf(buffer, VARIABLE, j, aiVars[j]);
                        printer.print(buffer);
                        printer.padToWidth(RENDER_X_SPACING);
                    }
                }

                printer.saveBoundingBox(0, 0x00000088, 2);
            }
        }

//        renderables.renderAll();
        startNormalDraw();
    }

    if (PREVIOUS_PADS[0].button.R && PREVIOUS_PADS[0].button.Z) {
        if (PREVIOUS_PADS[0].button.A) {
            timer -= 10;
            if (timer <= 0) {
                aiCanCall = !aiCanCall;
            }
        }
        if (PREVIOUS_PADS[0].button.DownDPad) {
            timer -= 10;
            if (timer <= 0) {
                ModInfoLevel(-1);
            }
        }
        if (PREVIOUS_PADS[0].button.RightDPad) {
            timer -= 10;
            if (timer <= 0) {
                ModObservePNum(1);
            }
        } else if (PREVIOUS_PADS[0].button.LeftDPad) {
            timer -= 10;
            if (timer <= 0) {
                ModObservePNum(-1);
            }
        } else if (PREVIOUS_PADS[0].button.UpDPad) {
            timer -= 10;
            if (timer <= 0) {
                ModInfoLevel(1);
            }
        } else {
            cmdDelay = 0;
        }
    }
    else if (PREVIOUS_PADS[0].button.Z) {
        if (PREVIOUS_PADS[0].button.DownDPad) {
            timer -= 10;
            if (timer <= 0) {
                SpecialMode = !SpecialMode;
            }
        }
        if (PREVIOUS_PADS[0].button.RightDPad) {
            timer -= 10;
            if (timer <= 0) {
                if (SpecialMode) {
                    ModSpecialIdx(1);
                } else {
                    ModAiRoutineIdx(1);
                }
            }
        } else if (PREVIOUS_PADS[0].button.LeftDPad) {
            timer -= 10;
            if (timer <= 0) {
                if (SpecialMode) {
                    ModSpecialIdx(-1);
                } else {
                    ModAiRoutineIdx(-1);
                }
            }
        } else if (PREVIOUS_PADS[0].button.UpDPad) {
            timer -= 10;
            if (timer <= 0) {
                if (SpecialMode) {
                    ModSpecialIdx(-1);
                } else {
                    ModAiRoutineIdx(-1);
                }
            }
        } else {
            cmdDelay = 0;
        }
    } else if (PREVIOUS_PADS[0].button.A) {
        if (PREVIOUS_PADS[0].button.UpDPad) {
            timer -= 20;
            if (timer <= 0) {
                md_customFnInjection[md_customFnModIdx]++;
            }
        } else if (PREVIOUS_PADS[0].button.DownDPad) {
            timer -= 20;
            if (timer <= 0) {
                md_customFnInjection[md_customFnModIdx]--;
            }
        } else if (PREVIOUS_PADS[0].button.LeftDPad) {
            timer -= 20;
            if (timer <= 0) {
                md_customFnInjection[md_customFnModIdx] -= 0.05;
            }
        } else if (PREVIOUS_PADS[0].button.RightDPad) {
            timer -= 20;
            if (timer <= 0) {
                md_customFnInjection[md_customFnModIdx] += 0.05;
            }
        } else {
            cmdDelay = 0;
        }
    } else if (PREVIOUS_PADS[0].button.Y) {
        if (PREVIOUS_PADS[0].button.UpDPad) {
            timer -= 10;
            if (timer <= 0) {
                md_customFnInjectionToggle[md_customFnModIdx] = true;
            }
        } else if (PREVIOUS_PADS[0].button.DownDPad) {
            timer -= 10;
            if (timer <= 0) {
                md_customFnInjectionToggle[md_customFnModIdx] = false;
            }
        } else if (PREVIOUS_PADS[0].button.LeftDPad) {
            timer -= 20;
            if (timer <= 0) {
                ModCustomFnInjectIdx(-1);
                OSReport("CustomFnIdx: %d\n", md_customFnModIdx);
            }
        } else if (PREVIOUS_PADS[0].button.RightDPad) {
            timer -= 20;
            if (timer <= 0) {
                ModCustomFnInjectIdx(1);
                OSReport("CustomFnIdx: %d\n", md_customFnModIdx);
            }
        } else {
            cmdDelay = 0;
        }
    } else if (strcmp(SpecialModes[modeIdx], "MD") == 0) {
        if (PREVIOUS_PADS[0].button.LeftDPad) {
            timer -= 8;
            if (timer <= 0 && 0 < forcedAiMd) {
                forcedAiMd--;
            }
        } else if (PREVIOUS_PADS[0].button.RightDPad) {
            timer -= 8;
            if (timer <= 0 && forcedAiMd < 0x20) {
                forcedAiMd++;
            }
        } else {
            cmdDelay = 0;
        }
    } else if (strcmp(SpecialModes[modeIdx], "DEBUG") == 0) {
        if (PREVIOUS_PADS[0].button.UpDPad) {
            timer -= 20;
            if (timer <= 0 && md_debugDamage < 999) {
                md_debugDamage++;
            }
        } else if (PREVIOUS_PADS[0].button.DownDPad) {
            timer -= 20;
            if (timer <= 0 && md_debugDamage > 0) {
                md_debugDamage--;
            }
        } else if (PREVIOUS_PADS[0].button.LeftDPad) {
            timer -= 10;
            if (timer <= 0) {
                md_debugThreshold--;
            }
        } else if (PREVIOUS_PADS[0].button.RightDPad) {
            timer -= 10;
            if (timer <= 0) {
                md_debugThreshold++;
            }
        } else if (PREVIOUS_PADS[0].button.RightDPad) {
            timer -= 20;
            OSReport("Timer: %d\n", timer);
            if (timer <= 0) {
                ModCustomFnInjectIdx(1);
                OSReport("CustomFnIdx: %d\n", md_customFnModIdx);
            }
        } else {
            cmdDelay = 0;
        }
    } else {
        timer = 50;
        cmdDelay = 0;
    }
    if (timer <= 0) {
//        timer = 50;
        timer = 50 - (cmdDelay - (5 - cmdDelay % 5));
        cmdDelay += 1;
        if (cmdDelay > 45) cmdDelay = 45;
    }
}


SIMPLE_INJECTION(updateUnpaused, 0x8082f140, "lwz r4, 0xc(r3)") {
    //for (int i = 0; i < 4; i++) {
//        vector<Drawable> * d;
//        if (i == 0) d = (vector<Drawable>*) &renderables.points.tick;
//        else if (i == 1) d = (vector<Drawable>*) &renderables.lines.tick;
//        else if (i == 2) d = (vector<Drawable>*) &renderables.rectOutlines.tick;
//        else if (i == 3) d = (vector<Drawable>*) &renderables.rects.tick;
//
//        for (int j = 0; j < (*d).size(); j++) {
//            if ((*d)[j].delay == 0) {
//                (*d)[j].lifeTime --;
//            } else {
//                (*d)[j].delay --;
//            }
//            if ((*d)[j].lifeTime == 0) {
//                (*d).erase(j);
//            }
//        }
//    }
    renderables.updateTick();

    auto scene = getScene();
    if(scene == SCENE_TYPE::VS || scene == SCENE_TYPE::TRAINING_MODE_MMS) {
        auto entryCount = FIGHTER_MANAGER->getEntryCount();

        for (int i = 0; i < entryCount; i++) {
            auto id = FIGHTER_MANAGER->getEntryIdFromIndex(i);

            auto fighter = FIGHTER_MANAGER->getFighter(id);
            auto input = FIGHTER_MANAGER->getInput(id);

            if (FIGHTER_MANAGER->getPlayerNo(id) == 0) {
                if (strcmp(SpecialModes[modeIdx], "DEBUG") == 0) {
                    auto LAVars = fighter->modules->workModule->LAVariables;
                    auto LABasicsArr = (*(int (*)[LAVars->basicsSize])LAVars->basics);
                    auto remainingHitstun = LABasicsArr[56];
                    if (remainingHitstun == 0 || remainingHitstun + md_debugThreshold <= 0) {
                        md_debugTimer--;
                        if (md_debugTimer == 0) {
                            noClip = true;
                            fighter->modules->groundModule->setCorrect(0);
                        }
                        if (md_debugTimer <= 0) {
                            if (noClip && md_debugTimer == -1) {
                                noClip = false;
                                fighter->modules->groundModule->setCorrect(5);
                            }
                            setPosition(fighter, input, entryCount);
                            setDamage(FIGHTER_MANAGER->getOwner(id));
                            md_debugTimer = 0;
                        }
                    } else {
                        md_debugTimer = md_debugThreshold;
                    }
                }
            }
        }
    }

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
    if (AIRoutineList[aiRoutineIdx] == 0xFFFF || strcmp(SpecialModes[modeIdx], "DEFAULT") == 0) {
        OSReport("intermediate: %04x; ", aiActPtr->intermediateCurrentAiScript);
        OSReport("current: %04x; ", aiActPtr->aiScript);
        OSReport("next: %04x\n", param1);

        return param1; // normal routine
    }
    // forced routines
    return (aiActPtr->intermediateNextAiScript != 0 && aiCanCall) ? param1 : AIRoutineList[aiRoutineIdx];
}