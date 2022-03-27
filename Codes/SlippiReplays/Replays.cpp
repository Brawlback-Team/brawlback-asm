#include "Replays.h"

u32 Replays::GetNumReplays()
{
    return this->numReplays;
}

u8* Replays::GetSizeOfReplays()
{
    return this->sizeOfReplays;
}

char** Replays::GetReplays()
{
    return this->replays;
}

void Replays::SetReplays(char** replays)
{
    for(int i = 0; i < this->numReplays; i++)
    {
        for(int f = 0; f < this->sizeOfReplays[i]; f++)
        {
            this->replays[i][f] = replays[i][f];
        }
    }
}

void Replays::SetNumReplays(u32 numReplays)
{
    this->numReplays = numReplays;
}

void Replays::SetSizeOfReplays(u8* sizeOfReplays)
{
    memcpy(this->sizeOfReplays, sizeOfReplays, sizeof(u8));
}

Replays::Replays(u32 numReplays, u8* sizeOfReplays)
{
    this->replays = new char*();
    for(int i = 0; i < numReplays; i++)
    {
        this->replays[i] = new char(sizeOfReplays[i]);
    }
    SetSizeOfReplays(sizeOfReplays);
    SetNumReplays(numReplays);
}