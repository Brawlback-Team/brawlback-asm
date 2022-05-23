#ifndef CSSCUSTOMCONTROLS_GFPADSYSTEM_H
#define CSSCUSTOMCONTROLS_GFPADSYSTEM_H

#include "gfPadStatus.h"

struct gfPadSystem {
	char _spacer[0x40];
	//0x40
	gfPadGamecube pads[4];
	// there's more data in this struct... but padding on the ends isn't necessary (i think it's actually size 0xb6c)
};

//global, statically allocated gfPadSystem object
#define PAD_SYSTEM ((gfPadSystem* const) 0x805bacc0)

#endif