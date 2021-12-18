//
// Created by johno on 9/23/2020.
//

#ifndef PROJECTMCODES_DEBUG_H
#define PROJECTMCODES_DEBUG_H

#include "Wii/OS/OSError.h"

void ASSERTION_ERROR(const char* condition, const char* function, const char* file, int lineNum);


//should put new line at end of message
#define ASSERT_MESSAGE(condition, message, ...) \
    if(!(condition)) {                    \
        ASSERTION_ERROR(#condition, __func__, __FILE__, __LINE__); \
        OSReport(message, __VA_ARGS__); \
    }


#define ASSERT(condition) \
    if(!(condition)) {                    \
        ASSERTION_ERROR(#condition, __func__, __FILE__, __LINE__); \
    }


#endif //PROJECTMCODES_DEBUG_H
