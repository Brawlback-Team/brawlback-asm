//
// Created by johno on 6/6/2020.
//

#ifndef CSSCUSTOMCONTROLS_CONTROLLERMANAGER_H
#define CSSCUSTOMCONTROLS_CONTROLLERMANAGER_H


#include "Brawl/GF/gfPadSystem.h"
#include "Memory.h"
#include "General.h"

class ControllerManager {
public:
    PADButtons trueButtons[4];
    PADButtons prevTrueButtons[4];
    PADButtons negations[4];
    //Negates buttons until they are released
    PADButtons persistentNegations[4];
    PADButtons truePresses[4];

    signed char trueStickX[4];
    signed char trueStickY[4];
    signed char effectiveStickX[4];
    signed char effectiveStickY[4];
    //signed char prevTrueStickX[4];
    //signed char prevTrueStickY[4];
    //signed char prevClampedStickX[4];
    //signed char prevClampedStickY[4];

    signed char clampMaxX[4];
    signed char clampMinX[4];
    signed char clampMaxY[4];
    signed char clampMinY[4];




    void setButtonsToBeNegated(PADButtons buttons, int port);
    void setPersisentNegations(PADButtons buttons, int port);
    void clampStickX(signed char max, signed char min, int port);
    void clampStickY(signed char max, signed char min, int port);
};


extern ControllerManager manager;

#endif //CSSCUSTOMCONTROLS_CONTROLLERMANAGER_H
