#ifndef CSSCUSTOMCONTROLS_GFPADSYSTEM_H
#define CSSCUSTOMCONTROLS_GFPADSYSTEM_H

#include "gfPadStatus.h"

struct gfPadSystem {
	char _spacer[0x40];
	//0x40
	gfPadGamecube pads[4]; 
	// there's more data in this struct... but padding on the ends isn't necessary (i think it's actually size 0xb6c)

	char _spacer2[0x104];
	gfPadGamecube sysPads[4]; 
	//0x0244 seems like where inputmask starts (during SystemPadStatus checks)
	//0x0444 seems like where inputmask starts (during GamePadStatus checks)
};


// 801101e8: address where pause inputs of port (r4) are checked to start pausing the game

// Next Steps: Make sure that newPressedButtons are passed over the network and received on each client
// You will know this works when Pause triggers on both clients.

// Think about moving where the input is being sent to dolphin to updateLowGC instead since it seems like the first call that occurs
// 80028a5c On this address the game writes pad memory values to system pad (0x0244) (update.gfadStatus)
// 8002967c On this address the game writes pad memory values to game pad (0x40) (updateLowGC.gfPadSystem)

// game pad status starts at 805b4e70
// sys pad status starts at 805b4d68 805b4e18

// 0x805BAD00 first address of game pad status

// Findings are that on BeginFrame not all inputs are on memory only _buttons, and buttons. 
// So I need to investigate how really does bits are set and where exactly.

//global, statically allocated gfPadSystem object
#define PAD_SYSTEM ((gfPadSystem* const) 0x805bacc0) 

#endif

// system pads addresses
// p1 = 805baf04
// p2 = 805baf44
// p3 = 805baf84
// p4 = 805bafc4
// p5 = 805bb004
// p6 = 805bb044
// p7 = 805bb084
// p9 = 805bb0c4