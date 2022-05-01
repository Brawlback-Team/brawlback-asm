//
// Created by johno on 6/6/2020.
//

#include "stddef.h"

#ifndef CSSCUSTOMCONTROLS_C_STUFF_H
#define CSSCUSTOMCONTROLS_C_STUFF_H

#define sprintf ((int (*)(char* buffer, const char* format, ...)) 0x803f89fc)
#define strcpy ((char* (*)(char* destination, const char* source)) 0x803fa280)

#endif //CSSCUSTOMCONTROLS_C_STUFF_H
