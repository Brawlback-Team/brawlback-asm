#include "Text_Printer.h"

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
        Drawable::Rect* r = new(Heaps::Network) Drawable::Rect{
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

    Message message;
    float lineHeight = 20;
    float maxWidth;
    float lineStart;
    float startY;
    float lastPadLocation;
    bool is2D = false;
    bool renderPre = false;
    u32 bboxIdx = 0;
}