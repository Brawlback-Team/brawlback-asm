#include "OSThread.h"

//include OSMutex here so mutex type is defined, but avoids circular dependancies
#include "OSMutex.h"
#include "Memory.h"


OSThread* getCurrentThread() {
	return OSGetCurrentThread();
}

int disableScheduler() {
	return OSDisableScheduler();
}

int enableScheduler() {
	return OSEnableScheduler();
}

void OSThreadQueue::init() {
	OSInitThreadQueue(this);
}

void OSThreadQueue::sleep() {
	OSSleepThread(this);
}

void OSThreadQueue::wake() {
	OSWakeupThread(this);
}

OSThread::OSThread(void* (*func)(void*), void* param, u32 stackSize, OSPriority priority, bool isDetached) {
	void* stack = malloc(stackSize);
	stack = (char*)stack + stackSize;
	OSCreateThread(this, func, param, stack, stackSize, priority, isDetached);
}

OSThread::OSThread(void* (*func)(), u32 stackSize, OSPriority priority, bool isDetached) {
	void* stack = malloc(stackSize);
	stack = (char*)stack + stackSize;
	OSCreateThread(this, (void* (*)(void*))func, nullptr, stack, stackSize, priority, isDetached);
}

bool OSThread::isSuspended() {
	return OSIsThreadSuspended(this);
}

bool OSThread::isTerminated() {
	return OSIsThreadTerminated(this);
}

void OSThread::cancel() {
	OSCancelThread(this);
}

bool OSThread::join(void** result) {
	return OSJoinThread(this, result);
}

s32 OSThread::resume() {
	return OSResumeThread(this);
}

s32 OSThread::suspend() {
	return OSSuspendThread(this);
}

void OSThread::sleepTicks(OSTime ticks) {
	OSSleepTicks(ticks);
}

void OSThread::yield() {
	OSYieldThread();
}