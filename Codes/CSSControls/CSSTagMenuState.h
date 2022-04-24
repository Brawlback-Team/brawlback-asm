//
// Created by johno on 6/2/2020.
//

#ifndef CSSCUSTOMCONTROLS_CSSTAGMENUSTATE_H
#define CSSCUSTOMCONTROLS_CSSTAGMENUSTATE_H


#include "Brawl/MU/MuSelctChrList.h"
#include "CustomControlOffsets.h"
#include "Brawl/PlayerTagSystem.h"


//Maintain state of tag menu on CSS
//One instance per port
class CSSTagMenuState {
public:
    //CSSTagMenuState(MuSelctChrList* nameList);

    enum Mode {
        CLOSED,
        NAME_SELECT,
        BUTTON_SELECT,
        CONTROL_EDIT
    };

    static int getPortFromList(MuSelctChrList* list);

    bool isInMode(Mode mode);
    void setMode(Mode mode);
    bool isOpen();
    bool isInTagSelect();
    bool isInButtonSelect();
    bool isEditingControls();

    //returns true if not on PLAYER or new entry
    //probbably should rename
    bool isOnTag();
    //if on first "PLAYER #" option
    bool isOnPlayer();

    void enterButtonSelectFromTagSelect();
    void enterTagEditFromButtonSelect();
    void enterButtonSelectFromTagEdit();
    void enterTagSelectFromButtonSelect();
    void startReplaceTag();
    void endReplaceTag();

    void open();
    void close();

    int port();

    bool isTagSelectedByOtherPort(int menuPos);
    bool isTagBeingEditedByOtherPort(int menuPos);
    bool isReplacingTag();

    MuSelctChrList* nameList;
    char mode = Mode::CLOSED;
    unsigned char oldNameListSize = 0;
    unsigned char oldNameListPosition = 0;
    unsigned char oldButtonListPosition = 0;
    bool _isReplacingTag = false;
    //index to tag array, not menu
    short indexOfTagBeingEdited = -1;
    short indexOfTagBeingReplaced = -1;
    bool shouldReopen = false;
};


extern CSSTagMenuState states[4];

#endif //CSSCUSTOMCONTROLS_CSSTAGMENUSTATE_H
