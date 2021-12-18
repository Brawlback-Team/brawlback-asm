//
// Created by johno on 9/26/2020.
//

#ifndef PROJECTMCODES_SCMELEE_H
#define PROJECTMCODES_SCMELEE_H


#include <stddef.h>

struct scMelee {
    char _spacer[0xD8];

    //0xD8
    //0x20 is game end flag
    //is on in game, clear to trigger game end
    u8 flags;
};


#define SC_MELEE_GAME_END_FLAG (0x20)

#define SC_MELEE ((scMelee*) 0x90ff50c0)

#endif //PROJECTMCODES_SCMELEE_H
