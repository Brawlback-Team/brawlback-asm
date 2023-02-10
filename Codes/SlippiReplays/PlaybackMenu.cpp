#include "Assembly.h"
#include "Wii/EXI/EXI.h"
#include "EXIPacket.h"
#include "Graphics/Drawable.h"
#include "Utilities/Utility.h"
#include <string>
#include <cstring>
#include "Brawl/GF/gfFileIOHandle.h"
#include "Brawl/GF/gfCollectionIO.h"
#include "etl/string_utilities.h"
#include "Wii/OS/OSInterrupt.h"
#include "Brawl/gmGlobalModeMelee.h"
#include "Playback.h"
#include "Wii/mtRand.h"
#include "PlaybackMenu.h"
#include "Brawl/GF/GameGlobal.h"

bool playbackDecided = false;
u32 curIndex = -1;
std::vector<StartReplay> startReplays = {};

namespace ReplayMenus {
    
    void PopulateStartReplays()
    {
        EXIPacket getNumReplays = EXIPacket(GET_NUM_REPLAYS, nullptr, 0);
        getNumReplays.Send();

        u8 cmd_byte = 0;
        do
        {
            // read in one byte from emulator to see how to deal with the rest of the exi buffer
            readEXI(&cmd_byte, 1, EXIChannel::slotB, EXIDevice::device0, EXIFrequency::EXI_32MHz);
        } while(cmd_byte != GET_NUM_REPLAYS);

        u8 numReplays;
        readEXI(&numReplays, 1, EXIChannel::slotB, EXIDevice::device0, EXIFrequency::EXI_32MHz);
        OSReport("NUMBER OF REPLAYS: %u\n", numReplays);
        for(int i = 0; i < numReplays; i++)
        {
            u8 index = i;
            EXIPacket getStartReplay = EXIPacket(GET_START_REPLAY, &index, 1);
            getStartReplay.Send();

            do
            {
                // read in one byte from emulator to see how to deal with the rest of the exi buffer
                readEXI(&cmd_byte, 1, EXIChannel::slotB, EXIDevice::device0, EXIFrequency::EXI_32MHz);
            } while(cmd_byte != GET_START_REPLAY && cmd_byte != BAD_INDEX);

            if(cmd_byte == GET_START_REPLAY)
            {
                StartReplay startReplayData;
                readEXI(&startReplayData, sizeof(StartReplay), EXIChannel::slotB, EXIDevice::device0, EXIFrequency::EXI_32MHz);
                startReplays.push_back(startReplayData);
                OSReport("REPLAY FOUND AT INDEX %u -- STARTING FRAME IS %u\n", (u32)i, startReplays[i].firstFrame);
            }
            else
            {
                OSReport("NO REPLAY FOUND AT INDEX %u\n", i);
            }
        }
    }

    // Set the number of replays to the size of the headers object vector.
    INJECTION("setNumReplays", 0x800c4150, R"(
        SAVE_REGS
        addi r3, r3, 0x00E8
        bl setNumReplays
        RESTORE_REGS
        lwz	r0, 0x00E8 (r3)
    )");

    extern "C" void setNumReplays(size_t* numReplays)
    {
        *numReplays = startReplays.size();
    }

    // IFF the headers object is not empty clear it out when destructing the collection.
    INJECTION("eraseStartReplays", 0x80038ac8, R"(
        SAVE_REGS
        bl eraseStartReplays
        RESTORE_REGS
        stwu sp, -0x0020 (sp)
    )");

    extern "C" void eraseStartReplays()
    {
        startReplays.clear();
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
    extern "C" bool processStartReplays(gfCollectionIO* collection)
    {
        if(startReplays.empty())
        {
            PopulateStartReplays();
            collection->dataType = 7;
            collection->dataSize = startReplays.size();
            OSReport("%x\n", startReplays.size());
            collection->summaryErrorCode = 0;
            collection->fileSystemType = 0;
            auto sizeOfNames = (MAX_REPLAY_NAME_SIZE) * startReplays.size();
            collection->data = new char[sizeOfNames];
            auto names = reinterpret_cast<char*>(collection->data);

            //copy each replay name into names buffer - null terminate each name
            size_t index = 0;
            for(const auto& startReplay : startReplays )
            {
                std::copy(startReplay.nameBuffer,
                          startReplay.nameBuffer + startReplay.nameSize,
                          &names[index]);

                index += startReplay.nameSize;
                names[index] = '\0';
                index++;
                OSReport("%s\n", names);
            }
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
    extern "C" u8 getNumCharacters(u8 index)
    {
        return startReplays[index].numPlayers;
    }

    INJECTION("updateCorrectIcons", 0x811989f8, R"(
        mr r3, r29
        mr r4, r14
        bl getCurPlayerSlotID
    )");

    extern "C" u8 getCurPlayerSlotID(int playerNumber, u8 index)
    {
        return startReplays[index].players[playerNumber].slotID;
    }

    INJECTION("updateCorrectStageThumbnail1", 0x81198be0, R"(
        mr r3, r14
        bl getCurStageKind
    )");

    INJECTION("updateCorrectStageThumbnail2", 0x81198784, R"(
        mr r3, r17
        bl getCurStageKind
    )");

    extern "C" unsigned int getCurStageKind(u8 index)
    {
        return startReplays[index].stage;
    }

    INJECTION("forceDispThumbnail", 0x8119dd20, "li r0, 1");

    INJECTION("printName", 0x8119e3a8, R"(
        SAVE_REGS
        mr r4, r14
        bl printName
        RESTORE_REGS
        lwz	r12, 0x003C (r25)
    )");

    extern "C" void printName(char* title, u32 index)
    {
        curIndex = index;
        strcpy(title, (const char*)startReplays[index].nameBuffer);
    }

    INJECTION("setupPlayback", 0x81198090, R"(
        SAVE_REGS
        bl setupPlayback
        RESTORE_REGS
        stwu sp, -0x0380 (sp)
    )");
    extern "C" void setupPlayback()
    {
        PlaybackLogic::replayHeader = startReplays[curIndex];
    }

    INJECTION("forceOnDecided", 0x81198118, "li r0, 1");
    INJECTION("forceLoadReplay", 0x811a1568, "li r0, 0");

    INJECTION("setupMelee", 0x811983e4, R"(
        SAVE_REGS
        bl setupScMelee
        RESTORE_REGS
    )")

    extern "C" void setupScMelee()
    {
        gmGlobalModeMelee* melee = GAME_GLOBAL->globalModeMelee;
        memcpy(melee, PlaybackLogic::replayHeader.gameData, 0x320);
        playbackDecided = true;
        EXIPacket loadBuffer = EXIPacket(EXICommand::LOAD_FRAMES, nullptr, 0);
        loadBuffer.Send();

        u8 cmd_byte = 0;
        do
        {
            readEXI(&cmd_byte, 1, EXIChannel::slotB, EXIDevice::device0, EXIFrequency::EXI_32MHz);
        } while (cmd_byte != EXICommand::LOAD_FRAMES);
    }

    INJECTION("forceLoadScene", 0x81198684, R"(
        lwz	r31, 0x1D10 (r3)
        mr r3, r31
        bl forceLoadMelee
        mr r31, r3
    )")

    extern "C" u32 forceLoadMelee(u32 unk)
    {
        if(unk == 0xffffffff)
        {
            return 0;
        }
        return unk;
    }
}