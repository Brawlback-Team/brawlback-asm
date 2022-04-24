//
// Created by johno on 4/27/2020.
//

#include "CSSCustomControls.h"


//BASIC_INJECT("setMenuOpenFlag", 0x8069f254, "addi r11, sp, 32");
//extern "C" void setMenuOpenFlag(MuSelctChrList *list) {
//    states[CSSTagMenuState::getPortFromList(list)].open();
//}


/*BASIC_INJECT("setMenuOpenFlag", 0x8069b340, "stwu sp, -0x20(sp)");

extern "C" void setMenuOpenFlag(muSelCharPlayerArea& area) {
    states[CSSTagMenuState::getPortFromList(&area.muSelctChrList)].open();
}*/

int _TEMP_nameListPosition = 0;

INJECTION("setMenuOpenFlag", 0x8069b360, R"(
    SAVE_REGS
    bl setMenuOpenFlag
    cmpwi r3, 0
    RESTORE_REGS
    beq- _SKIP_setMenuOpenFlag
    lis r5, _TEMP_nameListPosition@ha
    lwz r5, _TEMP_nameListPosition@l(r5)
_SKIP_setMenuOpenFlag:
    addi r3, r3, 508
)");

extern "C" bool setMenuOpenFlag(muSelCharPlayerArea& area) {
    int port = CSSTagMenuState::getPortFromList(&area.muSelctChrList);
    auto& state = states[port];
    bool result = false;
    if(state.shouldReopen) {
        _TEMP_nameListPosition = state.indexOfTagBeingReplaced;
        result = true;
    }
    state.open();
    return result;
}

INJECTION("setMenuClosedFlag", 0x806a0714, R"(
    SAVE_REGS
    #r3 has list
    bl setMenuClosedFlag
    RESTORE_REGS
    stwu sp, -0x10(sp)
)");

extern "C" void setMenuClosedFlag(MuSelctChrList *list) {
    states[CSSTagMenuState::getPortFromList(list)].close();
}

//set r19 to -1 if should run, else set it to anything
//should run if in normal tag menu
//r24 is MuSelctChrList*
INJECTION("tellRumbleColorCodeToWorkOrNot", 0x8069f9e4, R"(
    lbz r19, 0x60(r24)
    neg r19, r19
    cmpwi r5, 0
)");


INJECTION("createCSSTagMenuStates", 0x8069f1b4, R"(
    SAVE_REGS
    andi. r4, r11, 0xF
    bl createCSSTagMenuStates
    RESTORE_REGS
    stw r4, 0x38(r3)
)");

extern "C" void createCSSTagMenuStates(MuSelctChrList *list, int portNum) {
    states[portNum - 1].nameList = list;
}


//INJECTION("controlMenuState", 0x80029738, R"(
//    SAVE_REGS
//    mr r3, r30
//    bl controlMenuState
//    RESTORE_REGS
//    lwz r0, 0x44(sp)
//)");


//r26 is MuSelctChrList ptr
INJECTION("controlMenuState", 0x806a0154, R"(
    SAVE_REGS
    mr r3, r26
    bl controlMenuState
    RESTORE_REGS
    lwz r4, 0x44(r26)
)");

//INJECTION("controlMenuState2", 0x806a01bc, R"(
//    SAVE_REGS
//    bl controlMenuState
//    RESTORE_REGS
//    lwz r0, 0x4(r26)
//)");
//
//INJECTION("controlMenuState3", 0x8069fe88, R"(
//    SAVE_REGS
//    lwz r4, 0x4(r3)
//    cmpwi r4, 3
//    bne- _SKIP
//    bl controlMenuState
//_SKIP:
//    RESTORE_REGS
//    stwu sp, -0x40(sp)
//)");


void controlMenuState(MuSelctChrList& list) {
    int port = CSSTagMenuState::getPortFromList(&list);
    controlPort(port, states[port]);
}



//INJECTION("negateInputs", 0x8069fe88, R"(
//    SAVE_REGS
//    bl negateInputs
//    RESTORE_REGS
//    stwu sp, -0x40(sp)
//)");


//r26 is MuSelctChrList ptr
INJECTION("negateInputs", 0x806a04bc, R"(
    SAVE_REGS
    mr r3, r26
    bl negateInputs
    RESTORE_REGS
    lfd f31, 0x30(sp)
)");

