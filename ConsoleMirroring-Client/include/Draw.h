//
// Created by johno on 7/18/2020.
//

#pragma once

#include <GF/gf_camera.h>
#include <GX/GX.h>
#include <gf/gf_draw.h>
#include <types.h>

typedef struct Position3D {
    f32 x;
    f32 y;
    f32 z;
} Position3D;

void start2DDraw();
void startNormalDraw();
void setupDrawPrimitives();

void drawTriangleFan(GXColor color, Position3D* vertices, u32 numVertices);
void draw2DRectangle(GXColor color, float top, float bottom, float left, float right, float zPos = 0);
void draw2DLine(GXColor color, float x1, float y1, float x2, float y2, u8 thickness);
void draw2DPoint(GXColor color, float x, float y, u8 size);
void draw2DRectOutline(GXColor color, float top, float bottom, float left, float right, u8 thickness);
void drawPrimitive(GXColor color, Position3D* vertices, u32 numVertices);

