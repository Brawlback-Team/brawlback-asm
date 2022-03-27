#include "PlaybackMenu.h"

SIMPLE_INJECTION(displayReplayFiles, 0x8119795c, "stwu sp, -0x0020(sp)") {
    _OSDisableInterrupts();
    OSReport("  ~~~~~~~~~~~~~~~~  DISPLAY REPLAY FILES  ~~~~~~~~~~~~~~~~  \n");
    _OSEnableInterrupts();
    EXIPacket getNumberElementsPacket = EXIPacket(GET_NUMBER_REPLAY_FILES, nullptr, 0);
    getNumberElementsPacket.Send();

    u8 cmd_byte = 0;
    do {
        u8 *cmd_byte_read = (u8 *) malloc(1);
        // read in one byte from emulator to see how to deal with the rest of the exi buffer
        readEXI(cmd_byte_read, 1, EXIChannel::slotB, EXIDevice::device0, EXIFrequency::EXI_32MHz);
        cmd_byte = cmd_byte_read[0];
        free(cmd_byte_read);
    } while(cmd_byte != NUM_REPLAYS);

    u32 numElements = 0;
    u8* sizeOfElements;
    u8* sizeOfNames;
    u32 read_data_size = 0;

    _OSDisableInterrupts();
    OSReport("  ~~~~~~~~~~~~~~~~  GET THE NUMBER OF REPLAYS  ~~~~~~~~~~~~~~~~  \n");
    _OSEnableInterrupts();

    u8* data = (u8*)malloc(1);
    readEXI(data, 1, EXIChannel::slotB, EXIDevice::device0, EXIFrequency::EXI_32MHz);
    numElements = data[0];
    free(data);
    sizeOfElements = new u8[numElements];
    sizeOfNames = new u8[numElements];

    EXIPacket getReplaysSizePacket = EXIPacket(GET_REPLAY_FILES_SIZE, nullptr, 0);
    getReplaysSizePacket.Send();

    do {
        u8 *cmd_byte_read = (u8 *) malloc(1);
        // read in one byte from emulator to see how to deal with the rest of the exi buffer
        readEXI(cmd_byte_read, 1, EXIChannel::slotB, EXIDevice::device0, EXIFrequency::EXI_32MHz);
        cmd_byte = cmd_byte_read[0];
        free(cmd_byte_read);
    } while(cmd_byte != REPLAY_FILES_SIZE);

    _OSDisableInterrupts();
    OSReport("  ~~~~~~~~~~~~~~~~  GET THE SIZE OF REPLAYS  ~~~~~~~~~~~~~~~~  \n");
    _OSEnableInterrupts();

    auto dataSize = (u8*)malloc(numElements);
    readEXI(dataSize, numElements, EXIChannel::slotB, EXIDevice::device0, EXIFrequency::EXI_32MHz);
    for(int i = 0; i < numElements; i++)
    {
        _OSDisableInterrupts();
        OSReport("  ~~~~~~~~~~~~~~~~  SETTING SIZE OF ELEMENTS ARRAY  ~~~~~~~~~~~~~~~~  \n");
        _OSEnableInterrupts();
        sizeOfElements[i] = dataSize[i];
    }
    free(dataSize);

    EXIPacket getReplaysPacket = EXIPacket(GET_REPLAY_FILES, nullptr, 0);
    getReplaysPacket.Send();
    do {
        u8 *cmd_byte_read = (u8 *) malloc(1);
        // read in one byte from emulator to see how to deal with the rest of the exi buffer
        readEXI(cmd_byte_read, 1, EXIChannel::slotB, EXIDevice::device0, EXIFrequency::EXI_32MHz);
        cmd_byte = cmd_byte_read[0];
        free(cmd_byte_read);
    } while(cmd_byte != REPLAYS);

    for(int i = 0; i < numElements; i++)
    {
        read_data_size += sizeOfElements[i];
    }
    read_data_size /= sizeof(char*);
    u8* dataVec = (u8*)malloc(read_data_size);
    readEXI(dataVec, read_data_size, EXIChannel::slotB, EXIDevice::device0, EXIFrequency::EXI_32MHz);
    _OSDisableInterrupts();
    OSReport("  ~~~~~~~~~~~~~~~~  GET THE REPLAYS  ~~~~~~~~~~~~~~~~  \n");
    _OSEnableInterrupts();

    _OSDisableInterrupts();
    OSReport("  ~~~~~~~~~~~~~~~~  SETUP REPLAYS OBJECT  ~~~~~~~~~~~~~~~~  \n");
    _OSEnableInterrupts();

    EXIPacket getSizeOfNamesPacket = EXIPacket(GET_REPLAY_NAMES_SIZE, nullptr, 0);
    getSizeOfNamesPacket.Send();

    do {
        u8 *cmd_byte_read = (u8 *) malloc(1);
        // read in one byte from emulator to see how to deal with the rest of the exi buffer
        readEXI(cmd_byte_read, 1, EXIChannel::slotB, EXIDevice::device0, EXIFrequency::EXI_32MHz);
        cmd_byte = cmd_byte_read[0];
        free(cmd_byte_read);
    } while(cmd_byte != REPLAY_NAMES_SIZE);

    _OSDisableInterrupts();
    OSReport("  ~~~~~~~~~~~~~~~~  GET THE SIZE OF REPLAY NAMES  ~~~~~~~~~~~~~~~~  \n");
    _OSEnableInterrupts();

    auto dataNames = (u8*)malloc(numElements);
    readEXI(dataNames, numElements, EXIChannel::slotB, EXIDevice::device0, EXIFrequency::EXI_32MHz);
    for(int i = 0; i < numElements; i++)
    {
        _OSDisableInterrupts();
        OSReport("  ~~~~~~~~~~~~~~~~  SETTING SIZE OF NAMES ARRAY  ~~~~~~~~~~~~~~~~  \n");
        _OSEnableInterrupts();
        sizeOfNames[i] = dataNames[i];
    }
    Replays* replaysObj = new Replays(numElements, sizeOfElements, sizeOfNames);
    replaysObj->SetReplays((char**)dataVec);
    free(dataVec);
    free(dataNames);
    EXIPacket getReplayNamesPacket = EXIPacket(GET_REPLAY_NAMES, nullptr, 0);
    getReplayNamesPacket.Send();
    do {
        u8 *cmd_byte_read = (u8 *) malloc(1);
        // read in one byte from emulator to see how to deal with the rest of the exi buffer
        readEXI(cmd_byte_read, 1, EXIChannel::slotB, EXIDevice::device0, EXIFrequency::EXI_32MHz);
        cmd_byte = cmd_byte_read[0];
        free(cmd_byte_read);
    } while(cmd_byte != REPLAY_NAMES);

    for(int i = 0; i < numElements; i++)
    {
        read_data_size += sizeOfElements[i];
    }
    read_data_size /= sizeof(char*);
    u8* dataNameVec = (u8*)malloc(read_data_size);
    readEXI(dataNameVec, read_data_size, EXIChannel::slotB, EXIDevice::device0, EXIFrequency::EXI_32MHz);
    _OSDisableInterrupts();
    OSReport("  ~~~~~~~~~~~~~~~~  GET THE NAMES OF THE REPLAYS  ~~~~~~~~~~~~~~~~  \n");
    _OSEnableInterrupts();

    replaysObj->SetNames((char**)dataNameVec);
    free(dataNameVec);
}