#pragma once

#include "stdtypes.h"
#include "OSTime.h"
#include "OSContext.h"

#define OS_THREAD_SPECIFIC_MAX  2

//0 highest, 31 lowest
typedef s32 OSPriority;

struct OSThread;
struct OSThreadQueue;
struct OSMutex;

//global functions
#define OSGetCurrentThread ((OSThread* (*)()) 0x801e0714)
#define OSDisableScheduler ((int (*)()) 0x801e0760)
#define OSEnableScheduler ((int (*)()) 0x801e079c)

//ThreadQueue functions
#define OSSleepThread ((void (*)(OSThreadQueue* threadQueue)) 0x801e1790)
#define OSInitThreadQueue ((void (*)(OSThreadQueue* threadQueue)) 0x801e0704)
#define OSWakeupThread ((void (*)(OSThreadQueue* threadQueue)) 0x801e187c)

//Thread functions
#define OSCreateThread ((bool (*)(OSThread* thread, void* (*func)(void*), void* param, \
	void* stack, u32 stackSize, OSPriority priority, bool isDetached)) 0x801e0cfc)
#define OSIsThreadSuspended ((bool (*)(OSThread* thread)) 0x801e0720)
#define OSIsThreadTerminated ((bool (*)(OSThread* thread)) 0x801e0734)
#define OSCancelThread ((void (*)(OSThread* thread)) 0x801e104c)
#define OSJoinThread ((bool (*)(OSThread* thread, void** val)) 0x801e1224)
#define OSResumeThread ((s32 (*)(OSThread* thread)) 0x801e1364)
#define OSSuspendThread ((s32 (*)(OSThread* thread)) 0x801e15fc)
#define OSYieldThread ((void (*)()) 0x801e0cc0)
#define OSSleepTicks ((void (*)(OSTime ticks)) 0x801e1a80)

struct OSThreadQueue {
	void init();
	//sleeps the current thread and places it in the queue
	void sleep();
	//wakes all threads in queue
	void wake();

	OSThread* head;
	OSThread* tail;
};

struct OSThreadLink {
	OSThread* next;
	OSThread* prev;
};

struct OSMutexQueue {
	OSMutex* head;
	OSMutex* tail;
};

struct OSMutexLink {
	OSMutex* next;
	OSMutex* prev;
};

enum class OS_THREAD_STATE: u16{
    OS_THREAD_STATE_READY = 1,
    OS_THREAD_STATE_RUNNING = 2,
    OS_THREAD_STATE_WAITING = 4,
    OS_THREAD_STATE_MORIBUND = 8
};


///BE VERY CAREFUL WITH THESE!!!
//Must be global or dynamically allocated
//It will cause problems if it goes out of scope
//Should not be constructed globally or in a startup function
//The function given will be erased if it is only used during initialization
struct OSThread {
    OSThread() = default;
	OSThread(void* (*func)(void*), void* param, u32 stackSize, OSPriority priority, bool isDetached = false);
	OSThread(void* (*func)(), u32 stackSize, OSPriority priority, bool isDetached = false);

	bool isSuspended();
	bool isTerminated();
	void cancel();
	//The address of the fn_result of the joined thread is written at the
	//address pointed to by fn_result
	bool join(void** result = nullptr);
	//The suspend counter is decremented.
	//If the counter is 0 the thread will be schedualed
	s32 resume();
	//increments suspend counter, making the thread unable to be schedualed
	s32 suspend();
	//sleeps the current thread for a time
	static void sleepTicks(OSTime ticks);
	//yields current running thread
	static void yield();

	OSContext context;

    OS_THREAD_STATE state;
	u16 attr;       // OS_THREAD_ATTR_*
	s32 suspendCounter;    // suspended if the count is greater than zero
	OSPriority effective;
	OSPriority base;
	void* exitValue;

	//0x2DC
	OSThreadQueue* queue;      // queue thread is on
	OSThreadLink link;       // queue link

	OSThreadQueue queueJoin;  // list of threads waiting for termination (join)

	OSMutex* mutex;      // mutex trying to lock
	OSMutexQueue queueMutex; // list of mutexes owned

	OSThreadLink linkActive; // link of all threads for debugging

	u8* stackBase;  // the thread's designated stack (high address)
	u32* stackEnd;   // last word of stack (low address)

	s32 error;
	//0x310
	void* specific[OS_THREAD_SPECIFIC_MAX];   // thread specific data
}__attribute__((packed));

static_assert(offsetof(OSThread, specific) == 0x310, "OSThread is misaligned");
static_assert(sizeof(OSThread) == 0x318, "OSThread is wrong size");


#define DEFAULT_CONTEXT ((OSContext**) 0x800000d4)
//I don't know what this is.  It's usually the default thread, but it can change
#define DEFAULT_THREAD ((OSThread**) 0x800000d8)
//Link to all active threads, use linkActive member to continue
//Last thread's next is null, first thread's prev is null
#define ACTIVE_THREAD_QUEUE ((OSThreadQueue*) 0x800000dc)
//Current running thread, is null if waiting (Like when stalling in schedualer)
#define CURRENT_THREAD ((OSThread**) 0x800000E4)

//Thread attributes
#define OS_THREAD_ATTR_DETACH 0x0001u //is currently detatched

//Placed at the top of the stack when a thread is created.
//Can be used to identify stack overflows
#define OS_THREAD_STACK_MAGIC 0xDEADBABE