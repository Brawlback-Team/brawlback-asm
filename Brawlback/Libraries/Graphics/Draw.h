//
// Created by johno on 7/18/2020.
//

#ifndef PROJECTMCODES_DRAW_H
#define PROJECTMCODES_DRAW_H

#include "Brawl/GF/gfCameraManager.h"
#include "Wii/GX/GX.h"
#include "Brawl/GF/gfDraw.h"

void start2DDraw();
void startNormalDraw();
void setupDrawPrimitives();

void drawTriangleFan(GXColor color, Position3D* vertices, u32 numVertices);
void draw2DRectangle(GXColor color, float top, float bottom, float left, float right, float zPos = 0);
void draw2DLine(GXColor color, float x1, float y1, float x2, float y2, u8 thickness);
void draw2DPoint(GXColor color, float x, float y, u8 size);
void draw2DRectOutline(GXColor color, float top, float bottom, float left, float right, u8 thickness);
void drawPrimitive(GXColor color, Position3D* vertices, u32 numVertices);

#endif //PROJECTMCODES_DRAW_H
