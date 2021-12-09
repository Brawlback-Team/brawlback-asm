//
// Created by johno on 7/15/2020.
//

#include "ftManager.h"

playerNumber ftManager::getPlayerNo(entryID entry) {
    return _getPlayerNo_ftManager(this, entry);
}

entryID ftManager::getEntryId(playerNumber playerNo) {
    return _getEntryID_ftManager(this, playerNo);
}

ftOwner * ftManager::getOwner(entryID entry) {
    return _getOwner_ftManager(this, entry);
}

entryID ftManager::getEntryIdFromIndex(int index) {
    return _getEntryIDFromIndex_ftManager(this, index);
}

Fighter* ftManager::getFighter(entryID entry, bool getFollower) {
    return _getFighter_ftManager(this, entry, getFollower);
}

unsigned int ftManager::getFighterCount(entryID entry) {
    return _getFighterCount_ftManager(this, entry);
}

aiInput* ftManager::getInput(entryID entry) {
    return _getInput_ftManager(this, entry);
}

int ftManager::getEntryCount() {
    return _getEntryCount_ftManager(this);
}

void ftManager::setSlow(int excludeTeam, int unknown, int slowStrength, int durationInFrames) {
    return _setSlow_ftManager(this, excludeTeam, unknown, slowStrength, durationInFrames);
}

bool ftManager::isCpuActive(entryID entry) {
    return _isCpuActive_ftManager(this, entry);
}