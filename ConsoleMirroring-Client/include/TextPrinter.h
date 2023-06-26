#pragma once
#include <ms/message.h>


struct TextPrinter {
    TextPrinter() {
        lineHeight = 20;
        is2D = false;
    }
    void print(const char* characters);
    void printLine(const char* characters);
    void padToWidth(float width);
    void newLine(bool fromPrintFn = false);
    void startBoundingBox();
    void saveBoundingBox(int id, GXColor color, float boxPadding = 0);
    void drawBoundingBoxes(int id);
    void setTextColor(GXColor color);
    void start2D();
    void startNormal();
    void setup();

    Message message;
    float lineHeight;
    float maxWidth;
    float lineStart;
    float startY;
    float lastPadLocation;
    bool is2D;
};

extern TextPrinter printer;