extern "C" void negateInputs(MuSelctChrList& list) {
    int port = CSSTagMenuState::getPortFromList(&list);
    CSSTagMenuState& state = states[port];
    //if in button select or control select
    if(state.isInButtonSelect() || state.isEditingControls()) {
        //negate inputs
        manager.setPersisentNegations({Start | X | Y | Z | A | B}, state.port());

        //if end of list
        if(state.nameList->listPosition >= state.nameList->listSize) {
            manager.clampStickY(127, 0, port);
            manager.setPersisentNegations({DownDPad}, port);
            state.nameList->listPosition = state.nameList->listSize;
        }
            //begining of list
        else if(state.nameList->listPosition <= 0) {
            manager.clampStickY(0, -128, port);
            manager.setPersisentNegations({UpDPad}, port);
            state.nameList->listPosition = 0;
        }
    }
}


//CSSTagMenuState* getTagOwner(int tagIndex) {

//}


void controlTagSelect(int port, CSSTagMenuState &state) {
    //if in bounds
    if(state.isOnTag()) {
        //if not on tag that is being edited or replaced or selected by someone else
        //if(getTagOwner(state.currentTag()) == nullptr)
        if(state.isTagSelectedByOtherPort(state.nameList->listPosition) == false) {
            if(state.isTagBeingEditedByOtherPort(state.nameList->listPosition) == false) {
                if(manager.truePresses[port].Y) {
                    state.enterButtonSelectFromTagSelect();
                } else if(manager.truePresses[port].Z) {
                    //change state to replacement
                    state.startReplaceTag();
                } else if(manager.truePresses[port].X) {
                    //toggle rumble
                    //not needed right now
                    //int CSSTagIndex = state.nameList->listPosition - 1;
                    //int trueTagIndex = state.nameList->listIndex2TagIndex[CSSTagIndex];
                    //PlayerTag* tag = &PLAYER_TAG_SYSTEM->tags[trueTagIndex];
                    //tag->rumble ^= true;
                } else if(manager.truePresses[port].Start) {
                    //pin tag
                    int firstTagIndex = state.nameList->listIndex2TagIndex[0];
                    PlayerTag* firstTag = &PLAYER_TAG_SYSTEM->tags[firstTagIndex];
                    int earliestCreationTime = firstTag->creationTime;

                    int CSSTagIndex = state.nameList->listPosition - 1;
                    int trueTagIndex = state.nameList->listIndex2TagIndex[CSSTagIndex];
                    PlayerTag* tag = &PLAYER_TAG_SYSTEM->tags[trueTagIndex];
                    tag->creationTime = earliestCreationTime - 1;
                }
            }
        }
    } else {
        //if on "Player #"
        if(state.isOnPlayer()) {
            //if X pressed
            if(manager.truePresses[port].X) {
                //toggle rumble for port
                //TODO: add 4 to port for Wiimote
                PORT_RUMBLE_SETTINGS[port] ^= true;
            }
        }
    }
}

void portButtonSelect(int port, CSSTagMenuState &state) {
    //if A pressed
    if(manager.truePresses[port].A) {
        state.enterTagEditFromButtonSelect();
    }
        //else if B is pressed
    else if(manager.truePresses[port].B) {
        state.enterTagSelectFromButtonSelect();
    }
    //prevent moving to create new tag options
    //if(state.nameList->listPosition == 0xFF) {

    //}
}

void changeTagButton(CSSTagMenuState &state) {
    int CSSTagIndex = state.oldNameListPosition - 1;
    int trueTagIndex = state.nameList->listIndex2TagIndex[CSSTagIndex];
    PlayerTag* tag = &PLAYER_TAG_SYSTEM->tags[trueTagIndex];
    ButtonInfo* button = GCButtonInfo[state.oldButtonListPosition];
    SettingInfo* setting = button->settings[state.nameList->listPosition];
    tag->GCSettings[button->offset] = setting->value;
}

void portEditControls(int port, CSSTagMenuState &state) {
    //if A pressed
    if(manager.truePresses[port].A) {
        //change controls
        changeTagButton(state);

        state.enterButtonSelectFromTagEdit();
    }
    //else if B is pressed
    else if(manager.truePresses[port].B) {
        state.enterButtonSelectFromTagEdit();
    }
}

void controlPort(int port, CSSTagMenuState& state) {
    //if port open
    if(state.isOpen()) {
        //if tag select
        if(state.isInTagSelect()) {
            controlTagSelect(port, state);
        }
        //else if in button select
        else if(state.isInButtonSelect()) {
            portButtonSelect(port, state);
        }
        //else if in control select
        else if(state.isEditingControls()) {
            portEditControls(port, state);
        }
    }
}


