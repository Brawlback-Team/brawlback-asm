
#include "./sndSystem.h"

void sndSystem::playSE(int effectID) {
  _playSE_sndSystem(this, effectID, -1, 0, 0, -1);
}