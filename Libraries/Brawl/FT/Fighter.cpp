#include "Fighter.h"


// Fighter* Fighter::ct(entryID id, int a, int b) {
// 	//TODO: make module accesser
// 	//ct_Fighter(this, id, a, b, )
// }

// IpHuman* Fighter::getInput() {
// 	return getInput_Fighter(this);
// }

ftOwner* Fighter::getOwner() {
	return getOwner_Fighter(this);
}

#define OSReport ((void (*)(const char* text, ...)) 0x801d8600)
ftCancelModule* Fighter::getCancelModule() {
	return ((ftCancelModule* (*)(void* ft)) this->vtable18->cancelModuleFn)(this);
}