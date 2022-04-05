//
// Created by johno on 7/2/2020.
//

#include "muCollectionViewer.h"

int muCollectionViewer::getCurFileID() {
    return _getCurFileID_muCollectionViewer(this);
}


void muCollectionViewer::getFileHandle(char* buffer, muCollectionViewer* base, int fileID) {
    _getFileHandle_muCollectionViewer(buffer, base, fileID, 0xBEEF);
}

void muCollectionViewer::numPanel(int param_1, u8 *param_2, int param_3) {
    _numPanel_muCollectionViewer(param_1, param_2, param_3, this);
}

void muCollectionViewer::createObjResFile(int param_1, char *param_2) {
    _createObjResFile_muCollectionViewer(param_1, param_2, this);
}