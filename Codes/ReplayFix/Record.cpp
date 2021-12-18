//
// Created by johno on 7/1/2020.
//

#include "Record.h"


ReplayRecorder recorder(reinterpret_cast<ReplayEvent*>(REPLAY_BUFFER_START + 0x2000), 0x10000);


void recordGameStart(char* recordReplayPath) {
    FILE* replayFile = fopen(recordReplayPath, WRITE);
    recorder.openReplayFile(replayFile);

    auto gameStartEvent = new ReplayGameStartEvent;
    gameStartEvent->randSeed = DEFAULT_MT_RAND->seed;
    recorder.push(gameStartEvent);
}

void recordMeleeInfo() {
    recorder.getGameStartEvent()->meleeInfo = *GM_GLOBAL_MODE_MELEE;


    char* compressTest = new char[sizeof(gmGlobalModeMelee)];
    int compressSize = compressLZ(GM_GLOBAL_MODE_MELEE, sizeof(gmGlobalModeMelee), compressTest);
    ASSERT(compressSize > 0);

    auto crypto = gfCryptoESP();
    crypto.encrypt(compressTest, compressSize);
    while(crypto.isDone == false) {
        OSSleepTicks(0xed4e);
    }
    ASSERT(crypto.resultBuffer != nullptr);
    ASSERT(crypto.resultSize > 0);

    auto crypto2 = gfCryptoESP();
    crypto2.decrypt(crypto.resultBuffer, crypto.resultSize);
    while(crypto2.isDone == false) {
        OSSleepTicks(0xed4e);
    }
    ASSERT(crypto2.resultBuffer != nullptr);
    ASSERT(crypto2.resultSize > 0);
    //adds some extra stuff at the end to align to 16 bytes
    ASSERT(crypto2.resultSize >= compressSize);
    ASSERT(memcmp(compressTest, crypto2.resultBuffer, compressSize) == 0);

    char* decompressed = new char[0x1000];
    uncompressLZ(crypto2.resultBuffer, decompressed);
    ASSERT(memcmp(decompressed, GM_GLOBAL_MODE_MELEE, sizeof(gmGlobalModeMelee)) == 0);
}

void recordLoadEvent(gfFileIORequest* fileIoRequest) {
    auto loadEvent = new ReplayLoadEvent();
    loadEvent->loadHash = fileIoRequest->hash;
    recorder.push(loadEvent);
}

void recordFrameEnd() {
    auto frameEndEvent = new ReplayFrameEndEvent;
    frameEndEvent->frameNum = GAME_FRAME->frameCounter;
    frameEndEvent->randSeed = DEFAULT_MT_RAND->seed;
    recorder.push(frameEndEvent);

    auto frameStart = recorder.getFrameStartEvent();
    ASSERT(frameStart->frameNum == frameEndEvent->frameNum - 1);

    recorder.saveFrameEvents();
}

void recordFrameStart() {
    auto frameStartEvent = new ReplayFrameStartEvent;
    frameStartEvent->randomSeed = DEFAULT_MT_RAND->seed;
    frameStartEvent->frameNum = GAME_FRAME->frameCounter;
    recorder.push(frameStartEvent);
}

void stopRecording() {
    recordFrameEnd();

    auto endEvent = new ReplayGameEndEvent;
    recorder.push(endEvent);

    recorder.saveAndClose();
}

void recordFighterInfo() {
    auto frame = recorder.getFrameStartEvent();
    ASSERT(frame != nullptr);
    ASSERT(frame->frameNum == GAME_FRAME->frameCounter);
    for(int i = 0; i < 4; i++) {
        auto entry = FIGHTER_MANAGER->getEntryIdFromIndex(i);
        if(entry != -1) {
            ASSERT_FighterIsNotAlreadyInEventList(recorder, i);

            auto fighterEvent = new ReplayPreFrameFighterEvent;
            auto& pad = PAD_SYSTEM->pads[i];
            fighterEvent->buttons = pad.buttons;
            fighterEvent->stickX = pad.stickX;
            fighterEvent->stickY = pad.stickY;
            fighterEvent->cStickX = pad.cStickX;
            fighterEvent->cStickY = pad.cStickY;
            fighterEvent->LTrigger = pad.LTrigger;
            fighterEvent->RTrigger = pad.RTrigger;
            fighterEvent->port = i;

            recorder.push(fighterEvent);
        }
    }
}

void startRecording() {
    recorder.saveFrameEvents();

    recordFrameStart();
}