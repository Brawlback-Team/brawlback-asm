//
// Created by johno on 7/20/2020.
//

#ifndef PROJECTMCODES_GFAPPLICATION_H
#define PROJECTMCODES_GFAPPLICATION_H



//The object that controls the main loop
struct gfApplication {
    char _spacer[0xEC];
    //0xEC
    //everything in 0x07C00000 seems to be some type of pause flag
    //0x01000000 is 1 if game paused, else 0
    //0x4 seems to be set if actually in a game (including results screen)
    //0x10 might be if to reset graphics somehow
    u32 _gameFlags;
};


#define GF_APPLICATION ((gfApplication*) 0x805b4fd8)


#endif //PROJECTMCODES_GFAPPLICATION_H
