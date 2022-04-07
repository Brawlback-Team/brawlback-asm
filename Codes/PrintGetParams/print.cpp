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

// #define sprintf ((int (*)(char* buffer, const char* format, ...)) 0x803f89fc)
#define strcat ((int (*)(char* destination, const char* source)) 0x803fa384)
#define strcmp ((int (*)(const char* str1, const char* str2)) 0x803fa3fc)
#define OSReport ((void (*)(const char* text, ...)) 0x801d8600)

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
// number, type, value
char VARIABLE[] = "[%02d]:[%3d]: %s";
// unknown, float, int, indefinite
struct Data {
    unsigned int id;
    unsigned char timer;
    virtual void printValue(char* buf) {};
};
struct indefiniteData : Data {
    indefiniteData(unsigned int id, char timer, int value) {
        this->id = id;
        this->timer = timer;
        this->value = value;
    }

    void printValue(char* buf) {
        sprintf(buf, "%08x", this->value);
    }
    int value;
};
struct intData : Data {
    intData(unsigned int id, char timer, int value) {
        this->id = id;
        this->timer = timer;
        this->value = value;
    }

    void printValue(char* buf) {
        sprintf(buf, "%i", this->value);
    }
    int value;
};
struct floatData : Data {
    floatData(unsigned int id, char timer, float value) {
        this->id = id;
        this->timer = timer;
        this->value = value;
    }

    void printValue(char* buf) {
        sprintf(buf, "%.3f", this->value);
    }
    float value;
};

Fighter* targetFighter;
vector<Data *> dataTracker;


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

// global variables for the injection down-below
signed char timer = 5;
signed char cmdDelay = 50;
bool DebugMode = false;
unsigned char infoLevel = 2;
unsigned char observePNum = 1;
bool aiCanCall = true;
int modeIdx = 0;
int viewShift = 0;
int md_debugThreshold = 20;
int md_debugTimer = 0;
double md_debugDamage = 0;
int md_debugTarget = 0;
const char *variableMode[] = {
        "int",
        "float",
        "indefinite",
};

INJECTION("log_param_indefinite", 0x80857678, R"(
    SAVE_REGS
    bl logParamIndefinite
    RESTORE_REGS
    blr
)")

INJECTION("log_param_int", 0x80857644, R"(
    SAVE_REGS
    bl logParamInt
    RESTORE_REGS
    blr
)")

INJECTION("log_param_float", 0x8085765c, R"(
    SAVE_REGS
    bl logParamFloat
    RESTORE_REGS
    blr
)")

INJECTION("store_valAcc_indef", 0x80857660, R"(
    SAVE_REGS
    bl storeCurrentFtValueAccesser
    RESTORE_REGS
    mulli r4,r4,0x5C
)")
INJECTION("store_valAcc_int", 0x8085762c, R"(
    SAVE_REGS
    bl storeCurrentFtValueAccesser
    RESTORE_REGS
    mulli r4,r4,0x6C
)")
INJECTION("store_valAcc_float", 0x80857648, R"(
    SAVE_REGS
    bl storeCurrentFtValueAccesser
    RESTORE_REGS
    mulli r4,r4,0x1C8
)")

extern "C" {
    void * currentFtValueAccesser = 0;
    void storeCurrentFtValueAccesser(void * offs) { currentFtValueAccesser = offs; }
    void logParamInt(int value, int unkOffset, unsigned int id) {
        if (modeIdx == 0 && targetFighter != nullptr && currentFtValueAccesser == targetFighter->modules->paramCustomizeModule) {
            signed char found = -1;
            for (int i = 0; i < dataTracker.size(); i++) {
                if (dataTracker[i]->id == id) {
                    found = i;
                }
            }
            if (found == -1) {
                Data * v = new intData { id, 255, value };
                dataTracker.push(v);
            }
            else { dataTracker[found]->timer = 255; }
        }
    };
    void logParamFloat(float value, int _, int _2, unsigned int id) {
        if (modeIdx == 1 && targetFighter != nullptr && currentFtValueAccesser == targetFighter->modules->paramCustomizeModule) {
            signed char found = -1;
            for (int i = 0; i < dataTracker.size(); i++) {
                if (dataTracker[i]->id == id) {
                    found = i;
                }
            }
            if (found == -1) {
                Data * v = new floatData { id, 255, value };
                dataTracker.push(v);
            }
            else { dataTracker[found]->timer = 255; }
        }
    };
    void logParamIndefinite(int value, int unkOffset, unsigned int id) {
        if (modeIdx == 2 && targetFighter != nullptr && currentFtValueAccesser == targetFighter->modules->paramCustomizeModule) {
            signed char found = -1;
            for (int i = 0; i < dataTracker.size(); i++) {
                if (dataTracker[i]->id == id) {
                    found = i;
                }
            }
            if (found == -1) {
                Data * v = new indefiniteData { id, 255, value };
                dataTracker.push(v);
            }
            else { dataTracker[found]->timer = 255; }
        }
    };
}

