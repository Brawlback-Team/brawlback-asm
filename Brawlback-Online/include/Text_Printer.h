#pragma once
#include "Draw.h"

// Credit to Fudgepop01/Fracture for this: https://github.com/Fracture17/ProjectMCodes/tree/master/Libraries/Graphics
namespace TextPrinter {
    void print(const char* characters);
    void printLine(const char* characters);
    void padToWidth(float width);
    void newLine(bool fromPrintFn = false);
    void startBoundingBox();
    void saveBoundingBox(int id, GXColor color, float boxPadding = 0);
    void setTextColor(GXColor color);
    void start2D();
    void startNormal();
    void setup();

    extern Message message;
    extern float lineHeight;
    extern float maxWidth;
    extern float lineStart;
    extern float startY;
    extern float lastPadLocation;
    extern bool is2D;
    extern bool renderPre;
    extern u32 bboxIdx;
}