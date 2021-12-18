#pragma once

#include "stddef.h"

struct MEMLink{
	void* prevObject;
	void* nextObject;
};

struct MEMList {
	void* headObject;
	void* tailObject;
	u16 numObjects;
	//The offset of the linking attributes of the struct the list will contain
	u16 offset;
};

#define MEM_INIT_LIST(list, structName, linkName) \
           MEMInitList(list, offsetof(structName, linkName))

/*void MEMInitList(MEMList* list, u16 offset);
void MEMAppendListObject(MEMList* list, void* object);
void MEMPrependListObject(MEMList* list, void* object);
void MEMInsertListObject(MEMList* list, void* target, void* object);
void MEMRemoveListObject(MEMList* list, void* object);
void* MEMGetNextListObject(MEMList* list, void* object);
void* MEMGetPrevListObject(MEMList* list, void* object);
void* MEMGetNthListObject(MEMList* list, u16 index);*/