//r3 is MuSelctChrList
//r4 is buffer to write text
//r5 is position in menu
INJECTION("printToTagList", 0x8069f630, R"(
    SAVE_REGS
    bl printToTagList
    cmpwi r3, 0
    beq+ RUN_FUNCTION

SKIP_FUNCTION:
    RESTORE_REGS
    blr

RUN_FUNCTION:
    RESTORE_REGS
    stwu sp, -0x80(sp)
)");

//returns true if should skip Brawl function
extern "C" bool printToTagList(MuSelctChrList& tagList, char* writeLoc, int menuPos) {
    int port = CSSTagMenuState::getPortFromList(&tagList);
    auto state = states[port];
    if(state.isInButtonSelect()) {
        int CSSTagIndex = state.oldNameListPosition - 1;
        int trueTagIndex = state.nameList->listIndex2TagIndex[CSSTagIndex];
        PlayerTag* tag = &PLAYER_TAG_SYSTEM->tags[trueTagIndex];
        ButtonInfo* buttonInfo = GCButtonInfo[menuPos];
        char currentSetting = tag->GCSettings[buttonInfo->offset];
        SettingInfo* settingInfo;
        for(int i = 0; i < buttonInfo->settings.size(); i++) {
            if(buttonInfo->settings[i]->value == currentSetting) {
                settingInfo = buttonInfo->settings[i];
                break;
            }
        }
        sprintf(writeLoc, "%s: %s", buttonInfo->name, settingInfo->name);
        return true;
    }
    else if(state.isEditingControls()) {
        ButtonInfo* buttonInfo = GCButtonInfo[state.oldButtonListPosition];
        SettingInfo* settingInfo = buttonInfo->settings[menuPos];
        sprintf(writeLoc, "%s", settingInfo->name);
        return true;
    }
    return false;
}


INJECTION("openNameEntry", 0x8069b664, R"(
    SAVE_REGS
    mr r3, r31
    bl openNameEntry
    cmpwi r3, 0
    RESTORE_REGS
    beq- _SKIP
    li r23, 2
_SKIP:
)");


extern "C" bool openNameEntry(muSelCharPlayerArea& area) {
    int port = CSSTagMenuState::getPortFromList(&area.muSelctChrList);
    auto& state = states[port];
    if(state.isReplacingTag()) {
        return true;
    }
    return false;
}


int _TEMP_tagToReplace = 0;

INJECTION("replaceName", 0x8069b87c, R"(
    SAVE_REGS
    mr r3, r29
    bl replaceName
    cmpwi r3, 0
    RESTORE_REGS
    beq- _SKIP_replaceName
    lis r19, _TEMP_tagToReplace@ha
    lwz r19, _TEMP_tagToReplace@l(r19)
_SKIP_replaceName:
    mr r3, r20
)");


extern "C" bool replaceName(muSelCharPlayerArea& area) {
    int port = CSSTagMenuState::getPortFromList(&area.muSelctChrList);
    auto& state = states[port];
    if(state.isReplacingTag()) {
        state.shouldReopen = true;
        _TEMP_tagToReplace = state.indexOfTagBeingReplaced;
        return true;
    }
    return false;
}


//r3 is MuSelCharHand*
//r23 is muSelCharPlayerArea*
INJECTION("reopenNameMenu", 0x8068a27c, R"(
    SAVE_REGS
    mr r4, r23
    bl reopenNameMenu
    RESTORE_REGS
    #no replacement instruction
)");


extern "C" void reopenNameMenu(MuSelCharHand& hand, muSelCharPlayerArea& area) {
    int port = CSSTagMenuState::getPortFromList(&area.muSelctChrList);
    auto& state = states[port];
    if(state.shouldReopen) {
        hand.setMode(7, port);
        area.openNameList();
    }
    else {
        hand.setMode(0, 0);
    }
}

INJECTION("setNameMenuReopenFlag", 0x8069b9e8, R"(
    SAVE_REGS
    mr r3, r29
    bl setNameMenuReopenFlag
    RESTORE_REGS
    li r31, 1
)");

extern "C" void setNameMenuReopenFlag(muSelCharPlayerArea& area) {
    int port = CSSTagMenuState::getPortFromList(&area.muSelctChrList);
    auto& state = states[port];
    if(state.isReplacingTag()) {
        state.shouldReopen = true;
    }
}