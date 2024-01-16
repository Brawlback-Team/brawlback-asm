//
// Created by dareb on 7/16/2020.
//

#include "aiMgr.h"

entryID aiManager::getAiCpuTarget(int port_number) {
    return _getAiCpuTarget_aiManager(this, port_number);
}

ATKDEntry* aiManager::searchAtkData(int targetCharID, int targetSubactionID) {
    return _searchAtkData_aiManager(this, targetCharID, targetSubactionID);
}

