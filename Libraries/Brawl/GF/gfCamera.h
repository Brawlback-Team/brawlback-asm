//
// Created by johno on 7/13/2020.
//

#ifndef PROJECTMCODES_GFCAMERA_H
#define PROJECTMCODES_GFCAMERA_H

#include "stdtypes.h"


typedef f32	Mtx[3][4];

//size is 0x134
struct gfCamera {
    void setGX();
    //0
    //probbaly an array of these
    Mtx modelView;



    char _spacer[0xD8 - 3 * 4 * 4];

    //0xD8
    //seems to be how large everything is
    //could be a bunch of camera related things though
    //use it to scale text
    f32 scale;


    char _spacer2[0x134 - 0xD8 - 4];
};

//changes the GX settings so they use the given camera
#define _setGX_gfCamera ((void (*)(gfCamera* camera)) 0x80018de4)

#endif //PROJECTMCODES_GFCAMERA_H
