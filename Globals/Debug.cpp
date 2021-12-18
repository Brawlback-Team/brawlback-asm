//
// Created by johno on 9/23/2020.
//

#include "Debug.h"


void ASSERTION_ERROR(const char* condition, const char* function, const char* file, int lineNum) {
    //Put breakpoint on function to catch assertion errors
    //Use arguments to filter
    OSReport("Assertion Error in function %s, at %s::%d\n", function, file, lineNum);
    OSReport("Condition: %s\n", condition);
}