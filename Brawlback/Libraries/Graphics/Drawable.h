//
// Created by dareb on 8/8/2020.
//

#ifndef PROJECTMCODES_DRAWABLE_H
#define PROJECTMCODES_DRAWABLE_H

#include <Wii/GX/GX.h>
#include <Containers/vector.h>

#define OSReport ((void (*)(const char* text, ...)) 0x801d8600)

struct Drawable {
    virtual void draw() = 0;

    GXColor color;
    unsigned int lifeTime = 1;
    unsigned int delay = 0;
    bool autoTimer = true;
    bool is2D;
    int drawKind;
};

struct Point : Drawable {
    Point(GXColor color, float x, float y, int thickness, bool is2D) :
        Point(0, 1, color, x, y, thickness, is2D) {}

    Point(int delay, int lifetime, GXColor color, float x, float y, int thickness, bool is2D) {
        drawKind = 0;
        this->delay = delay;
        this->lifeTime = lifetime;
        this->color = color;
        this->is2D = is2D;
        this->x = x;
        this->y = y;
        this->thickness = thickness;
    }

    void draw();
    float x;
    float y;
    int thickness;
};

struct Line : Drawable {
    Line(GXColor color, float x1, float y1, float x2, float y2, int thickness, bool is2D) :
        Line(0, 1, color, x1, y1, x2, y2, thickness, is2D) {};

    Line(int delay, int lifetime, GXColor color, float x1, float y1, float x2, float y2, int thickness, bool is2D) {
        drawKind = 1;
        this->delay = delay;
        this->lifeTime = lifetime;
        this->color = color;
        this->is2D = is2D;
        this->x1 = x1;
        this->y1 = y1;
        this->x2 = x2;
        this->y2 = y2;
        this->thickness = thickness;
    }

    void draw();
    float x1;
    float y1;
    float x2;
    float y2;
    int thickness;
};

struct RectOutline : Drawable {
    RectOutline(GXColor color, float top, float bottom, float left, float right, int thickness, bool is2D) :
        RectOutline(0, 1, color, top, bottom, left, right, thickness, is2D) {} ;

    RectOutline(int delay, int lifetime, GXColor color, float top, float bottom, float left, float right, int thickness, bool is2D) {
        drawKind = 2;
        this->delay = delay;
        this->lifeTime = lifetime;
        this->color = color;
        this->is2D = is2D;
        this->top = top;
        this->bottom = bottom;
        this->left = left;
        this->right = right;
        this->thickness = thickness;
    }

    void draw();
    float top;
    float bottom;
    float left;
    float right;
    int thickness;
};

struct Rect : Drawable {
    Rect(GXColor color, float top, float bottom, float left, float right, bool is2D) :
        Rect(0, 1, color, top, bottom, left, right, is2D) {};

    Rect(int delay, int lifetime, GXColor color, float top, float bottom, float left, float right, bool is2D) {
        drawKind = 3;
        this->delay = delay;
        this->lifeTime = lifetime;
        this->color = color;
        this->is2D = is2D;
        this->top = top;
        this->bottom = bottom;
        this->left = left;
        this->right = right;
    }

    Rect(float x, float y, float width, float height, bool is2D, GXColor color) {
        drawKind = 3;
        this->delay = 0;
        this->lifeTime = 1;
        this->color = color;
        this->top = y + (height / 2);
        this->bottom = y - (height / 2);
        this->left = x - (width / 2);
        this->right = x + (width / 2);
        this->is2D = is2D;
    }

    void draw();
    float top;
    float bottom;
    float left;
    float right;
};

template<class T>
struct RenderTimes {
    vector<T> frame;
    vector<T> tick;
};

struct Renderables {
    void renderAll();
    void updateTick();

    RenderTimes<Drawable *> items;
};

extern Renderables renderables;

#endif //PROJECTMCODES_DRAWABLE_H
