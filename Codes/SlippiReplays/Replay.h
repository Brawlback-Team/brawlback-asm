#ifndef PROJECTMCODES_REPLAY_H
#define PROJECTMCODES_REPLAY_H
#include "etl/vector.h"
#include "etl/string.h"
#include "etl/memory.h"
#include "Assembly.h"
#include "Debug.h"
#include "Wii/EXI/EXI.h"
#include "Memory.h"
#include "Wii/PAD/PADStatus.h"
#include "Brawl/GF/GameFrame.h"
#include "Brawl/GF/gfApplication.h"
#include <Brawl/FT/ftManager.h>
#include <Brawl/GF/GameGlobal.h>
#include <Wii/mtRand.h>
#include <Brawl/IT/itManager.h>
#include "EXIPacket.h"
#include "Containers/vector.h"
#include "Wii/OS/OSInterrupt.h"

class Replay
{
private:
    etl::unique_ptr<etl::vector<etl::vector<u8, 64>, 28800>> frames;
    etl::string<256> name;
    etl::vector<etl::vector<float, 3>, 4> startPositions;
    u8 stageID;
    int numPlayers;
    etl::vector<u32, 2> rand;
    etl::vector<int, 4> fighterIDs;
public:
    Replay();
    Replay(const Replay &that);
    Replay& operator=(const Replay &that);
    void AddFrame(etl::vector<u8, 64>);
    etl::vector<etl::vector<u8, 64>, 28800> GetFrames();
    etl::string<256> GetName();
    etl::vector<etl::vector<float, 3>, 4> GetStartPositions();
    u8 GetStageId();
    int GetNumPlayers();
    etl::vector<u32, 2> GetRand();
    etl::vector<int, 4> GetFighterIds();
    void SetFrames(etl::vector<etl::vector<u8, 64>, 28800>);
    void SetName(etl::string<256>);
    void SetStartPositions(etl::vector<etl::vector<float, 3>, 4>);
    void SetStageId(u8);
    void SetNumPlayers(int);
    void SetRand(etl::vector<u32, 2>);
    void SetFighterIds(etl::vector<int, 4>);
};


#endif //PROJECTMCODES_REPLAY_H
