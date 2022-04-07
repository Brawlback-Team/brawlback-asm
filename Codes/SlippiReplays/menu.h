#ifndef PROJECTMCODES_MENU_H
#define PROJECTMCODES_MENU_H

#include "Containers/vector.h"
#include <Graphics/TextPrinter.h>
#include <cstdio>

#define strcat ((int (*)(char* destination, const char* source)) 0x803fa384)
// #define sprintf ((int (*)(char* buffer, const char* format, ...)) 0x803f89fc)

#define RENDER_X_SPACING 80
#define RENDER_SCALE_X 0.5;
#define RENDER_SCALE_Y 0.5;
#define TOP_PADDING 69
#define LEFT_PADDING 20

// this is a completely arbitrary number I HIGHLY doubt anyone will need
// ever so it'll act as a default value
#define NUMERIC_DEFAULT -983746279

struct Menu;
struct Page;
struct SubpageOption;

struct OptionType {
  virtual void select() = 0;
  virtual void deselect() = 0;
  virtual void modify(float amount) = 0;
  virtual void render(TextPrinter* printer, char* buffer) = 0;
  virtual void down() = 0;
  virtual void up() = 0;
  virtual void setParentPage(Page* p) = 0;
  virtual ~OptionType() {};
  char name[20];
  Page* parent;
  SubpageOption* subParent = nullptr;
  bool canModify = true;
};

struct StandardOption : public OptionType {
  void up() { modify(1); }
  void down() { modify(-1); }
  void setParentPage(Page* p) { this->parent = p; }
  virtual ~StandardOption() {}
};

struct Page {
  Page(Menu* myMenu);
  void addOption(OptionType* option);
  void setTitle(char* newTitle);
  virtual void select();
  virtual void deselect();
  void up();
  void down();
  void modify(float amount);
  void render(TextPrinter* printer, char* buffer);
  virtual ~Page() {}

  char title[20];
  vector<OptionType*> options;
  char currentOption = 0;
  bool isSelected = false;
  Menu* menu;
};

struct Menu {
  void nextPage(Page* p);
  Page* getCurrentPage();
  void select();
  void deselect();
  void up();
  void down();
  void modify(float amount);
  void render(TextPrinter* printer, char* buffer);
  void unpause();
  void toggle();
  
  bool visible = false;
  bool paused = false;
  bool selected = false;
  vector<Page*> pages;
  vector<Page*> path;
};

struct PageLink : public StandardOption {
  Page* target;
  PageLink(char* name, Page* target) {
    this->target = target;
    sprintf(this->name, "%.19s", name);
  }
  void modify(float);
  void select();
  void deselect();
  void render(TextPrinter* printer, char* buffer);
};

class IntOption : public StandardOption {
public:
  IntOption(char* name, int& value) : value(value) {
    sprintf(this->name, "%.19s", name);
    this->value = value;
  }
  IntOption(char* name, int& value, int min, int max) : value(value) {
    sprintf(this->name, "%.19s", name);
    this->value = value;
    this->min = min;
    this->max = max;
  }
  IntOption(char* name, int& value, bool canModify) : value(value) {
    sprintf(this->name, "%.19s", name);
    this->value = value;
    this->canModify = canModify;
  }
  IntOption(char* name, int& value, int min, int max, bool canModify) : value(value) {
    sprintf(this->name, "%.19s", name);
    this->value = value;
    this->min = min;
    this->max = max;
    this->canModify = canModify;
  }
  void modify(float amount);
  void select();
  void deselect();
  void render(TextPrinter* printer, char* buffer);

private:
  int& value;
  int max = NUMERIC_DEFAULT;
  int min = NUMERIC_DEFAULT;
};

class FloatOption : public StandardOption {
public:
  FloatOption(char* name, float& value) : value(value) {
    sprintf(this->name, "%.19s", name);
    this->value = value;
  }
  FloatOption(char* name, float& value, float min, float max) : value(value) {
    sprintf(this->name, "%.19s", name);
    this->value = value;
    this->min = min;
    this->max = max;
  }
  FloatOption(char* name, float& value, bool canModify) : value(value) {
    sprintf(this->name, "%.19s", name);
    this->value = value;
    this->canModify = canModify;
  }
  FloatOption(char* name, float& value, float min, float max, bool canModify) : value(value) {
    sprintf(this->name, "%.19s", name);
    this->value = value;
    this->min = min;
    this->max = max;
    this->canModify = canModify;
  }
  void modify(float amount);
  void select();
  void deselect();
  void render(TextPrinter* printer, char* buffer);

