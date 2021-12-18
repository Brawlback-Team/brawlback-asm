//
// Created by johno on 6/7/2020.
//

#ifndef CSSCUSTOMCONTROLS_CUSTOMCONTROLOFFSETS_H
#define CSSCUSTOMCONTROLS_CUSTOMCONTROLOFFSETS_H


#include "Memory.h"
#include "Containers/vector.h"
#include "Assembly.h"
#include "C++Stuff.h"

struct SettingInfo {
    SettingInfo(const char* name, unsigned char value);

    char name[10];
    unsigned char value;
};


struct ButtonInfo {
    ButtonInfo(const char* name, unsigned char offset, vector<SettingInfo*> settings);

    char name[10];
    unsigned char offset;
    vector<SettingInfo*> settings;
};

extern vector<SettingInfo*> GCSettingsInfo;
extern vector<ButtonInfo*> GCButtonInfo;

static const int test __attribute__((used)) = 7;


#endif //CSSCUSTOMCONTROLS_CUSTOMCONTROLOFFSETS_H
