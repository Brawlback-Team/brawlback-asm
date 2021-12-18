#ifndef CSSCUSTOMCONTROLS_GFPADSYSTEM_H
#define CSSCUSTOMCONTROLS_GFPADSYSTEM_H

#include "gfPadStatus.h"

struct gfPadSystem {
	char _spacer[0x40];
	//0x40
	gfPadGamecube pads[4];

};

//global, statically allocated gfPadSystem object
#define PAD_SYSTEM ((gfPadSystem* const) 0x805bacc0)

#endif