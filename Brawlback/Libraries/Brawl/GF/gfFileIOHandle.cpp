//
// Created by johno on 7/24/2020.
//

#include "gfFileIOHandle.h"

bool gfFileIOHandle::checkFileRequest(char* filePath) {
    return _checkFileRequest_GF_FILE_IO_HANDLE(this, filePath);
}
