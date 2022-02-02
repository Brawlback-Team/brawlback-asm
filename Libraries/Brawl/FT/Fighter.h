#ifndef PROJECTMCODES_FIGHTER_H
#define PROJECTMCODES_FIGHTER_H

#include "Brawl/SO/StageObject.h"
#include "Brawl/SO/soModuleAccessor.h"
#include "Brawl/FT/ftCancelModule.h"
#include "Brawl/FT/ftOwner.h"

//A unique id given when loading the character
typedef int entryID;

struct Fighter_vtable18 {
	char _spacer[0x150];
	void** cancelModuleFn;
};

struct ftOwner;
struct Fighter : public StageObject {
	
	ftCancelModule* getCancelModule();
	
	//can't use constructor because Brawl constructor already calls base class constructor
	//so it would be called multiple times
	//Fighter* ct(entryID id, int, int);
	//IpHuman* getInput();
	ftOwner* getOwner();
    int getFtKind();

	char _spacer_vt18[0x100 - sizeof(StageObject)];
	Fighter_vtable18* vtable18;

	char _spacer_ft[0x110 - 0x100 - 4];

    int getFtKind();
};

#define _getFtKind_Fighter ((int (*)(Fighter * This)) 0x8076b00c)

//first int is fighter id or somethign
//second int seems to not be used (immediatly overwritten)
//#define ct_Fighter ((Fighter* (*)(Fighter* This, entryID, int, int, soModuleAccesser*)) 0x80830200)
//#define getInput_Fighter ((IpHuman* (*)(Fighter* This)) 0x8083ae38)
#define getOwner_Fighter ((ftOwner * const (*)(Fighter * This)) 0x8083ae24)

#endif
