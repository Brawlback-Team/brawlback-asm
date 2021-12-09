//
// Created by johno on 4/27/2020.
//

#ifndef CSSCUSTOMCONTROLS_CSSCUSTOMCONTROLS_H
#define CSSCUSTOMCONTROLS_CSSCUSTOMCONTROLS_H


#include "Brawl/GF/gfPadSystem.h"
#include "Assembly.h"
#include "CSSTagMenuState.h"
#include "ControllerManager.h"
#include "C++Stuff.h"
#include "Containers/vector.h"
#include "CustomControlOffsets.h"
#include "Brawl/GF/GameGlobal.h"
#include "Brawl/MU/muSelCharPlayerArea.h"
#include "Brawl/MU/MuSelCharHand.h"


class CSSButtonSetting {
public:
    constexpr CSSButtonSetting(char const* name, int offset) {this->name = name;};

    const char* name = "Attack";
    int value = 32;
};


class CSSButton {
public:
    CSSButton(char const* name, int offset, CSSButtonSetting* b) {};

    char name[10];
    int offset;
    CSSButtonSetting* settings;
};

class GCController {
public:
    GCController(int offset, CSSButton* b) {buttonConfig=b;};

    int offset;
    CSSButton* buttonConfig;
};

extern "C" void controlMenuState(MuSelctChrList& list);
void controlPort(int port, CSSTagMenuState& state);

//CSS_CONTROL_SETTINGS_EXTERN_DECLARATION


#endif //CSSCUSTOMCONTROLS_CSSCUSTOMCONTROLS_H
