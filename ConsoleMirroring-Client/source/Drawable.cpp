//
// Created by dareb on 8/8/2020.
//

#include "Drawable.h"
#include "Draw.h"
#include <vector.h>

Renderables renderables;

#define OSReport ((void (*)(const char* text, ...)) 0x801d8600)

void Point::draw() {
    draw2DPoint(this->color, this->x, this->y, this->thickness);
}

void Line::draw() {
    draw2DLine(color, x1, y1, x2, y2, thickness);
}

void RectOutline::draw() {
    draw2DRectOutline(color, top, bottom, left, right, thickness);
}

void Rect::draw() {
    // OSReport("addr: %08x\n", this);
    OSReport("rect draw: (col, t, b, l, r): %08x, %.3f, %.3f, %.3f, %.3f\n", color.value, top, bottom, left, right);
    draw2DRectangle(color, top, bottom, left, right);
}

void drawItem(Drawable * item) {
    setupDrawPrimitives();
    if (item->delay == 0) {
        if (item->is2D) { start2DDraw(); }
        else { startNormalDraw(); }
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