//
// Created by johno on 6/2/2020.
//

#include "CSSTagMenuState.h"


CSSTagMenuState states[4];


//CSSTagMenuState::CSSTagMenuState(MuSelctChrList* nameList) {
//    this->nameList = nameList;
//}

bool CSSTagMenuState::isInMode(CSSTagMenuState::Mode mode) {
    return this->mode == mode;
}

void CSSTagMenuState::setMode(CSSTagMenuState::Mode mode) {
    this->mode = mode;
}

bool CSSTagMenuState::isOpen() {
    return mode != CLOSED;
}

bool CSSTagMenuState::isInTagSelect() {
    return mode == NAME_SELECT;
}

bool CSSTagMenuState::isInButtonSelect() {
    return mode == BUTTON_SELECT;
}

bool CSSTagMenuState::isEditingControls() {
    return mode == CONTROL_EDIT;
}

bool CSSTagMenuState::isOnPlayer() {
    return nameList->listPosition == 0;
}

bool CSSTagMenuState::isOnTag() {
    return nameList->listPosition > 0 && nameList->listPosition <= nameList->listSize;
}

int CSSTagMenuState::getPortFromList(MuSelctChrList *list) {
    //last char in PLAYER # is port number as char
    return list->playerStr[7] - '1';
}

int CSSTagMenuState::port() {
    return nameList->playerStr[7] - '1';
}

void CSSTagMenuState::enterButtonSelectFromTagSelect() {
    setMode(CSSTagMenuState::BUTTON_SELECT);
    oldNameListSize = nameList->listSize;
    oldNameListPosition = nameList->listPosition;
    nameList->listSize = GCButtonInfo.size() - 1;
    nameList->listPosition = 0;
    nameList->inNormalTagMenu = false;
    indexOfTagBeingEdited = nameList->listIndex2TagIndex[oldNameListPosition - 1];
}

void CSSTagMenuState::enterTagEditFromButtonSelect() {
    setMode(CSSTagMenuState::CONTROL_EDIT);
    oldButtonListPosition = nameList->listPosition;
    nameList->listSize = GCButtonInfo[oldButtonListPosition]->settings.size() - 1;
    nameList->listPosition = 0;
}

void CSSTagMenuState::enterButtonSelectFromTagEdit() {
    setMode(CSSTagMenuState::BUTTON_SELECT);
    nameList->listSize = GCButtonInfo.size() - 1;
    nameList->listPosition = oldButtonListPosition;
}

void CSSTagMenuState::enterTagSelectFromButtonSelect() {
    setMode(CSSTagMenuState::NAME_SELECT);
    nameList->listSize = oldNameListSize;
    nameList->listPosition = oldNameListPosition;
    nameList->inNormalTagMenu = true;
    indexOfTagBeingEdited = -1;
}

void CSSTagMenuState::open() {
    setMode(NAME_SELECT);
    nameList->inNormalTagMenu = true;
    indexOfTagBeingEdited = -1;
    indexOfTagBeingReplaced = -1;
    _isReplacingTag = false;
    shouldReopen = false;
}

void CSSTagMenuState::close() {
    setMode(CLOSED);
    nameList->inNormalTagMenu = false;
    indexOfTagBeingEdited = -1;
}

bool CSSTagMenuState::isTagSelectedByOtherPort(int menuPos) {
    int index = nameList->listIndex2TagIndex[menuPos - 1];
    for(int i = 0; i < 4; i++) {
        int tagIndex = nameList->otherSelectedTagIndices[i];
        if(tagIndex == index) {
            return true;
        }
    }
    return false;
}

bool CSSTagMenuState::isTagBeingEditedByOtherPort(int menuPos) {
    int index = nameList->listIndex2TagIndex[menuPos - 1];
    for(int i = 0; i < 4; i++) {
        int tagIndex = states[i].indexOfTagBeingEdited;
        if(tagIndex == index) {
            return true;
        }
    }
    return false;
}

void CSSTagMenuState::startReplaceTag() {
    int cssTagIndex = nameList->listPosition - 1;
    indexOfTagBeingReplaced = nameList->listIndex2TagIndex[cssTagIndex];
    _isReplacingTag = true;
}

bool CSSTagMenuState::isReplacingTag() {
    return _isReplacingTag;
}

void CSSTagMenuState::endReplaceTag() {
    indexOfTagBeingReplaced = -1;
    _isReplacingTag = false;
}


