//
// Created by johno on 10/25/2020.
//

#include "Random1To1Alts.h"


vector<StageInfo> stages;


STARTUP(loadStageFile) {
    char path[] = "/Project+/StageData/StageData";
    auto file = fopen(path);
    auto buffer = new StageInfo[0x400];
    fread(buffer, sizeof(StageInfo), 0x400, file);
    int numStages = *((int*) buffer);
    for(int i = 0; i < numStages; i++) {
        stages.push(buffer[i + 1]);
    }
    delete [] buffer;
    fclose(file);
}


//BASIC_INJECT("randomAlts", 0x806dd024, "li r6, 0");
SIMPLE_INJECTION(randomAlts, 0x8010f960, "stwu sp, -0x70(sp)") {
    if(*FLAG) {
        ASSERT(stages.size() > 0);
        u8 groupID = getGroupID();
        if(groupID != 0) {
            auto stagesInGroup = getStagesInGroup(groupID);
            int newStageIndex = randi(stagesInGroup.size());
            auto newStage = stagesInGroup[newStageIndex];

            ASSERT(newStage.stageID != 0x28);

            GM_GLOBAL_MODE_MELEE->stageID = newStage.stageID;
            *ASL_BUTTONS = newStage.buttons;
        }
    }
}


u8 getGroupID() {
    u8 currentStageID = GM_GLOBAL_MODE_MELEE->stageID;
    PADButtons currentASLButtons = *ASL_BUTTONS;

    for(int i = 0; i < stages.size(); i++) {
        auto info = stages[i];
        if(info.stageID == currentStageID) {
            if((currentASLButtons.bits & info.buttons.bits) == info.buttons.bits) {
                return info.groupID;
            }
        }
    }
    return 0;
}


vector<StageInfo> getStagesInGroup(u8 groupID) {
    vector<StageInfo> stagesInGroup;
    for(int i = 0; i < stages.size(); i++) {
        auto info = stages[i];
        if(info.groupID == groupID) {
            //Skip Lylat and Castle Siege and Results screen
            if(info.stageID != 19 && info.stageID != 25 && info.stageID != 40) {
                stagesInGroup.push(info);
            }
        }
    }
    return stagesInGroup;
}


//Does not update random seed, so multiple uses at once return same value
int randi(int max) {
    return DEFAULT_MT_RAND->seed % max;
}