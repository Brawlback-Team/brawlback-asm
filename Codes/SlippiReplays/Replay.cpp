#include "Replay.h"

void Replay::AddFrame(etl::vector<u8, 64> frame)
{
    this->frames[0].push_back(frame);
}

etl::vector<etl::vector<u8, 64>, 28800> Replay::GetFrames()
{
    return this->frames[0];
}

etl::string<256> Replay::GetName()
{
    return this->name;
}

etl::vector<etl::vector<float, 3>, 4> Replay::GetStartPositions()
{
    return this->startPositions;
}

u8 Replay::GetStageId()
{
    return this->stageID;
}

int Replay::GetNumPlayers()
{
    return this->numPlayers;
}

etl::vector<u32, 2> Replay::GetRand()
{
    return this->rand;
}

etl::vector<int, 4> Replay::GetFighterIds()
{
    return this->fighterIDs;
}

void Replay::SetFrames(etl::vector<etl::vector<u8, 64>, 28800> frames)
{
    this->frames.uninitialized_resize(frames.size());
    for(int i = 0; i < frames.size(); i++)
    {
        this->frames[i].resize(frames[i].size());
        for(int f = 0; f < frames[i].size(); f++)
        {
            this->frames[i][f] = frames[i][f];
        }
    }
}

void Replay::SetName(etl::string<256> name)
{
    this->name = name;
}

void Replay::SetStartPositions(etl::vector<etl::vector<float, 3>, 4> startPositions) 
{
    this->startPositions.resize(startPositions.size());
    for(int i = 0; i < startPositions.size(); i++)
    {
        this->startPositions[i].resize(startPositions[i].size());
        for(int f = 0; f < startPositions[i].size(); f++)
        {
            this->startPositions[i][f] = startPositions[i][f];
        }
    }
}

void Replay::SetStageId(u8 stageId)
{
    this->stageID = stageId;
}

void Replay::SetNumPlayers(int numPlayers)
{
    this->numPlayers = numPlayers;
}

void Replay::SetRand(etl::vector<u32, 2> rand)
{
    this->rand.resize(rand.size());
    for(int i = 0; i < rand.size(); i++)
    {
        this->rand[i] = rand[i];
    }
}

void Replay::SetFighterIds(etl::vector<int, 4> fighterIDs)
{
    this->fighterIDs.resize(fighterIDs.size());
    for(int i = 0; i < fighterIDs.size(); i++)
    {
        this->fighterIDs[i] = fighterIDs[i];
    }
}

Replay::Replay() {
    this->SetFrames(etl::vector<etl::vector<u8, 64>, 28800>());
    this->SetName(etl::string<256>());
    this->SetStartPositions(etl::vector<etl::vector<float, 3>, 4>());
    this->SetStageId(0);
    this->SetNumPlayers(0);
    this->SetRand(etl::vector<u32, 2>());
    this->SetFighterIds(etl::vector<int, 4>());
}

Replay::Replay(const Replay &that)
{
    this->SetFrames(that.frames[0]);
    this->SetName(that.name);
    this->SetStartPositions(that.startPositions);
    this->SetStageId(that.stageID);
    this->SetNumPlayers(that.numPlayers);
    this->SetRand(that.rand);
    this->SetFighterIds(that.fighterIDs);
}

Replay& Replay::operator=(const Replay &that)
{
    this->SetFrames(that.frames[0]);
    this->SetName(that.name);
    this->SetStartPositions(that.startPositions);
    this->SetStageId(that.stageID);
    this->SetNumPlayers(that.numPlayers);
    this->SetRand(that.rand);
    this->SetFighterIds(that.fighterIDs);
    return *this;
}
