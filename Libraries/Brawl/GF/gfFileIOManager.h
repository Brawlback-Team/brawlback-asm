//
// Created by johno on 9/24/2020.
//

#ifndef PROJECTMCODES_GFFILEIOMANAGER_H
#define PROJECTMCODES_GFFILEIOMANAGER_H


#include <stdtypes.h>

struct gfFileIOManager {
    //1 is replay, 0 is normal match?
    void setSyncMode(int syncMode);

    char _spacer[0x98];

    //0x98
    //0x40 seems to be all files loaded flag
    //set if true
    u8 flags;
};


#define FILE_MANAGER_PTR ((gfFileIOManager**) 0x8059fff4)
//Technically not confirmed but should be ok
#define FILE_MANAGER ((gfFileIOManager*) 0x805ca1c0)

#define FILE_MANAGER_ALL_FILES_LOADED_FLAG (0x40)


#define _setSyncMode_gfFileIOManager ((void (*)(gfFileIOManager* self, int syncMode)) 0x800237a0)

#endif //PROJECTMCODES_GFFILEIOMANAGER_H
