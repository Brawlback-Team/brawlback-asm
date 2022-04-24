//
// Created by johno on 7/1/2020.
//

#include "ReplayFix.h"



//only applies at begining of game
//most codes use isRecording instead
bool isInReplay = false;

enum class ReplayState {
    none,
    recording,
    playing,
    shouldStartRecording,
    shouldStartPlaying,
    shouldStopRecording,
    shouldStopPlaying
};

ReplayState replayState = ReplayState::none;

char replayPathFormat[]  = "/Project+/rp/rp_%02d%02d%02d_%02d%02d_%02d.bin";


//these are the hashes of the load events that were already supposed to occur
vector<u16> playbackSchedualedLoadEvents;
//these are references to files that have finsihed loading, but were not loaded yet in the recorded game
vector<gfFileIORequest*> playbackEncounteredLoadEvents;


bool isGamePaused() {
    return (GF_APPLICATION->_gameFlags & 0x01000000) != 0;
}

SIMPLE_INJECTION(gameStart, 0x806cf140, "stwu sp, -0x70(sp)") {
    if(isInReplay) {
        playGameStart();
    }
    else {
        char replayPath[100] = {};

        auto time = getTime();

        auto calendarTime = OSTimeToCalendarTime(time);

        sprintf(replayPath, replayPathFormat,
                    calendarTime.year,
                    calendarTime.mon + 1,
                    calendarTime.mday,
                    calendarTime.hour,
                    calendarTime.min,
                    calendarTime.sec
                );

        recordGameStart(replayPath);
    }
}


SIMPLE_INJECTION(setBaseInfo, 0x8004b0f8, "blr") {
    if(isInReplay == false) {
        recordMeleeInfo();
    }
}


//r28 is gfFileIORequest*
INJECTION("handleRecordFileLoads", 0x80023210, R"(
    SAVE_REGS
    mr r3, r28
    bl handleRecordFileLoads
    RESTORE_REGS
    lwz r3, 0x18(r3)
)");


extern "C" void handleRecordFileLoads(gfFileIORequest* fileIoRequest) {
    if(replayState == ReplayState::recording) {
        recordLoadEvent(fileIoRequest);
    }
}


//r28 is gfFileIORequest*
INJECTION("handlePlaybackFileLoads", 0x800231f0, R"(
    SAVE_REGS
    mr r3, r28
    bl handlePlaybackFileLoads
    RESTORE_REGS
    cmpwi r0, 1
)");


extern "C" void handlePlaybackFileLoads(gfFileIORequest* fileIoRequest) {
    if(replayState == ReplayState::playing) {
        playFileLoad(fileIoRequest);
    }
}


SIMPLE_INJECTION(frameStart, 0x8001761c, "mflr r0") {
    if(replayState == ReplayState::playing) {
        ASSERT(isInReplay);

        if(isGamePaused() == false) {
            bool replayFinished = playFrameStart();
            if(replayFinished) {
                replayState = ReplayState::shouldStopPlaying;

                SC_MELEE->flags &= ~SC_MELEE_GAME_END_FLAG;
            }
        }
    }
    else if(replayState == ReplayState::recording) {
        ASSERT(isInReplay == false);

        if(isGamePaused() == false) {
            recordFrameEnd();
            recordFrameStart();
        }
    }
    else if(replayState == ReplayState::shouldStartPlaying) {
        ASSERT(isInReplay);

        replayState = ReplayState::playing;

        startPlayback();
    }
    else if(replayState == ReplayState::shouldStartRecording) {
        ASSERT(isInReplay == false);

        startRecording();
        replayState = ReplayState::recording;
    }
    else if(replayState == ReplayState::shouldStopPlaying) {
        ASSERT(isInReplay);

        replayState = ReplayState::none;

        stopPlayback();
        isInReplay = false;
    }
    else if(replayState == ReplayState::shouldStopRecording) {
        ASSERT(isInReplay == false);

        stopRecording();
        replayState = ReplayState::none;
    }
}


//TODO: Check if the playing branches actually get run

//sets should start recording flag, and stops Brawl start recording function
SIMPLE_INJECTION(startReplay, 0x8004b328, "blr") {
    if(isInReplay) {
        replayState = ReplayState::shouldStartPlaying;
    }
    else {
        replayState = ReplayState::shouldStartRecording;
    }
}


SIMPLE_INJECTION(stopReplay, 0x8004b5e4, "blr") {
    if(replayState == ReplayState::playing) {
        replayState = ReplayState::shouldStopPlaying;
    }
    else if(replayState == ReplayState::recording) {
        replayState = ReplayState::shouldStopRecording;
    }
}





INJECTION("playOrRecord", 0x8004aa28, R"(
    SAVE_REGS
    bl playOrRecord
    RESTORE_REGS
    mr r28, r31
)");


