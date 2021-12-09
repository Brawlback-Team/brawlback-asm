#pragma once

#include "OSThread.h"

struct OSThread;
struct OSThreadQueue;
struct OSMutexLink;

struct OSMutex {
	void init();
	void lock();
	void unlock();
	bool tryLock();

	OSThreadQueue queue;
	OSThread* owner;
	s32 count;
	OSMutexLink link;   // For OSThread.queueMutex
};


/*void OSInitMutex(OSMutex* mutex);
void OSLockMutex(OSMutex* mutex);
void OSUnlockMutex(OSMutex* mutex);
BOOL OSTryLockMutex(OSMutex* mutex);*/


struct OSCond {
	void OSInitCond(OSCond* cond);
	void OSWaitCond(OSCond* cond, OSMutex* mutex);
	void OSSignalCond(OSCond* cond);

	OSThreadQueue queue;
};
/*void OSInitCond(OSCond* cond);
void OSWaitCond(OSCond* cond, OSMutex* mutex);
void OSSignalCond(OSCond* cond);*/