//
// Created by johno on 9/26/2020.
//

#ifndef PROJECTMCODES_SCMELEE_H
#define PROJECTMCODES_SCMELEE_H


#include <stdtypes.h>

struct _stOperator {
    u8 state;
    char _spacer[0x7];
};

struct _stOperatorReadyGo {
    _stOperator _stOperator_;
    char _spacer[0xC0 - sizeof(_stOperator_)];
};

struct stOperatorReadyGo {
    char _spacer[0x40];
    _stOperatorReadyGo _stOperatorReadyGo_;
    u8 isEnd();
};

struct scMelee {
    char _spacer[0x72];
    stOperatorReadyGo* stOperatorReadyGo1;
    stOperatorReadyGo* stOperatorReadyGo2;
    char _spacer1[0x88];
    //0xD8
    //0x20 is game end flag
    //is on in game, clear to trigger game end
    u8 flags;
};


#define _isEnd_ST_OPERATOR_READY_GO ((u8 (*)(stOperatorReadyGo * This)) 0x809514c0)

#define SC_MELEE_GAME_END_FLAG (0x20)

#define SC_MELEE ((scMelee*) 0x90ff50c0)

#endif //PROJECTMCODES_SCMELEE_H
