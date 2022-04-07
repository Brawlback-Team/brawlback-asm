
#ifndef PROJECTMCODES_FUDGEMENU_H
#define PROJECTMCODES_FUDGEMENU_H

#include "menu.h"
#include "Containers/vector.h"
#include "Brawl/FT/Fighter.h"
#include "Brawl/SO/soAnimCmdModuleImpl.h"
#include "Brawl/IT/BaseItem.h"
#include "Wii/PAD/PADStatus.h"
#include "./hitboxHeatmap.h"

//TODO: reimplement more cleanly..
// #define sprintf ((int (*)(char* buffer, const char* format, ...)) 0x803f89fc)

#define OSReport ((void (*)(const char* text, ...)) 0x801d8600)

class ResetFudgeAIOption : public StandardOption {
public:
  ResetFudgeAIOption() {}
  void modify(float _) {};
  void deselect() {};
  void select() {
    fudgeAI.xMin = 500;
    fudgeAI.yMin = 500;
    fudgeAI.xMax = -500;
    fudgeAI.yMax = -500;
  };
  void render(TextPrinter *printer, char *buffer) {
    printer->printLine("reset bounds");
  };
};

class PSAScriptOption : public StandardOption {
public:
  PSAScriptOption(vector<soAnimCmd*>* data, int& currLine) : data(data), currLine(currLine) {}

  void modify(float amount) {
    scrollPoint -= (int) amount;
  }
  void select() { selected = true; }
  void deselect() { selected = false; }
  void render(TextPrinter *printer, char *buffer) {
    int count = data->size();
    // OSReport("Render Size: %d\n", count);
    if (!selected) scrollPoint = currLine - 5;
    if (scrollPoint > (count - 15)) scrollPoint = count - 15; 
    if (scrollPoint < 0) scrollPoint = 0;
    printer->printLine("Script:");
    for (int i = scrollPoint; i < count && i < scrollPoint + 14; i++) {
      // OSReport("MAX SIZE: %d; START: %d; INDEX: %d\n", count, scrollPoint, i);
      if (i == currLine) printer->setTextColor(0x88FF88FF);
      else printer->setTextColor(0xFFAAAADD);

      sprintf(buffer, "%02d: ", (i + 1));
      printer->padToWidth(RENDER_X_SPACING / 5);
      printer->print(buffer);
      sprintf(buffer, "%02x%02x%02x%02x", (*data)[i]->_module, (*data)[i]->code, (*data)[i]->numArguments, (*data)[i]->option);
      printer->padToWidth(RENDER_X_SPACING / 2.5);
      printer->printLine(buffer);
    }
  }

private: 
  vector<soAnimCmd*>* data;
  int& currLine;
  int scrollPoint = 0;
  bool selected = false;
};

struct PSAData {
  int threadIdx = 0;
  int scriptLocation = -1;
  vector<soAnimCmd*>* fullScript;
  unsigned int action = -1;
  unsigned int prevAction = -1;
  unsigned int subaction = -1;
  float frameSpeedModifier = 1;
  float currentFrame = 0;
  float currentEndFrame = -1;
  char currSubactionName[20] = {};
  SubpageOption* subactionSwitcher;
};

struct debugData {
  bool enabled = false;
  bool noclip = false;
  bool noclipInternal = false;
  bool settingPosition = false;
  bool fixPosition = false;
  bool randomizePosition = false;
  bool randOnGround = false;
  bool randomizeDamage = false;
  float randXPos = 0;
  float randYPos = 0;
  float randDmg = 0;

  char airGroundState = 0;
  float xPos = 0;
  float yPos = 0;
  float damage = 0;
  int comboTimer = 0;
  int comboTimerAdjustment = 0;

  float hitstun = 0;
  float maxHitstun = 0;
  float prevFrameHitstun = 0;

  float shieldstun = 0;
  float maxShieldstun = 0;
  float prevFrameShieldstun = 0;

  float shieldValue = 0;
  float maxShieldValue = 50;

  PSAData psaData;
};

struct AIData {
  SubpageOption* trainingScripts;
  int scriptID = 0xFFFF;
  int fighterID = -1;
  int target = -1;
  unsigned int currentScript = -1;
  int frameCount = -1;
  unsigned int md = -1;
  char buttons[25] = {};
  Inputs aiButtons;
  float lstickX = 0;
  float lstickY = 0;

  float snapbackShieldtimer = 0;
};

struct TrajectoryOptions {
  bool active = false;
  int thickness = 2;
  int segments = 5;
  int segmentLength = 10;
};

struct HeatmapOptions {
  bool active = false;
  int lifetime = 0;
  int opacity = 0x80;
  int colorChangeFrame = 25;
  int bubbleLimit = 150;
  vector<HitboxDataFrame*>* data = new vector<HitboxDataFrame*>();
};

struct TrainingData {
  AIData aiData;
  PADStatus playerInputs;
  bool actionableOverlay = false; 
  int actionableSE = -1;
  bool inputDisplay = false;
  bool hasPlayedSE = false;
  TrajectoryOptions trajectoryOpts;
  HeatmapOptions heatmapOpts;
  debugData debug;
};

class AITrainingScriptOption : public StandardOption {
public:
  AITrainingScriptOption(unsigned int id, char* name, char playerNum);
  void modify(float) {}
  void select();
  void deselect() {}
  void render(TextPrinter* printer, char* buffer);

  virtual ~AITrainingScriptOption() {}
private:
  unsigned int id;
  char playerNum;
};

struct AITrainingDefaultVal {
  char index;
  float value;
  ~AITrainingDefaultVal() {}
};

class AITrainingScriptSubmenu : public SubpageOption {
public:
  AITrainingScriptSubmenu(unsigned int id, char* name, char playerNum, char height);

  void select();
  void render(TextPrinter* printer, char* buffer);
  void addDefault(AITrainingDefaultVal* defVal);
  
  virtual ~AITrainingScriptSubmenu() { 
    defaultValues.clear();
  }

private:
  unsigned int id;
  char playerNum;
  vector<AITrainingDefaultVal *> defaultValues = vector<AITrainingDefaultVal *>();
};

struct PlayerPage : public Page {
  PlayerPage(Menu* myMenu, char pNum);
  void select();
  void deselect();
  TrainingData* data;
  char playerNum;
};

struct CurrentItemParams {
  itemIdName id = itemIdName::Banana_Peel;
  short variant = 0;
};

class ItemSelectOption : public StandardOption {
public:
  ItemSelectOption(short id, char* name);
  void modify(float) {}
  void select();
  void deselect() {}
  void render(TextPrinter* printer, char* buffer);

  virtual ~ItemSelectOption() {}
private:
  short id;
};

class ItemSpawnOption : public StandardOption {
public:
  ItemSpawnOption(char* name);
  void modify(float) {}
  void select();
  void deselect() {}
  void render(TextPrinter* printer, char* buffer);

  virtual ~ItemSpawnOption() {}
private:
  unsigned int id;
};

struct ItemPage : public Page {
  ItemPage(Menu* myMenu);  
};

#endif // PROJECTMCODES_FUDGEMENU_H