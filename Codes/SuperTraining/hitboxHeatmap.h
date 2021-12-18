
#ifndef PROJECTMCODES_HITBOXHEATMAP_H
#define PROJECTMCODES_HITBOXHEATMAP_H

#include <Wii/GX/GX.h>
#include "Containers/vector.h"

struct HitboxData {
  HitboxData(double radius, float scaleMatrix[3][4], float pos1[3], float pos2[3], unsigned int colour1, unsigned int colour2) {
    fillInData(radius, scaleMatrix, pos1, pos2, colour1, colour2);
  }
  void fillInData(double radius, float scaleMatrix[3][4], float pos1[3], float pos2[3], unsigned int colour1, unsigned int colour2) {
    this->radius = radius;
    for (int i = 0; i < 3; i++) {
      this->pos2[i] = pos2[i];
      this->pos1[i] = pos1[i];
    }
    this->colour1 = GXColor(colour1);
    this->colour2 = GXColor(colour2);
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 4; j++) {
        this->scaleMatrix[i][j] = scaleMatrix[i][j];
      }
    }
  }
  double radius;
  float scaleMatrix[3][4];
  float pos1[3];
  float pos2[3];
  GXColor colour1;
  GXColor colour2;
};

struct HitboxDataFrame {
  vector<HitboxData*> hitboxes;
  int frame;
  int life;
};

void renderAllStoredHitboxes();
void storedHitboxTick();

struct FudgeAIHitbox {
  bool overwrite = true;
  float xOrigin = 0;
  float yOrigin = 0;
  float xMin = 0;
  float yMin = 0;
  float xMax = 0;
  float yMax = 0;
  float trueXMin = 0;
  float trueYMin = 0;
  float width = 0;
  float height = 0;
  GXColor color = GXColor(0x00FF0088);
};

extern FudgeAIHitbox fudgeAI;
// void storeRenderingData();
// void storePlayerData();

#endif // PROJECTMCODES_HITBOXHEATMAP_H