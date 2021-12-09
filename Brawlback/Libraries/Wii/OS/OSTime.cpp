#include "OSTime.h"

OSTick getTick() {
	return _OSGetTick();
}

OSTime getTime() {
	return _OSGetTime();
}

OSCalendarTime OSTimeToCalendarTime(OSTime time) {
    OSCalendarTime calendarTime;
    _OSTicksToCalendarTime(time, &calendarTime);
    return calendarTime;
}