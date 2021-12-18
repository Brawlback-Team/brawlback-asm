//
// Created by johno on 6/29/2020.
//

#ifndef PROJECTMCODES_MUSELCHARHAND_H
#define PROJECTMCODES_MUSELCHARHAND_H


struct MuSelCharHand {


    void setMode(int handMode, int port);
};


#define MuSelCharHand_setMode ((void (*)(MuSelCharHand* self, int handMode, int port)) 0x8069cc0c)


#endif //PROJECTMCODES_MUSELCHARHAND_H
