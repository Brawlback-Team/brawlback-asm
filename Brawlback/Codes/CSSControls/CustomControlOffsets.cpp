//
// Created by johno on 6/7/2020.
//

#include "CustomControlOffsets.h"

static const int TESTS2 __attribute__((used)) = 4;

SettingInfo::SettingInfo(const char *name, unsigned char value) {
    strcpy(this->name, name);
    this->value = value;
}


ButtonInfo::ButtonInfo(const char *name, unsigned char offset, vector<SettingInfo*> settings) : settings(settings) {
    strcpy(this->name, name);
    this->offset = offset;
}



SettingInfo GC_SETTING_ATTACK("Attack", 0);
SettingInfo GC_SETTING_SPECIAL("Special", 1);
SettingInfo GC_SETTING_JUMP("Jump", 2);
SettingInfo GC_SETTING_SHIELD("Shield", 3);
SettingInfo GC_SETTING_GRAB("Grab", 4);
SettingInfo GC_SETTING_SMASH("Smash", 5);
SettingInfo GC_SETTING_UP_TAUNT("U Taunt", 0xA);
SettingInfo GC_SETTING_SIDE_TAUNT("S Taunt", 0xB);
SettingInfo GC_SETTING_DOWN_TAUNT("D Taunt", 0xC);
SettingInfo GC_SETTINGS_TAP_JUMP_ON("ON", 0x80);
SettingInfo GC_SETTINGS_TAP_JUMP_OFF("OFF", 0);

vector<SettingInfo*> GCSettingsInfo({&GC_SETTING_ATTACK, &GC_SETTING_SPECIAL, &GC_SETTING_JUMP, &GC_SETTING_SHIELD, &GC_SETTING_GRAB, &GC_SETTING_SMASH, &GC_SETTING_UP_TAUNT, &GC_SETTING_SIDE_TAUNT, &GC_SETTING_DOWN_TAUNT});


ButtonInfo GC_BUTTON_INFO_L("L", 0,{
        &GC_SETTING_ATTACK,
        &GC_SETTING_SPECIAL,
        &GC_SETTING_JUMP,
        &GC_SETTING_SHIELD,
        &GC_SETTING_GRAB,
        &GC_SETTING_UP_TAUNT,
        &GC_SETTING_SIDE_TAUNT,
        &GC_SETTING_DOWN_TAUNT
});

ButtonInfo GC_BUTTON_INFO_R("R", 1,{
        &GC_SETTING_ATTACK,
        &GC_SETTING_SPECIAL,
        &GC_SETTING_JUMP,
        &GC_SETTING_SHIELD,
        &GC_SETTING_GRAB,
        &GC_SETTING_UP_TAUNT,
        &GC_SETTING_SIDE_TAUNT,
        &GC_SETTING_DOWN_TAUNT
});

ButtonInfo GC_BUTTON_INFO_Z("Z", 2,{
        &GC_SETTING_ATTACK,
        &GC_SETTING_SPECIAL,
        &GC_SETTING_JUMP,
        &GC_SETTING_SHIELD,
        &GC_SETTING_GRAB,
        &GC_SETTING_UP_TAUNT,
        &GC_SETTING_SIDE_TAUNT,
        &GC_SETTING_DOWN_TAUNT
});

ButtonInfo GC_BUTTON_INFO_DPAD_UP("D UP", 3,{
        &GC_SETTING_ATTACK,
        &GC_SETTING_SPECIAL,
        &GC_SETTING_JUMP,
        &GC_SETTING_SHIELD,
        &GC_SETTING_GRAB,
        &GC_SETTING_UP_TAUNT,
        &GC_SETTING_SIDE_TAUNT,
        &GC_SETTING_DOWN_TAUNT
});

