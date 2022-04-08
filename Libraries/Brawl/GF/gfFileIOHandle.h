//
// Created by johno on 7/24/2020.
//

#ifndef PROJECTMCODES_GFFILEIOHANDLE_H
#define PROJECTMCODES_GFFILEIOHANDLE_H


// #include "stdtypes.h"
#include "gfFileIORequest.h"

struct gfFileIOHandle {
    //0
    gfFileIORequest* request;

    bool checkFileRequest(char* filePath);
};


#define _checkFileRequest_GF_FILE_IO_HANDLE ((bool (*)(gfFileIOHandle* self, char* filePath)) 0x80020c88)
//Returns true if no errors
#define _readRequest_GF_FILE_IO_HANDLE ((bool (*)(gfFileIOHandle* self, char* path, u32 memoryPoolIndex)) 0x80021498)
#define _isReady_GF_FILE_IO_HANDLE ((bool (*)(gfFileIOHandle* self)) 0x80021f38)

#endif //PROJECTMCODES_GFFILEIOHANDLE_H
