//
// Created by johno on 9/24/2020.
//

#include "Play.h"


ReplayPlayer player(reinterpret_cast<ReplayEvent*>(REPLAY_BUFFER_START + 0x2000), 0x10000);

PlaybackFileSyncer loadSyncer;

void playGameStart() {
    player.loadNextFrame();
    auto gameStartEvent = player.getGameStartEvent();
    DEFAULT_MT_RAND->seed = gameStartEvent->randSeed;
    *GM_GLOBAL_MODE_MELEE = gameStartEvent->meleeInfo;
}

void playFileLoad(gfFileIORequest* fileIoRequest) {
    if((fileIoRequest->params & 0x20000000) != 0) {
        if((fileIoRequest->params & 0x40000000) == 0) {
            loadSyncer.tryLoadingFile(fileIoRequest);
        }
    }
}

bool playFrameStart() {
    if(loadSyncer.isWaiting() == false) {
        player.loadNextFrame();

        auto frameStartEvent = player.getFrameStartEvent();

        if(frameStartEvent == nullptr) {
            auto gameEndEvent = player.getGameEndEvent();
            ASSERT(gameEndEvent != nullptr);

            return true;
        }


        DEFAULT_MT_RAND->seed = frameStartEvent->randomSeed;
        ASSERT(frameStartEvent->frameNum == GAME_FRAME->frameCounter);

        //Checks if recorded load event has happend
        for(int i = 0; i < player.events.size(); i++) {
            if(player.events[i]->id == ReplayEventID::load) {
                auto loadEvent = (ReplayLoadEvent*) player.events[i];
                loadSyncer.scheduleLoad(loadEvent->loadHash);
            }
        }
    }

    return false;
}

void startPlayback() {
    player.loadNextFrame();

    auto frameStartEvent = player.getFrameStartEvent();
    DEFAULT_MT_RAND->seed = frameStartEvent->randomSeed;

    //(*FILE_MANAGER_PTR)->setSyncMode(0);
}

void stopPlayback() {
    player.close();
    loadSyncer.clear();
}

void playFighters() {
    //put check here for shecdualed load events
    //skip playback if these are any

    auto frame = player.getFrameStartEvent();
    ASSERT(frame != nullptr);
    ASSERT(frame->frameNum == GAME_FRAME->frameCounter);
    for(int i = 0; i < 4; i++) {
        auto fighterEvent = player.getFighterEventFromPort(i);
        if(fighterEvent != nullptr) {
            auto& pad = PAD_SYSTEM->pads[i];
            pad.buttons = fighterEvent->buttons;
            pad.stickX = fighterEvent->stickX;
            pad.stickY = fighterEvent->stickY;
            pad.cStickX = fighterEvent->cStickX;
            pad.cStickY = fighterEvent->cStickY;
            pad.LTrigger = fighterEvent->LTrigger;
            pad.RTrigger = fighterEvent->RTrigger;
        }
    }
}


void getCurrentReplayName(muReplayTask& replayTask, char* buffer) {
    int fileID = replayTask.getCurFileID();
    muReplayTask::getFileHandle(buffer, &replayTask, fileID);
}


const char REPLAY_DIRECTORY[] = "A:/Project+/rp/";


void setGameInfoForReplay(muReplayTask& replayTask) {
    char replayName[100] = {};
    getCurrentReplayName(replayTask, replayName);
    char replayPath[100] = {};
    strcpy(replayPath, REPLAY_DIRECTORY);
    strcat(replayPath, replayName);

    FILE* replayFile = fopen(replayPath, READ);




    fread(REPLAY_BUFFER_START + 0x10000, sizeof(ReplayGameStartEvent), 1, replayFile);
    auto gameStartEvent = (ReplayGameStartEvent*) (REPLAY_BUFFER_START + 0x10000);
    DEFAULT_MT_RAND->seed = gameStartEvent->randSeed;
    *GM_GLOBAL_MODE_MELEE = gameStartEvent->meleeInfo;

    fseek(replayFile, 0);


    player.openReplayFile(replayFile);




    //fread(REPLAY_BUFFER_START + 0x5000, sizeof(ReplayGameStartEvent), 1, replayFile);
    //ReplayGameStartEvent* gameStartEvent = (ReplayGameStartEvent*) (REPLAY_BUFFER_START + 0x5000);
    //DEFAULT_MT_RAND->seed = gameStartEvent->randSeed;
    //*GM_GLOBAL_MODE_MELEE = gameStartEvent->meleeInfo;


    //eventManager.loadNextFrame();

    //readFromSDFile(replayPath, SAVED_GAME_INFO, sizeof(ReplayGameStartInfo), 0);

    //auto file = gfFileIO(replayPath, 0, 0, nullptr, SAVED_GAME_INFO);
    //file.readSDFile();

    //DEFAULT_MT_RAND->seed = SAVED_GAME_INFO->randSeed;
    //*GM_GLOBAL_MODE_MELEE = SAVED_GAME_INFO->meleeInfo;

    //replayIOThread = OSThread(_readReplayFrame, 0x2000, 0);

    //memcpy(GM_GLOBAL_MODE_MELEE, &SAVED_GAME_INFO->meleeInfo, sizeof(gmGlobalModeMelee));

    IP_SWITCH->controllerFLags ^= 0x80000000;
    replayTask.resources->startReplayFlag = 0;

    //dataIndex = 0;
}


//Replays have 0x10 added to the playerNum
//This causes it to not be found with my codes, so this converts it back
INJECTION("removeReplayPlayerNum", 0x80048134, R"(
    andi. r4, r4, ~0x10 & 0xFFFF
    stw r4, 0x8(r3)
)");


//if waiting for loads, clear file bit
//r22 is gfFileIOManager*
INJECTION("waitForFileLoad", 0x8002347c, R"(
    SAVE_REGS
    mr r3, r22
    bl waitForFileLoad
    RESTORE_REGS
    addi r11, sp, 64
)");


extern "C" void waitForFileLoad(gfFileIOManager* manager) {
    if(loadSyncer.isWaiting()) {
        manager->flags &= ~FILE_MANAGER_ALL_FILES_LOADED_FLAG;
    }
}