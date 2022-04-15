#include "PlaybackMenu.h"

namespace replayMenus {
    etl::vector<class Replay, INT_MAX> replaysObj;
    Menu* replaysMenu;
    bool replaysOpen = false;
    bool visible = false;
    bool instantResponse = true;
    SIMPLE_INJECTION(pullReplayStrings, 0x8119795c, "stwu sp, -0x0020(sp)") {
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
        u8 sizeOfFrame;
        u8* sizeOfNames;
        u32 read_data_size = 0;

        _OSDisableInterrupts();
        OSReport("  ~~~~~~~~~~~~~~~~  GET THE NUMBER OF REPLAYS  ~~~~~~~~~~~~~~~~  \n");
        _OSEnableInterrupts();

        u8* data = (u8*)malloc(1);
        readEXI(data, 1, EXIChannel::slotB, EXIDevice::device0, EXIFrequency::EXI_32MHz);
        numElements = data[0];
        free(data);
        sizeOfNames = new u8[numElements];

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
        free(dataNames);
        etl::vector<etl::string<256>, INT_MAX> vecNames(numElements);
        for(int i = 0; i < numElements; i++)
        {
            _OSDisableInterrupts();
            OSReport("  ~~~~~~~~~~~~~~~~  GET THE NAMES OF THE REPLAYS  ~~~~~~~~~~~~~~~~  \n");
            _OSEnableInterrupts();

            u8 *index = new u8[1];
            index[0] = i;
            EXIPacket getReplayNamesPacket = EXIPacket(EXIStatus::GET_REPLAY_NAMES, index, 1 * sizeof(u8));
            getReplayNamesPacket.Send();
            do {
                u8 *cmd_byte_read = (u8 *) malloc(1);
                // read in one byte from emulator to see how to deal with the rest of the exi buffer
                readEXI(cmd_byte_read, 1, EXIChannel::slotB, EXIDevice::device0, EXIFrequency::EXI_32MHz);
                cmd_byte = cmd_byte_read[0];
                free(cmd_byte_read);
            } while(cmd_byte != REPLAY_NAMES);
            read_data_size = sizeOfNames[i];
            u8* dataNameVec = (u8*)malloc(read_data_size);
            readEXI(dataNameVec, read_data_size, EXIChannel::slotB, EXIDevice::device0, EXIFrequency::EXI_32MHz);
            etl::string<256> curName;
            curName.resize(read_data_size);
            for(int f = 0; f < read_data_size; f++)
            {
                curName[i] = ((char*)dataNameVec)[i];
            }
            _OSDisableInterrupts();
            OSReport(curName.data());
            _OSEnableInterrupts();
            vecNames.push_back(curName);

            class Replay curReplay;
            free(dataNameVec);
            replaysObj.push_back(curReplay);
        }

        free(sizeOfNames);
        replaysOpen = true;
    }
    INJECTION("frameUpdate", 0x8001792c, R"(
        bl updateOnFrame
        addi r3, r30, 280
    )");
    extern "C" void updateOnFrame() {
        if(replaysOpen)
        {
            if (replaysMenu == nullptr)
            {
                replaysMenu = new Menu();
                Page* mainPage = new Page(replaysMenu);
                mainPage->setTitle((char*)"main");
                ReplaysMenu* replaysPage = new ReplaysMenu(replaysMenu);
                PageLink* replaysPageLink = new PageLink((char*)"replays", replaysPage);
                mainPage->addOption(replaysPageLink);
                replaysMenu->nextPage(mainPage);
            }

            printer.setup();
            printer.drawBoundingBoxes(0);

            startNormalDraw();

            printer.setup();

            Message * message = &printer.message;
            message->fontScaleX = 0.1;
            message->fontScaleY = 0.1;
            printer.lineHeight = 20 * message->fontScaleY;

            char buffer[200] = {};
            char aiInputBuffer[100] = {};

            message->xPos = 1;
            message->yPos = 1;
            message->zPos = 0;

            setupDrawPrimitives();

            PADButtons btn;
            btn.bits = PREVIOUS_PADS[0].button.bits | PREVIOUS_PADS[1].button.bits | PREVIOUS_PADS[2].button.bits | PREVIOUS_PADS[3].button.bits;
            visible = replaysMenu->visible;
            bool selected = replaysMenu->selected;
            if (btn.L && btn.R && btn.UpDPad && btn.B)
            {
                if (instantResponse)
                {
                    replaysMenu->toggle();
                    instantResponse = false;
                    SOUND_SYSTEM->playSE(34);
                }
            }
            else if (btn.L && btn.R && btn.DownDPad)
            {
                if (instantResponse)
                {
                    if (selected) replaysMenu->deselect();
                    replaysMenu->visible = false;
                    instantResponse = false;
                }
            }
            else if (visible)
            {
                if (btn.B && replaysMenu->path.size() <= 1 && !selected)
                {
                    if (instantResponse)
                    {
                        replaysMenu->toggle();
                        instantResponse = false;
                        SOUND_SYSTEM->playSE(34);
                    }
                }
                else if (btn.A)
                {
                    if (instantResponse)
                    {
                        replaysMenu->select();
                        instantResponse = false;
                        SOUND_SYSTEM->playSE(1);
                    }
                }
                else if (btn.DownDPad)
                {
                    if (instantResponse)
                    {
                        replaysMenu->down();
                        instantResponse = false;
                        SOUND_SYSTEM->playSE(0);
                    }
                }
                else if (btn.UpDPad)
                {
                    if (instantResponse)
                    {
                        replaysMenu->up();
                        instantResponse = false;
                        SOUND_SYSTEM->playSE(0);
                    }
                }
                else
                {
                    instantResponse = true;
                }
            }
            else
            {
                instantResponse = true;
            }
            renderables.renderAll();
            startNormalDraw();
            if (visible)
            {
                printer.setup();
                printer.start2D();

                message->fontScaleY = RENDER_SCALE_Y;
                message->fontScaleX = RENDER_SCALE_X;
                printer.lineHeight = 20 * message->fontScaleY;
                message->xPos = LEFT_PADDING;
                message->yPos = TOP_PADDING;
                replaysMenu->render(&printer, buffer);
            }

            startNormalDraw();
        }
    }
    void ReplayOption::render(TextPrinter* printer, char* buffer)
    {
        sprintf(buffer, "%s", name);
        printer->printLine(buffer);
    }
    ReplayOption::ReplayOption(char* name)
    {
        sprintf(this->name, "%.19s", name);
    }
    void ReplayOption::select()
    {

    }
    ReplaysMenu::ReplaysMenu(Menu *myMenu) : Page(myMenu)
    {
        for(int i = 0; i < replaysObj.size(); i++)
        {
            this->addOption(new ReplayOption(replaysObj[i].GetName().data()));
        }
    }
}