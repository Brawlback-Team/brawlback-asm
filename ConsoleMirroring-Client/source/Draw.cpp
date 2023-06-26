#include "Draw.h"
#include <GX/GXGeometry.h>
#include <GX/GXPixel.h>
#include <GX/GXTev.h>
#include <GX/GX.h>
void start2DDraw() {
    gfDrawSetupCoord2D();
}

void setupDrawPrimitives() {
    //assumes you never want your primitives to be culled
    GXSetCullMode(GX_CULL_NONE);
    gfDrawSetVtxPosColorPrimEnviroment();
    GXSetZMode(true, GX_LEQUAL, false);
    GXSetAlphaCompare(GX_ALWAYS, 0, GX_AOP_OR, GX_ALWAYS, 0);
}

void startNormalDraw() {
    gfCameraManager* manager = gfCameraManager::getManager();
    setGX(manager->m_cameras);
}

void drawTriangleFan(GXColor color, Position3D* vertices, u32 numVertices) {
    GXBegin(GX_TRIANGLEFAN, 1, numVertices);

    drawPrimitive(color, vertices, numVertices);
}

void draw2DRectangle(GXColor color, float top, float bottom, float left, float right, float zPos) {
    GXBegin(GX_QUADS, 1, 4);

    WGPIPE.f = left;
    WGPIPE.f = top;
    WGPIPE.f = zPos;
    WGPIPE.i = color.value;

    WGPIPE.f = right;
    WGPIPE.f = top;
    WGPIPE.f = zPos;
    WGPIPE.i = color.value;

    WGPIPE.f = right;
    WGPIPE.f = bottom;
    WGPIPE.f = zPos;
    WGPIPE.i = color.value;

    WGPIPE.f = left;
    WGPIPE.f = bottom;
    WGPIPE.f = zPos;
    WGPIPE.i = color.value;
}

void draw2DLine(GXColor color, float x1, float y1, float x2, float y2, u8 thickness) {
    GXSetPointSize(0, 0);
    GXSetLineWidth(thickness, 0);
    GXBegin(GX_LINES, 1, 2);

    WGPIPE.f = x1;
    WGPIPE.f = y1;
    WGPIPE.f = 0;
    WGPIPE.i = color.value;

    WGPIPE.f = x2;
    WGPIPE.f = y2;
    WGPIPE.f = 0;
    WGPIPE.i = color.value;
}

void draw2DPoint(GXColor color, float x1, float y1, u8 thickness) {
    GXSetPointSize(thickness, 0);
    GXBegin(GX_POINTS, 1, 1);

    WGPIPE.f = x1;
    WGPIPE.f = y1;
    WGPIPE.f = 0;
    WGPIPE.i = color.value;
}

void draw2DRectOutline(GXColor color, float top, float bottom, float left, float right, u8 thickness) {
    GXSetPointSize(thickness, 0);
    GXSetLineWidth(thickness, 0);
    GXBegin(GX_LINESTRIP, 1, 5);

    WGPIPE.f = left;
    WGPIPE.f = top;
    WGPIPE.f = 0;
    WGPIPE.i = color.value;

    WGPIPE.f = right;
    WGPIPE.f = top;
    WGPIPE.f = 0;
    WGPIPE.i = color.value;

    WGPIPE.f = right;
    WGPIPE.f = bottom;
    WGPIPE.f = 0;
    WGPIPE.i = color.value;

    WGPIPE.f = left;
    WGPIPE.f = bottom;
    WGPIPE.f = 0;
    WGPIPE.i = color.value;

    WGPIPE.f = left;
    WGPIPE.f = top;
    WGPIPE.f = 0;
    WGPIPE.i = color.value;
}

/*void drawQuads(GXColor color, Position3D* vertices, u32 numVertices) {
    _GXBegin(GXPrimitive::GX_QUADS, 1, numVertices);

    drawPrimitive(color, vertices, numVertices);
}*/


void drawPrimitive(GXColor color, Position3D* vertices, u32 numVertices) {
    for(int i = 0; i < numVertices; i++) {
        WGPIPE.f = vertices[i].x;
        WGPIPE.f = vertices[i].y;
        WGPIPE.f = vertices[i].z;
        WGPIPE.i = color.value;
    }
}