// we need to do this manually for char-based ones :C
void ModTrackType(int amount) {
    dataTracker.clear();
    viewShift = 0;
    modeIdx += amount;
    if (modeIdx >= 3) {
        modeIdx = 0;
    } else if (modeIdx < 0) {
        modeIdx = 2;
    }
}

void ModViewShift(int amount) {
    viewShift += amount;
    if (viewShift < 0) viewShift = 0;
    else if (viewShift > dataTracker.size() - 1) viewShift = dataTracker.size() - 1;
}

void ModInfoLevel(int amount) {
    infoLevel += amount;
    if (infoLevel == 255) infoLevel = 0;
    else if (infoLevel > 2) infoLevel = 2;
}

void ModObservePNum(int amount) {
    observePNum += amount;
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

    char buffer[500] = {};
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
                targetFighter = fighter;
                printer.printLine(buffer);
                printer.newLine();

                if (DebugMode && infoLevel >= 2) {
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

                printer.newLine();
                sprintf(buffer, variableMode[modeIdx]);
                printer.printLine(buffer);

                int initialShift = viewShift % 3;
                for (int j = viewShift; j < viewShift + 9 && j < dataTracker.size(); j++) {
                    char tempBuffer[100] = {};
                    Data * d = dataTracker[j];
                    d->printValue(tempBuffer);
                    sprintf(buffer, VARIABLE, d->id, d->timer, tempBuffer);

                    printer.setTextColor((0xFFFF << 16) | ((0xFF - d->timer) << 8) | 0xFF);
                    printer.print(buffer);
                    printer.padToWidth(RENDER_X_SPACING);
                    printer.padToWidth(RENDER_X_SPACING);
                    if ((j - initialShift) % 3 == 2) { printer.newLine(); }
                }
                printer.setTextColor(0xffffffff);

                printer.saveBoundingBox(0, 0x00000088, 2);
            }
        }

//        renderables.renderAll();
        startNormalDraw();
    }

    if (PREVIOUS_PADS[0].button.R && PREVIOUS_PADS[0].button.Z) {
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
    } else if (PREVIOUS_PADS[0].button.Z) {
        if (PREVIOUS_PADS[0].button.DownDPad) {
            timer -= 10;
            if (timer <= 0) {
                DebugMode = !DebugMode;
                if (noClip && targetFighter != nullptr) { targetFighter->modules->groundModule->setCorrect(5); }
                noClip = false;
            }
        }
        if (PREVIOUS_PADS[0].button.RightDPad) {
            timer -= 5;
            if (timer <= 0) {
                ModTrackType(1);
            }
        } else if (PREVIOUS_PADS[0].button.LeftDPad) {
            timer -= 5;
            if (timer <= 0) {
                ModTrackType(-1);
            }
        } else if (PREVIOUS_PADS[0].button.UpDPad) {
            timer -= 10;
            if (timer <= 0 && DebugMode && targetFighter != nullptr) {
                noClip = !noClip;
                if (noClip) { targetFighter->modules->groundModule->setCorrect(0); }
                else { targetFighter->modules->groundModule->setCorrect(5); }
            }
        } else {
            cmdDelay = 0;
        }
    } else if (PREVIOUS_PADS[0].button.A) {
        if (PREVIOUS_PADS[0].button.DownDPad) {
            timer -= 10;
            if (timer <= 0) {
                ModViewShift(3);
            }
        }
        if (PREVIOUS_PADS[0].button.RightDPad) {
            timer -= 10;
            if (timer <= 0) {
                ModViewShift(1);
            }
        } else if (PREVIOUS_PADS[0].button.LeftDPad) {
            timer -= 10;
            if (timer <= 0) {
                ModViewShift(-1);
            }
        } else if (PREVIOUS_PADS[0].button.UpDPad) {
            timer -= 10;
            if (timer <= 0) {
                ModViewShift(-3);
            }
        } else {
            cmdDelay = 0;
        }
    } else if (DebugMode) {
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
    renderables.updateTick();

    for (int i = 0; i < dataTracker.size(); i++) {
        if (dataTracker[i]->timer > 0) {
            dataTracker[i]->timer -= 1;
        }
    }

    auto scene = getScene();
    if(scene == SCENE_TYPE::VS || scene == SCENE_TYPE::TRAINING_MODE_MMS) {
        auto entryCount = FIGHTER_MANAGER->getEntryCount();

        for (int i = 0; i < entryCount; i++) {
            auto id = FIGHTER_MANAGER->getEntryIdFromIndex(i);

            auto fighter = FIGHTER_MANAGER->getFighter(id);
            auto input = FIGHTER_MANAGER->getInput(id);

            if (FIGHTER_MANAGER->getPlayerNo(id) == 0) {
                if (DebugMode) {
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