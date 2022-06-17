#include "PlaybackMenu.h"

namespace ReplayMenus {
    std::vector<StartReplay> startReplays;
    void PopulateStartReplays()
    {
        EXIPacket getNumReplays = EXIPacket(GET_NUM_REPLAYS, nullptr, 0);
        getNumReplays.Send();

        u8 cmd_byte = 0;
        do
        {
            // read in one byte from emulator to see how to deal with the rest of the exi buffer
            u8* cmd_byte_read = (u8*)malloc(1);
            readEXI(cmd_byte_read, 1, EXIChannel::slotB, EXIDevice::device0, EXIFrequency::EXI_32MHz);
            cmd_byte = cmd_byte_read[0];
            free(cmd_byte_read);
        } while(cmd_byte != GET_NUM_REPLAYS);

        u32 read_data_size = sizeof(u8);
        u8* data = (u8*)malloc(read_data_size);
        readEXI(data, read_data_size, EXIChannel::slotB, EXIDevice::device0, EXIFrequency::EXI_32MHz);

        auto numReplays = data[0];
        free(data);
        OSReport("NUMBER OF REPLAYS: %u\n", numReplays);
        for(int i = 0; i < numReplays; i++)
        {
            EXIPacket setCurIndex = EXIPacket(SET_CUR_INDEX, &i, sizeof(int));
            setCurIndex.Send();

            EXIPacket getStartReplay = EXIPacket(GET_START_REPLAY, nullptr, 0);
            getStartReplay.Send();

            do
            {
                // read in one byte from emulator to see how to deal with the rest of the exi buffer
                u8* cmd_byte_read = (u8*)malloc(1);
                readEXI(cmd_byte_read, 1, EXIChannel::slotB, EXIDevice::device0, EXIFrequency::EXI_32MHz);
                cmd_byte = cmd_byte_read[0];
                free(cmd_byte_read);
            } while(cmd_byte != GET_START_REPLAY && cmd_byte != BAD_INDEX);

            if(cmd_byte == GET_START_REPLAY)
            {
                read_data_size = sizeof(StartReplay);
                u8* startReplayData = (u8*)malloc(read_data_size);
                readEXI(startReplayData, read_data_size, EXIChannel::slotB, EXIDevice::device0, EXIFrequency::EXI_32MHz);
                startReplays.push_back(bufferToObject<StartReplay>(startReplayData));
                free(startReplayData);
                OSReport("REPLAY FOUND AT INDEX %u -- STARTING FRAME IS %u\n", i, startReplays[i].firstFrame);
            }
            else
            {
                OSReport("NO REPLAY FOUND AT INDEX %u\n", i);
            }
        }
    }

    // Populate the size of the vector into the size of the collection.
    INJECTION("getStartReplaySize", 0x8119d014, R"(
        SAVE_REGS
        bl getStartReplaySize
        RESTORE_REGS
    )");

    extern "C" int getStartReplaySize(int param_1, int param_2) {
        return startReplays.size();
    }

    // Set the number of replays to the size of the headers object vector.
    INJECTION("setNumReplays", 0x800c4150, R"(
        SAVE_REGS
        addi r3, r3, 0x00E8
        bl setNumReplays
        RESTORE_REGS
        lwz	r0, 0x00E8 (r3)
    )");

    extern "C" void setNumReplays(size_t* numReplays, int* dataType) {
        auto sizeOfStartReplay = reinterpret_cast<u32>(startReplays.size());
        memcpy(numReplays, &sizeOfStartReplay, sizeof(u32));
    }

    // IFF the headers object is not empty clear it out when destructing the collection.
    INJECTION("eraseStartReplays", 0x80038ac8, R"(
        SAVE_REGS
        bl eraseStartReplays
        RESTORE_REGS
        stwu sp, -0x0020 (sp)
    )");

    extern "C" void eraseStartReplays() {
        if(!startReplays.empty())
        {
            startReplays.clear();
        }
    }

    // IFF the collection is processing the list of replays, populate the collection accordingly.
    // Otherwise, let it run normally.
    INJECTION("processStartReplays", 0x800c4038, R"(
        SAVE_REGS
        bl processStartReplays
        cmpwi r3, 0
        beq runNormally
        RESTORE_REGS
        lis r12, 0x800c
        ori r12, r12, 0x403c
        mtctr r12
        bctrl
    runNormally:
        RESTORE_REGS
        lis r12, 0x8003
        ori r12, r12, 0x98c8
        mtctr r12
        bctrl
    )");
    extern "C" bool processStartReplays(gfCollectionIO* collection) {
        if(startReplays.empty())
        {
            PopulateStartReplays();
            collection->dataType = 7;
            collection->dataSize = startReplays.size();
            collection->summaryErrorCode = 0;
            collection->fileSystemType = 0;
            auto sizeOfNames = 20 * startReplays.size() + startReplays.size();
            char names[sizeOfNames];
            int index = 0;
            for(int i = 0; i < startReplays.size(); i++)
            {
                for(int f = 0; f < startReplays[i].nameSize; f++)
                {
                    names[index] = startReplays[i].nameBuffer[f];
                    index++;
                }
                names[index] = '\0';
                index++;
            }
            collection->data = new char[sizeOfNames];
            memcpy(collection->data, names, sizeOfNames);
            OSReport("%s\n", collection->data);
            return true;
        }
        return false;
    }

    INJECTION("requestSummary", 0x800c4830, R"(
        SAVE_REGS
        cmpwi r4, 2
        bne runRequestSummaryNormally
        RESTORE_REGS
        lis r12, 0x800c
        ori r12, r12, 0x4834
        mtctr r12
        bctrl
    runRequestSummaryNormally:
        RESTORE_REGS
        lis r12, 0x8003
        ori r12, r12, 0x9d40
        mtctr r12
        bctrl
    )");

    INJECTION("forceDispPreviewCoreReplays", 0x8119e080, "li r27, 1");
    INJECTION("updateDispPreviewCoreReplaysLoopCount", 0x81198a50, R"(
        mr r3, r14
        bl getNumCharacters
        cmplw r29, r3
    )");
    extern "C" u8 getNumCharacters(u8 index) {
        return startReplays[index].numPlayers;
    }

    INJECTION("updateCorrectIcons", 0x811989f8, R"(
        mr r3, r29
        mr r4, r14
        bl getCurPlayerSlotID
    )");

    extern "C" u8 getCurPlayerSlotID(int playerNumber, u8 index) {
        return startReplays[index].players[playerNumber].slotID;
    }

    INJECTION("updateCorrectStageThumbnail1", 0x81198be0, R"(
        mr r3, r14
        bl getCurStageKind
    )");

    INJECTION("updateCorrectStageThumbnail2", 0x81198784, R"(
        mr r3, r14
        bl getCurStageKind
    )");

    extern "C" u8 getCurStageKind(u8 index) {
        return startReplays[index].stage;
    }

    INJECTION("forceDispThumbnail", 0x8119dd20, "li r0, 1");
}