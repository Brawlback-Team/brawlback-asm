
// to print text to the screen
#include <Graphics/TextPrinter.h>
// controller input stuff
#include <Wii/PAD/PADStatus.h>
#include "Assembly.h"
#include "Memory.h"
// responsible for sound effects
#include "Brawl/sndSystem.h"

#include "Graphics/Drawable.h"
#include "./menu.h"

// setup global variables
Menu* myMenu;
// makes menu feel smooth
signed char timer = 5;
signed char cmdDelay = 50;
bool instantResponse = true;
// show menu / pause game execution
bool paused = false;
bool visible = false;

// responsible for pausing exeuction of the game itself while the code menu is up
INJECTION("TOGGLE_PAUSE", 0x8002E5B0, R"(
    mr r3, r25
    bl checkMenuPaused 
    lwz r3, 0 (r25)
)");

extern "C" void checkMenuPaused(char* gfTaskSchedulerInst) {
    // OSReport("Visible: %s, paused: %s\n", visible ? "T" : "F", paused ? "T" : "F");
    if (paused && visible) { gfTaskSchedulerInst[0xB] |= 0x8; }
    else { gfTaskSchedulerInst[0xB] &= ~0x8; }
}

// calls our function
INJECTION("frameUpdate", 0x8001792c, R"(
    bl updateOnFrame
    addi r3, r30, 280
)");

struct RectProperties {
    bool visible = false;
    float xPos = 100;
    float yPos = 100;
    float width = 100;
    float height = 50;
    int red = 255;
    int green = 255;
    int blue = 0;
    int alpha = 255;
} rectProps;
extern "C" void updateOnFrame() {
  // initializes the menu
  if (myMenu == nullptr) {
    myMenu = new Menu();
    Page* mainPage = new Page(myMenu);
    mainPage->setTitle("main");

    Page* rectPage = new Page(myMenu);
    rectPage->setTitle("rectangle options");

    rectPage->addOption(new BoolOption("visible?", rectProps.visible));
    rectPage->addOption(new FloatOption("x position", rectProps.xPos));
    rectPage->addOption(new FloatOption("y position", rectProps.yPos));
    rectPage->addOption(new FloatOption("width", rectProps.width));
    rectPage->addOption(new FloatOption("height", rectProps.height));
    rectPage->addOption(new IntOption("red", rectProps.red, 0, 255));
    rectPage->addOption(new IntOption("green", rectProps.green, 0, 255));
    rectPage->addOption(new IntOption("blue", rectProps.blue, 0, 255));
    rectPage->addOption(new IntOption("opacity", rectProps.alpha, 0, 255));

    mainPage->addOption(new PageLink("rectangle options", rectPage));

    myMenu->nextPage(mainPage);
  }

  char buffer[200] = {};
  Message * message = &printer.message;
  message->fontScaleX = 0.1;
  message->fontScaleY = 0.1;
  message->zPos = 0;

  PADButtons btn;
  btn.bits = PREVIOUS_PADS[0].button.bits | PREVIOUS_PADS[1].button.bits | PREVIOUS_PADS[2].button.bits | PREVIOUS_PADS[3].button.bits;
  paused = myMenu->paused;
  visible = myMenu->visible;
  bool selected = myMenu->selected;
  if (btn.L && btn.R && btn.UpDPad) {
      if (instantResponse) {
          myMenu->toggle();
          instantResponse = false;
          SOUND_SYSTEM->playSE(34);
      }
  } else if (btn.L && btn.R && btn.DownDPad) {
      if (instantResponse) {
          if (selected) myMenu->deselect();
          myMenu->visible = false;
          myMenu->paused = false;
          instantResponse = false;
      }
  } else if (visible) {
      if (btn.B && myMenu->path.size() <= 1 && !selected) {
          if (instantResponse) {
              myMenu->toggle();
              instantResponse = false;
              SOUND_SYSTEM->playSE(34);
          }
      } else if (btn.A && paused) {
          if (instantResponse) {
              myMenu->select();
              instantResponse = false;
              SOUND_SYSTEM->playSE(1);
          }
      } else if (btn.B && paused) {
          if (instantResponse) {
              myMenu->deselect();
              instantResponse = false;
              SOUND_SYSTEM->playSE(2);
          }
      } else if (btn.DownDPad) {
          timer -= 10;
          if (timer < 0 || instantResponse) {
              myMenu->down();
              instantResponse = false;
              SOUND_SYSTEM->playSE(0);
          }
      } else if (btn.UpDPad && btn.L && selected && !paused) {
          if (instantResponse) {
              myMenu->modify(-1);
              myMenu->deselect();
              instantResponse = false;
              SOUND_SYSTEM->playSE(34);
          }
      } else if (btn.UpDPad) {
          timer -= 10;
          if (timer < 0 || instantResponse) {
              myMenu->up();
              instantResponse = false;
              SOUND_SYSTEM->playSE(0);
          }
      } else if (btn.LeftDPad) {
          timer -= 10;
          if (timer < 0 || instantResponse) {
              myMenu->modify(btn.Y ? -10 : -(btn.X ? 0.1 : 1));
              instantResponse = false;
              SOUND_SYSTEM->playSE(37);
          }
      } else if (btn.RightDPad) {
          timer -= 10;
          if (timer < 0 || instantResponse) {
              myMenu->modify(btn.Y ? 10 : (btn.X ? 0.1 : 1));
              instantResponse = false;
              SOUND_SYSTEM->playSE(37);
          }
      } else {
          instantResponse = true;
          timer = 100;
          cmdDelay = 0;
      }
  } else if (paused && btn.B) {
      paused = false;
  } else {
      instantResponse = true;
      timer = 100;
      cmdDelay = 0;
  }

  if (rectProps.visible) {
    GXColor selectedColor = GXColor();
    selectedColor.red = rectProps.red;
    selectedColor.green = rectProps.green;
    selectedColor.blue = rectProps.blue;
    selectedColor.alpha = rectProps.alpha;
    renderables.items.frame.push(new Rect(
      rectProps.xPos,
      rectProps.yPos,
      rectProps.width,
      rectProps.height,
      true,
      selectedColor
    ));
  }

  
  // renders everything in the "renderables" vector
  renderables.renderAll();
  // if the menu is visible then do this stuff
  if (visible) {
      // renders the menu itself
      printer.setup();
      printer.start2D();

      message->fontScaleY = RENDER_SCALE_Y;
      message->fontScaleX = RENDER_SCALE_X;
      printer.lineHeight = 20 * message->fontScaleY;
      message->xPos = LEFT_PADDING;
      message->yPos = TOP_PADDING;
      myMenu->render(&printer, buffer);
  }

  startNormalDraw();
}