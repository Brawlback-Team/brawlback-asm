#pragma once

#include "stdtypes.h"

typedef s64         OSTime;
typedef u32         OSTick;

#ifndef OS_CORE_CLOCK
#define OS_CORE_CLOCK       729000000u
#endif
#ifndef OS_BUS_CLOCK
#define OS_BUS_CLOCK        243000000u
#endif
#ifndef OS_TIMER_CLOCK
#define OS_TIMER_CLOCK      (OS_BUS_CLOCK/4)
#endif

#define OSTicksToCycles( ticks )        (((ticks) * ((OS_CORE_CLOCK * 2) / OS_TIMER_CLOCK)) / 2)
#define OSTicksToSeconds( ticks )       ((ticks) / OS_TIMER_CLOCK)
#define OSTicksToMilliseconds( ticks )  ((ticks) / (OS_TIMER_CLOCK / 1000))
#define OSTicksToMicroseconds( ticks )  (((ticks) * 8) / (OS_TIMER_CLOCK / 125000))
#define OSTicksToNanoseconds( ticks )   (((ticks) * 8000) / (OS_TIMER_CLOCK / 125000))
#define OSSecondsToTicks( sec )         ((sec)  * OS_TIMER_CLOCK)
#define OSMillisecondsToTicks( msec )   ((msec) * (OS_TIMER_CLOCK / 1000))
#define OSMicrosecondsToTicks( usec )   (((usec) * (OS_TIMER_CLOCK / 125000)) / 8)
#define OSNanosecondsToTicks( nsec )    (((nsec) * (OS_TIMER_CLOCK / 125000)) / 8000)
#define OSFramesToTicks(frames)         ((frames) * OSSecondsToTicks(1.0) / 60)

#define OSDiffTick(tick1, tick0)        ((s32) (tick1) - (s32) (tick0))

#define _OSGetTick ((OSTick (*)()) 0x801e1b4c)
#define _OSGetTime ((OSTime (*)()) 0x801e1b34)

#define _OSTicksToCalendarTime ((void (*)(OSTime ticks, OSCalendarTime* td)) 0x801e1d80)

//gets the lower 32 bits of the TB register
OSTick getTick();
//gets all 64 bits of the TB register
OSTime getTime();

struct OSCalendarTime {
	int sec;    // seconds after the minute [0, 61]
	int min;    // minutes after the hour [0, 59]
	int hour;   // hours since midnight [0, 23]
	int mday;   // day of the month [1, 31]
	int mon;    // month since January [0, 11]
	int year;   // years since 0000
	int wday;   // days since Sunday [0, 6]
	int yday;   // days since January 1 [0, 365]

	int msec;   // milliseconds after the second [0,999]
	int usec;   // microseconds after the millisecond [0,999]
};

OSTime OSCalendarTimeToTicks(OSCalendarTime* td);
OSCalendarTime OSTimeToCalendarTime(OSTime time);

struct OSStopwatch
{
	const char* name;       // name of this stopwatch
	u32         hits;       // number of times turned on and off
	OSTime      total;      // total time running
	OSTime      min;        // smallest time measured
	OSTime      max;        // longest time measured

	OSTime      last;       // time at which this sw was last started
	bool        running;    // TRUE if sw is running
	u32         _padding;
};
void    OSInitStopwatch(OSStopwatch* sw, const char* name);
void    OSStartStopwatch(OSStopwatch* sw);
void    OSStopStopwatch(OSStopwatch* sw);
OSTime  OSCheckStopwatch(OSStopwatch* sw);
void    OSResetStopwatch(OSStopwatch* sw);
void    OSDumpStopwatch(OSStopwatch* sw);