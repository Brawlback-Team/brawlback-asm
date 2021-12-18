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
