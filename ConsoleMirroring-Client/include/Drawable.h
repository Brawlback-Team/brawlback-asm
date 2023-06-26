#pragma once

#include <GX/GX.h>
#include <vector.h>
#include <OS/OSError.h>

struct Drawable {
    virtual void draw() = 0;

    GXColor color;
    unsigned int lifeTime;
    unsigned int delay;
    bool autoTimer;
    bool is2D;
    int drawKind;

    Drawable() {
        this->lifeTime = 1;
        this->delay = 0;
        this->autoTimer = true;
    }
};

struct Point : Drawable {
    Point(GXColor color, float x, float y, int thickness, bool is2D) {
        drawKind = 0;
        this->delay = 0;
        this->lifeTime = 1;
        this->color = color;
        this->is2D = is2D;
        this->x = x;
        this->y = y;
        this->thickness = thickness;
    }

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
    Line(GXColor color, float x1, float y1, float x2, float y2, int thickness, bool is2D)
    {
        drawKind = 1;
        this->delay = 0;
        this->lifeTime = 1;
        this->color = color;
        this->is2D = is2D;
        this->x1 = x1;
        this->y1 = y1;
        this->x2 = x2;
        this->y2 = y2;
        this->thickness = thickness;
    }

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
    RectOutline(GXColor color, float top, float bottom, float left, float right, int thickness, bool is2D) 
    {
        drawKind = 2;
        this->delay = 0;
        this->lifeTime = 1;
        this->color = color;
        this->is2D = is2D;
        this->top = top;
        this->bottom = bottom;
        this->left = left;
        this->right = right;
        this->thickness = thickness;
    }

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
    Rect(GXColor color, float top, float bottom, float left, float right, bool is2D) {
        drawKind = 3;
        this->delay = 0;
        this->lifeTime = 1;
        this->color = color;
        this->is2D = is2D;
        this->top = top;
        this->bottom = bottom;
        this->left = left;
        this->right = right;
    }

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
    Vector<T> frame;
    Vector<T> tick;
};

struct Renderables {
    void renderAll();
    void updateTick();

    RenderTimes<Drawable *> items;
};

extern Renderables renderables;
