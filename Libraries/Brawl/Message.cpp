//
// Created by johno on 7/13/2020.
//

#include "Brawl/Message.h"

void Message::setup() {
    //save font values
    auto savedFont1 = *_FONT_THING1;
    auto savedFont2 = *_FONT_THING2;

    //clear font values
    *_FONT_THING1 = nullptr;
    *_FONT_THING2 = nullptr;


    //setDefaultEnv uses some values from the message buffer
    //We don't need these values to print, but ignoring it will causes crashes
    void* fakeMessageBuffer[0x40] = {};
    fakeMessageBuffer[0x4C / 4] = &fakeMessageBuffer;
    _messageBuffer = &fakeMessageBuffer;

    _setDefaultEnv_Message(this, 0, 9);

    startNormalDraw();

    _GXSetCullMode(GXCullMode::GX_CULL_NONE);

    font = MELEE_FONT;

    //restore font values
    *_FONT_THING1 = savedFont1;
    *_FONT_THING2 = savedFont2;

    //just copying the code menu print fps for now

    //This camera matrix happens to always be perfect for printing text to the screen
//    _GXLoadPosMtxImm(&CAMERA_MANAGER->cameras[4].modelView, 0);
//    auto scale = CAMERA_MANAGER->cameras[0].scale;
//    this->fontSize = scale * 0.22;
}

void Message::printString(const char* characters) {
    for(; *characters; characters++) {
        printChar(*characters);
    }
}

void Message::printStringUTF(const UTF16* characters) {
    for(; *characters; characters++) {
        printChar(*characters);
    }
}

float Message::printChar(const UTF16 character) {
    return _Print_Message(this, character);
}

//sets the camera for printing to screen
//doesn't seem t work yet
void Message::std2DView() {
    _std2DView();
}

void Message::setObjZCompare(int unk1, bool active) {
    _setObjZCompare(this, unk1, active);
}

