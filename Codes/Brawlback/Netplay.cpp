#include "Netplay.h"
#include "GmGlobalModeMelee.h"
#include "etl/array.h"
#include <cstdlib>


namespace Netplay {
    bool isInMatch = false;
    bool IsInMatch() { return isInMatch; }
    void SetIsInMatch(bool isMatch) { isInMatch = isMatch; }


    GameSettings gameSettings;
    GameSettings& getGameSettings() { return gameSettings; }
    const u8 localPlayerIdxInvalid = 200;
    u8 localPlayerIdx = localPlayerIdxInvalid;

    void FixGameSettingsEndianness(GameSettings& settings) {
        swapByteOrder(settings.stageID);
    }

    void StartMatching() {
        OSReport("Filling in game settings from game\n");
        // populate game settings
        fillOutGameSettings(gameSettings);

        OSReport("Starting match gameside\n");
        // send our populated game settings to the emu
        EXIPacket startMatchPckt = EXIPacket(EXICommand::CMD_START_MATCH, &gameSettings, sizeof(GameSettings));
        startMatchPckt.Send();

        // start emu netplay thread so it can start trying to find an opponent
        EXIPacket findOpponentPckt = EXIPacket(EXICommand::CMD_FIND_OPPONENT);
        findOpponentPckt.Send();

        // Temporary. Atm, this just stalls main thread while we do our mm/connecting
        // in the future, when netmenu stuff is implemented, the organization of StartMatching and CheckIsMatched
        // will make more sense
        while (!CheckIsMatched()) {}

    }

    
    bool CheckIsMatched() {
        bool matched = false;
        u8 cmd_byte = EXICommand::CMD_UNKNOWN;

        // cmd byte + game settings
        etl::array<u8, sizeof(GameSettings) + 1> read_data;
        size_t read_size = sizeof(GameSettings) + 1;

        // stall until we get game settings from opponent, then load those in and continue to boot up the match
        //while (cmd_byte != EXICommand::CMD_SETUP_PLAYERS) {
            readEXI(read_data.data(), read_data.size(), EXIChannel::slotB, EXIDevice::device0, EXIFrequency::EXI_32MHz);
            cmd_byte = read_data[0];

            if (cmd_byte == EXICommand::CMD_SETUP_PLAYERS) {
                OSReport("SETUP PLAYERS GAMESIDE\n");
                auto gameSettingsFromOpponent = bufferToObject<GameSettings>(&read_data[1]);
                FixGameSettingsEndianness(gameSettingsFromOpponent);
                MergeGameSettingsIntoGame(gameSettingsFromOpponent);
                // TODO: we shoud assign the gameSettings var to the gameSettings from opponent since its merged with ours now.
                gameSettings.localPlayerPort = gameSettingsFromOpponent.localPlayerPort;
                matched = true;
            }
            else {
                //OSReport("Reading for setupplayers, didn't get it...\n");
            }
        //}
        return matched;
    }

    void EndMatch() {
        localPlayerIdx = localPlayerIdxInvalid;
        gameSettings = GameSettings();
        GMMelee::ResetMatchChoicesPopulated();
    }

}