//TODO: called once per character, either move or only record/play current port
extern "C" void playOrRecord() {
    if(isGamePaused() == false) {
        if(replayState == ReplayState::playing) {
            playFighters();
        }
        else if(replayState == ReplayState::recording) {
            recordFighterInfo();
        }
    }
}




INJECTION("stopKeyRecorderClear", 0x8004b060, "blr");
INJECTION("stopSetInitialProcessCount", 0x8004b310, "blr");
INJECTION("stopMeleeGetInitialProcessCount", 0x8004b304, "blr");


















/*
INJECTION("replaceReplayPathWithFakeFile", 0x81198350, R"(
    SAVE_REGS
    bl replaceReplayPathWithFakeFile
    cmpwi r3, 1
    RESTORE_REGS
    beq _SKIP_replaceReplayPathWithFakeFile
    blr
_SKIP_replaceReplayPathWithFakeFile:
    lwz r4, 0x1AC(r4)
)");*/


const char FAKE_REPLAY_NAME[] = "fake.bin";

//replaces calls to getFileHandle so they return a path to a dummy valid replay
//Since the function is still useful to me, if r6 is set to 0xBEEF, it runs as normal
extern "C" bool replaceReplayPathWithFakeFile(char* buffer, muCollectionViewer* base, int fileID, int flag) {
    if(flag == 0xBEEF) {
        return true;
    }
    strcpy(buffer, FAKE_REPLAY_NAME);
    return false;
}




//prevents replays from being considered corrupted when selected
INJECTION("alwaysAllowReplayToBeSelected", 0x8119811c, "cmpwi r0, 1");


//if trying to load a replay, only load the header to make the preview work
//This is called all the time, so make sure "/rp/rp_" is in the file path
//sp + 40 = filePath, sp + 16 = fileSize
INJECTION("onlyLoadReplayHeader", 0x8001cca0, R"(
    #have to do this before saving regs because its stack based
    #r3 is important so use r5 outside of saves
    addi r5, sp, 40
    addi r4, sp, 16
    SAVE_REGS
    mr r3, r5
    bl onlyLoadReplayHeader
    RESTORE_REGS
    cmpwi r3, 0
)");

extern "C" void onlyLoadReplayHeader(char* filePath, int* fileSize) {
    if(strstr(filePath, "/rp/rp_") != nullptr) {
        ASSERT(fileSize != 0);
        //let the file be shown as corrupted if it can't be read
        if(fileSize != 0) {
            *fileSize = 0x200;
        }
    }
}




INJECTION("loadReplayHeader", 0x8003c000, R"(
    SAVE_REGS
    bl loadReplayHeader
    cmpwi r3, 0
    beq r3, runNormally

    RESTORE_REGS
    li r3, 0
    blr

runNormally:
    RESTORE_REGS
    stwu sp, -0x30(sp)
)");
extern "C" bool loadReplayHeader(gfCollectionIO* collectionIo) {
    if(collectionIo->fileSystemType == 1) {
        if(strstr(collectionIo->collectionName, "rp_") != nullptr) {
            char replayPath[0x100];
            sprintf(replayPath, "/Project+/rp/%s", collectionIo->collectionName);
            auto file = fopen(replayPath);

            //Needs to alloc from here or will cause issues when the game tries to free it
            //void* buffer = REPLAY_MENU_INSTANCE_MEMORY_POOL->alloc(0x200);
            char* buffer = new char[0x300];
            fread(buffer, 0x200, 1, file);
            fclose(file);

            collectionIo->data = buffer;
            collectionIo->dataSize = 0x200;
            collectionIo->dataType = 5;

            return true;
        }
    }

    return false;
}


INJECTION("setupReplay", 0x8119841c, R"(
    #r3 already has muReplayTask*
    #intentionally not bl
    b setupReplay
)");

extern "C" void setupReplay(muReplayTask& replayTask) {
    setGameInfoForReplay(replayTask);
    isInReplay = true;
}


INJECTION("stopReplayButtonConfig", 0x8011051c, "mr r28, r29");



//These might be duplicates
SIMPLE_INJECTION(setStartPlaybackFlag, 0x8004b608, "blr") {
    ASSERT(replayState == ReplayState::none);
    ASSERT(isInReplay);

    replayState = ReplayState::shouldStartPlaying;
}



SIMPLE_INJECTION(setStopPlaybackFlag, 0x8004b738, "blr") {
    if(replayState == ReplayState::playing) {
        replayState = ReplayState::shouldStopPlaying;
    }
}


//My code causes the game to think it's in a match during replays
//When trying to quit, this causes the game to try and write a syncCommand instead of properly exiting the replay
//r3 should equal 1 when in a replay, and 0 otherwise
INJECTION("exitReplay", 0x806d49a4, R"(
    lis r3, isInReplay@ha
    lbz r3, isInReplay@l(r3)
)");