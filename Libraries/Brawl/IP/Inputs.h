//
// Created by johno on 7/1/2020.
//

#ifndef PROJECTMCODES_INPUTS_H
#define PROJECTMCODES_INPUTS_H


//This is a representatin of the inputs the fighter uses to choose actions
//Need to check all values
union Inputs {
    unsigned short bits;
    struct {
        //tap jump bit is set forever if tap jump is set
        unsigned tapJump : 1;
        unsigned _spacer2 : 2;
        unsigned dTaunt : 1;
        unsigned sTaunt : 1;
        unsigned uTaunt : 1;
        unsigned _spacer : 1;
        //cstick is active if it is past threshold
        //It only has effect for first frame
        unsigned cStick : 1;
        unsigned _buttons : 4;
        unsigned shield : 1;
        unsigned jump : 1;
        unsigned special : 1;
        unsigned attack : 1;
    }__attribute__((packed, aligned(2)));
}__attribute__((packed, aligned(2)));


#endif //PROJECTMCODES_INPUTS_H
