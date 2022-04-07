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

char** Replays::GetNames()
{
    return this->names;
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

void Replays::SetNames(char** names)
{
    for(int i = 0; i < this->numReplays; i++)
    {
        for(int f = 0; f < this->sizeOfNames[i]; f++)
        {

            this->names[i][f] = names[i][f];
        }
    }
}

void Replays::SetNumReplays(u32 numReplays)
{
    this->numReplays = numReplays;
}

void Replays::SetSizeOfReplays(u8* sizeOfReplays)
{
    this->sizeOfReplays = new u8[(int)this->numReplays];
    for(int i = 0; i < this->numReplays; i++)
    {
        this->sizeOfReplays[i] = sizeOfReplays[i];
    }
}

Replays::Replays(u32 numReplays, u8* sizeOfReplays, u8* sizeOfNames)
{
    this->replays = new char*[(int)numReplays];
    this->names = new char*[(int)numReplays];
    for(int i = 0; i < numReplays; i++)
    {
        this->replays[i] = new char[sizeOfReplays[i]];
        this->names[i] = new char[sizeOfNames[i]];
    }
    SetNumReplays(numReplays);
    SetSizeOfReplays(sizeOfReplays);
    SetSizeOfNames(sizeOfNames);
}

u8 *Replays::GetSizeOfNames()
{
    return this->sizeOfNames;
}

void Replays::SetSizeOfNames(u8* sizeOfNames)
{
    this->sizeOfNames = new u8[(int)this->numReplays];
    for(int i = 0; i < this->numReplays; i++)
    {
        this->sizeOfNames[i] = sizeOfNames[i];
    }
}
