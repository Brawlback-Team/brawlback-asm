#include "Netplay.h"


#include <cstdlib>


namespace Netplay {
    GameSettings gameSettings = GameSettings();
    GameSettings* getGameSettings() { return &gameSettings; }
    const u8 localPlayerIdxInvalid = 200;
    u8 localPlayerIdx = localPlayerIdxInvalid;

    void StartMatch() {
        OSReport("Filling in game settings from game\n");
        // populate game settings
        fillOutGameSettings(&gameSettings);

        OSReport("Starting match gameside\n");
        // send our populated game settings to the emu
        EXIPacket startMatchPckt = EXIPacket(EXICommand::CMD_START_MATCH, &gameSettings, sizeof(GameSettings));
        startMatchPckt.Send();

        // start emu netplay thread so it can start trying to find an opponent
        EXIPacket findOpponentPckt = EXIPacket(EXICommand::CMD_FIND_OPPONENT);
        findOpponentPckt.Send();

        u8 cmd_byte = EXICommand::CMD_UNKNOWN;
        size_t read_size = sizeof(GameSettings) + 1;
        u8* read_data = (u8*)malloc(read_size); // cmd byte + game settings

        OSReport("Attempting to read in SETUP_PLAYERS info...\n");
        // stall until we get game settings from opponent, then load those in and continue to boot up the match
        while (cmd_byte != EXICommand::CMD_SETUP_PLAYERS) {
            readEXI(read_data, read_size, EXIChannel::slotB, EXIDevice::device0, EXIFrequency::EXI_32MHz);
            cmd_byte = read_data[0];
            u8* data = &read_data[1];

            if (cmd_byte == EXICommand::CMD_SETUP_PLAYERS) {
                OSReport("SETUP PLAYERS GAMESIDE\n");
                GameSettings* gameSettingsFromOpponent = (GameSettings*)data;
                MergeGameSettingsIntoGame(gameSettingsFromOpponent);
            }
            else {
                //OSReport("Reading for setupplayers, didn't get it...\n");
            }
        }
        free(read_data);
    
    }

    bool CheckShouldStartNetplay() {
        bool isOnlineInputPressed = PAD_SYSTEM->pads[0].buttons.A || PAD_SYSTEM->pads[1].buttons.A;
        return isOnlineInputPressed;
    }

    void EndMatch() {
        localPlayerIdx = localPlayerIdxInvalid;
    }

}

