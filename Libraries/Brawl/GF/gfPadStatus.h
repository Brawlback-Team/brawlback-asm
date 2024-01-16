#pragma once

#include "Wii/PAD/PADButtons.h"

enum controllerType {
    GAMECUBE,
    CLASSIC,
    WIIMOTE,
    WIICHUCK
};

//size is 0x40
//technically is gfPadStatus, and is used for all controller types
//Just using gamecube for now
#pragma pack(push, 2)

struct gfPadGamecube {
	PADButtons _buttons;
	PADButtons buttons;
	PADButtons holdButtons;
	PADButtons rapidFireButtons;
	PADButtons releasedButtons;
	PADButtons newPressedButtons;
	// char _spacer2[0x30 - 6 - (sizeof(PADButtons))];
	char _bspacer6[0x17];
	//0x30
	// TODO: calculate new offset
	s8 stickX;
	s8 stickY;
	s8 cStickX;
	s8 cStickY;
	s8 LAnalogue;
	s8 RAnalogue;
	s8 LTrigger;
	s8 RTrigger;
	
	char _spacer3[0x1];
	//0x38
	//0xFF if not connected, else 0
	bool isNotConnected;

    s8 _spacer4[0x3C - 0x38 - 1];

	//0x3C
	controllerType type = GAMECUBE;

    gfPadGamecube() {
      buttons.bits = 0;
      stickX = 0;
      stickY = 0;
      cStickX = 0;
      cStickY = 0;
	  LAnalogue = 0;
	  RAnalogue = 0;
      LTrigger = 0;
      RTrigger = 0;
      isNotConnected = 0;
      type = GAMECUBE;
  }
}; //__attribute__((packed, aligned(4)));
#pragma pack(pop)
static_assert(sizeof(gfPadGamecube) == 0x40, "gfPadGamecube is wrong size");