  ~FloatOption() {}

private:
  float& value;
  float max = NUMERIC_DEFAULT;
  float min = NUMERIC_DEFAULT;
};

class BoolOption : public StandardOption { 
public:
  BoolOption(char* name, bool& value) : value(value) {
    sprintf(this->name, "%.19s", name);
  }
  BoolOption(char* name, bool& value, bool canModify) : value(value) {
    sprintf(this->name, "%.19s", name);
    this->canModify = canModify;
  }

  void modify(float amount);
  void select();
  void deselect();
  void render(TextPrinter* printer, char* buffer);

private:
  bool& value;
};

enum HexSize {
  CHAR = 1,
  SHORT = 2,
  INT = 3
};

class HexObserver : public StandardOption {
public:
  HexObserver(char* name, u32& value, HexSize size) : value(value) {
    sprintf(this->name, "%.19s", name);
    this->canModify = false;
    this->size = size;
  }
  void modify(float amount);
  void select();
  void deselect();
  void render(TextPrinter* printer, char* buffer);

private:
  u32& value;
  HexSize size;
};

class ControlOption : public StandardOption { 
public:
  ControlOption(char* name, bool& value) : value(value) {
    sprintf(this->name, "%.19s", name);
  }

  void modify(float amount);
  void select();
  void deselect();
  void render(TextPrinter* printer, char* buffer);

private:
  bool& value;
};

class StringOption : public StandardOption { 
public:
  StringOption(char* name, char* value) : value(value) {
    sprintf(this->name, "%.19s", name);
    this->canModify = false;
  }

  void modify(float amount);
  void select();
  void deselect();
  void render(TextPrinter* printer, char* buffer);

private:
  char* value;
};

class NamedIndexOption : public StandardOption {
public: 
  NamedIndexOption(char* name, const char** nameArray, int& index, int arrayLength) : index(index) {
    sprintf(this->name, "%.19s", name);

    this->canModify = false;
    this->arrayLength = arrayLength;
    this->nameArray = nameArray;
  }

  void modify(float amount);
  void select();
  void deselect();
  void render(TextPrinter* printer, char* buffer);

private:
  const char** nameArray;
  int& index;
  int arrayLength;
};

class SubpageOption : public OptionType {
public:
  SubpageOption(char* name) {
    sprintf(this->name, "%.19s", name);
  }
  SubpageOption(char* name, int height, int depth) {
    sprintf(this->name, "%.19s", name);
    this->height = height;
    this->depth = depth;
  }
  SubpageOption(char* name, bool collapsible) {
    sprintf(this->name, "%.19s", name);
    this->collapsible = collapsible;
  }
  SubpageOption(char* name, int height, int depth, bool collapsible) {
    sprintf(this->name, "%.19s", name);
    this->height = height;
    this->depth = depth;
    this->collapsible = collapsible;
  }

  void modify(float amount);
  void select();
  void deselect();
  void render(TextPrinter* printer, char* buffer);
  void down();
  void up();
  void setParentPage(Page* p);
  
  void addOption(OptionType* option);
  void clearOptions();
  void removeOptions();
  int getOptionCount();

  virtual ~SubpageOption() {
    options.clear();
  }

  vector<OptionType *> options = vector<OptionType *>();
  int& currentOption = this->_index;
  int _index = 0;
  int scrollIdx = 0;
  int height = 10;
  int depth = 1;
  bool isSelected = false;
  bool hasSelection = false;
  bool collapsible = false;
};

class BarOption : public StandardOption {
public:
  BarOption(char* name, float& value, float& max, GXColor color, float width) : value(value), max(max) {
    sprintf(this->name, "%.19s", name);
    this->color = color;
    this->width = width;
    this->canModify = false;
  }

  BarOption(char* name, float& value, float& max, float& min, GXColor color, float width) : value(value), max(max), min(min) {
    sprintf(this->name, "%.19s", name);
    this->color = color;
    this->width = width;
    this->canModify = false;
  }

  void modify(float amount) {}
  void select() {}
  void deselect() {}
  void render(TextPrinter* printer, char* buffer);

private:
  float& max;
  float& min = this->defaultMin;
  float defaultMin = 0;
  float& value;
  float width;
  GXColor color;
};

#endif // PROJECTMCODES_MENU_H