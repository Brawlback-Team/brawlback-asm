//
// Created by johno on 7/13/2020.
//

#ifndef PROJECTMCODES_GFCAMERAMANAGER_H
#define PROJECTMCODES_GFCAMERAMANAGER_H

#include "gfCamera.h"


struct gfCameraManager {
    gfCamera cameras[6];
    //I thought these were garbage, but they are definitly used
    //something to do with aspect ratio?
    float something1;
    float something2;
};


//Despite being called getManager, seems to return pointer to current gfCamera instance
#define _getManager_gfCameraManager ((gfCameraManager* (*)()) 0x80019FA4)

#define CAMERA_MANAGER ((gfCameraManager*) 0x805b6d20)

#endif //PROJECTMCODES_GFCAMERAMANAGER_H
