#include "Text_Printer.h"
#include <GX/GXGeometry.h>
#include <GX/GXPixel.h>
#include <GX/GXTev.h>
#include <GX/GX.h>

namespace Draw {
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
}

namespace Drawable {
    Renderables renderables;
    void Point::draw() {
        Draw::draw2DPoint(this->color, this->x, this->y, this->thickness);
    }

    void Line::draw() {
        Draw::draw2DLine(color, x1, y1, x2, y2, thickness);
    }

    void RectOutline::draw() {
        Draw::draw2DRectOutline(color, top, bottom, left, right, thickness);
    }

    void Rect::draw() {
        // OSReport("addr: %08x\n", this);
        OSReport("rect draw: (col, t, b, l, r): %08x, %.3f, %.3f, %.3f, %.3f\n", color.value, top, bottom, left, right);
        Draw::draw2DRectangle(color, top, bottom, left, right);
    }

    void drawItem(Drawable * item) {
        Draw::setupDrawPrimitives();
        if (item->delay == 0) {
            if (item->is2D) { Draw::start2DDraw(); }
            else { Draw::startNormalDraw(); }
            item->draw();
            if (item->autoTimer) { item->lifeTime --; }
        } else { if (item->autoTimer) { item->delay --; } }
    }

    void Renderables::renderAll() {
        for (int i = 0; i < items.frame.size(); i++) {
            drawItem(items.frame[i]);
            if (items.frame[i]->lifeTime == 0) {
                // delete items.frame[i];
                items.frame.erase(i); 
                i -= 1;
            }
        }
        for (int i = 0; i < items.tick.size(); i++) { 
            drawItem(items.tick[i]);
            if (items.tick[i]->lifeTime == 0) {
                // delete items.tick[i];
                items.tick.erase(i); 
                i -= 1;
            }
        }
    }

    void Renderables::updateTick() {
        for (int i = 0; i < items.tick.size(); i++) {
            if (items.tick[i]->delay == 0) {
                items.tick[i]->lifeTime --;
                if (items.tick[i]->lifeTime == 0) { items.tick.erase(i); }
            } else {
                items.tick[i]->delay --;
            }
        }
    }
}

