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
	char _spacer[6];
	//0x6
	PADButtons buttons;
	char _spacer2[0x30 - 6 - sizeof(PADButtons)];
	//0x30
	s8 stickX;
	s8 stickY;
	s8 cStickX;
	s8 cStickY;
	s8 LTrigger;
	s8 RTrigger;

	char _spacer3[0x38 - 0x30 - 6];
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
      LTrigger = 0;
      RTrigger = 0;
      isNotConnected = 0;
      type = GAMECUBE;
  }
}; //__attribute__((packed, aligned(4)));
#pragma pack(pop)
