
#ifndef PROJECTMCODES_SNDSYSTEM_H
#define PROJECTMCODES_SNDSYSTEM_H

struct sndSystem {
  void playSE(int effectID);
};

#define SOUND_SYSTEM (((sndSystem* (*)()) 0x80683b48)())
#define _playSE_sndSystem ((void (*)(sndSystem * self, int id, int unk, int unk2, int unk3, int unk4)) 0x800742b0)

#endif