namespace TextPrinter {
    void setup() {
        //save font values
        auto savedFont1 = _FONT_THING1;
        auto savedFont2 = _FONT_THING2;
        auto savedFontScaleX = message.fontScaleX;
        auto savedFontScaleY = message.fontScaleY;

        //clear font values
        _FONT_THING1 = nullptr;
        _FONT_THING2 = nullptr;

        //clear 2D flag
        is2D = false;
        startBoundingBox();

        //setDefaultEnv uses some values from the message buffer
        //We don't need these values to print, but ignoring it will causes crashes
        void* fakeMessageBuffer[0x40] = {};
        fakeMessageBuffer[0x4C / 4] = &fakeMessageBuffer;
        message._messageBuffer = &fakeMessageBuffer;

        setDefaultEnv(&message, 0, 9);

        GXSetCullMode(GXCullMode::GX_CULL_NONE);
    //    message.setObjZCompare(GXCompare::GX_EQUAL, true);

        // message.font = MELEE_FONT;
        // other fonts include: 
        // - font_latin12.arc
        // - font_latin1.arc
        // - font_watch.arc

        // // BLANK (0) (enc: 3; fmt: )
        // message.font = (FontData*) 0x80497d2c;
        // OSReport("0 enc: %08x\n", message.font->GetGlyph());
        // // MELEE STANDARD (1) / DEFAULT (enc: 0; fmt: )
        // message.font = (FontData*) 0x80497d54;
        // OSReport("1 enc: %08x\n", message.font->GetGlyph());
        // // Hiranga Font (2) (starts @ 0x32) (USA Tags) (enc: 0; fmt: )
        // message.font = (FontData*) 0x80497da4;
        // OSReport("2 enc: %08x\n", message.font->GetGlyph());
        // // Ending Font (3) (enc: 0; fmt: )
        // message.font = (FontData*) 0x80497dcc;
        // OSReport("3 enc: %08x\n", message.font->GetGlyph());
        // // Melee Font (4) (MELEE MONO) (enc: 0; fmt: )
        // message.font = (FontData*) 0x80497e44;
        // OSReport("4 enc: %08x\n", message.font->GetGlyph());
        // // Resant Font (5) (enc: 0; fmt: )
        // message.font = (FontData*) 0x80497df4;
        // OSReport("5 enc: %08x\n", message.font->GetGlyph());
        // // Fox Font (6) (enc: 0; fmt: )
        // message.font = (FontData*) 0x80497e1c;
        // OSReport("6 enc: %08x\n", message.font->GetGlyph());
        // // Alert Font(?) (7) (enc: 0; fmt: )
        // message.font = (FontData*) 0x80497e6c;
        // OSReport("7 enc: %08x\n", message.font->GetGlyph());
        // // USA MAIN MENU (8) (enc: 0; fmt: )
        // message.font = (FontData*) 0x80497d7c;
        // OSReport("8 enc: %08x\n", message.font->GetGlyph());

        message.font = &MELEE_FONT;
        //restore font values
        _FONT_THING1 = savedFont1;
        _FONT_THING2 = savedFont2;
        message.fontScaleX = savedFontScaleX;
        message.fontScaleY = savedFontScaleY;
    }
    void start2D() {
        is2D = true;
        Draw::start2DDraw();
    }
    void startNormal() {
        is2D = false;

        Draw::startNormalDraw();
    }
    void print(const char* characters) {
        if (is2D) {
            message.yPos *= -1;
            message.fontScaleY *= -1;
        }

        for (; *characters; characters++) {
            if (*characters == '\n') {
                newLine(true);
            }
            else {
                message.printChar(*characters);
                // message.printChar(0xFF00 | *chars);
            }
        }

        if (is2D) {
            message.yPos *= -1;
            message.fontScaleY *= -1;
        }
    }
    void printLine(const char* characters) {
        print(characters);
        newLine();
    }
    void padToWidth(float width) {
        float newLocation = width + lastPadLocation;
        if (message.xPos < newLocation) {
            message.xPos = newLocation;
            lastPadLocation = newLocation;
        }
        else {
            lastPadLocation = message.xPos;
        }
    }
    void newLine(bool fromPrintFn) {
        if (lineStart + maxWidth < message.xPos) {
            maxWidth = message.xPos - lineStart;
        }
        message.xPos = lineStart;
        lastPadLocation = lineStart;
        message.yPos += (fromPrintFn && is2D) ? -lineHeight : lineHeight;
    }
    void startBoundingBox() {
        startY = message.yPos;
        lineStart = message.xPos;
        lastPadLocation = message.xPos;
        maxWidth = 0;
        if (renderPre) bboxIdx = Drawable::renderables.items.preFrame.size();
        else bboxIdx = Drawable::renderables.items.frame.size();
    }
    void saveBoundingBox(int id, GXColor color, float boxPadding) {
        if (lineStart + maxWidth < message.xPos) {
            maxWidth = message.xPos - lineStart;
        }

        int multiplier = (is2D) ? 1 : -1;
        Drawable::Rect* r = new Drawable::Rect{
                0,
                1,
                color,
                (startY - boxPadding) * multiplier,
                (message.yPos + lineHeight + boxPadding) * multiplier,
                lineStart - boxPadding,
                lineStart + maxWidth + boxPadding,
                is2D
        };
        // OSReport("Rect in (t, b, l, r): %.3f, %.3f, %.3f, %.3f\n", r.top, r.bottom, r.left, r.right);
        if (renderPre) Drawable::renderables.items.preFrame.push(r, bboxIdx);
        else Drawable::renderables.items.frame.push(r, bboxIdx);
        setup();
    }
    void setTextColor(GXColor color) {
        message.textColor.color1 = color;
        message.textColor.color2 = color;
        message.textColor.color3 = color;
        message.textColor.color4 = color;
    }
}