ButtonInfo GC_BUTTON_INFO_DPAD_SIDE("D Side", 4,{
        &GC_SETTING_ATTACK,
        &GC_SETTING_SPECIAL,
        &GC_SETTING_JUMP,
        &GC_SETTING_SHIELD,
        &GC_SETTING_GRAB,
        &GC_SETTING_UP_TAUNT,
        &GC_SETTING_SIDE_TAUNT,
        &GC_SETTING_DOWN_TAUNT
});

ButtonInfo GC_BUTTON_INFO_DPAD_DOWN("D Down", 5,{
        &GC_SETTING_ATTACK,
        &GC_SETTING_SPECIAL,
        &GC_SETTING_JUMP,
        &GC_SETTING_SHIELD,
        &GC_SETTING_GRAB,
        &GC_SETTING_UP_TAUNT,
        &GC_SETTING_SIDE_TAUNT,
        &GC_SETTING_DOWN_TAUNT
});

ButtonInfo GC_BUTTON_INFO_B("B", 5,{
        &GC_SETTING_ATTACK,
        &GC_SETTING_SPECIAL,
        &GC_SETTING_JUMP,
        &GC_SETTING_SHIELD,
        &GC_SETTING_GRAB,
        &GC_SETTING_UP_TAUNT,
        &GC_SETTING_SIDE_TAUNT,
        &GC_SETTING_DOWN_TAUNT
});

ButtonInfo GC_BUTTON_INFO_A("A", 6,{
        &GC_SETTING_ATTACK,
        &GC_SETTING_SPECIAL,
        &GC_SETTING_JUMP,
        &GC_SETTING_SHIELD,
        &GC_SETTING_GRAB,
        &GC_SETTING_UP_TAUNT,
        &GC_SETTING_SIDE_TAUNT,
        &GC_SETTING_DOWN_TAUNT
});


ButtonInfo GC_BUTTON_INFO_CSTICK("CStick", 7,{
        &GC_SETTING_ATTACK,
        &GC_SETTING_SPECIAL,
        &GC_SETTING_JUMP,
        &GC_SETTING_SHIELD,
        &GC_SETTING_GRAB,
        &GC_SETTING_SMASH,
        &GC_SETTING_UP_TAUNT,
        &GC_SETTING_SIDE_TAUNT,
        &GC_SETTING_DOWN_TAUNT
});

ButtonInfo GC_BUTTON_INFO_Y("Y", 9,{
        &GC_SETTING_ATTACK,
        &GC_SETTING_SPECIAL,
        &GC_SETTING_JUMP,
        &GC_SETTING_SHIELD,
        &GC_SETTING_GRAB,
        &GC_SETTING_UP_TAUNT,
        &GC_SETTING_SIDE_TAUNT,
        &GC_SETTING_DOWN_TAUNT
});

ButtonInfo GC_BUTTON_INFO_X("X", 10,{
        &GC_SETTING_ATTACK,
        &GC_SETTING_SPECIAL,
        &GC_SETTING_JUMP,
        &GC_SETTING_SHIELD,
        &GC_SETTING_GRAB,
        &GC_SETTING_UP_TAUNT,
        &GC_SETTING_SIDE_TAUNT,
        &GC_SETTING_DOWN_TAUNT
});

ButtonInfo GC_BUTTON_INFO_TAP_JUMP("Tap", 11,{
        &GC_SETTINGS_TAP_JUMP_OFF,
        &GC_SETTINGS_TAP_JUMP_ON
});

vector<ButtonInfo*> GCButtonInfo({
    &GC_BUTTON_INFO_L,
    &GC_BUTTON_INFO_R,
    &GC_BUTTON_INFO_Z,
    &GC_BUTTON_INFO_DPAD_UP,
    &GC_BUTTON_INFO_DPAD_SIDE,
    &GC_BUTTON_INFO_DPAD_DOWN,
    &GC_BUTTON_INFO_B,
    &GC_BUTTON_INFO_A,
    &GC_BUTTON_INFO_CSTICK,
    &GC_BUTTON_INFO_Y,
    &GC_BUTTON_INFO_X,
    &GC_BUTTON_INFO_TAP_JUMP
});

