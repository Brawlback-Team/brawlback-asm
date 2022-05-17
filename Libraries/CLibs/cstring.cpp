//
// Created by johno on 7/2/2020.
//

#include "cstring.h"


char* strcat(char* destination, const char* source) {
    return _strcat(destination, source);
}


char* strcpy(char* destination, const char* source) {
    return _strcpy(destination, source);
}

char* strcpy(char* destination, const char* source, int length) {
    return _strcpylen(destination, source, length);
}

int strcmp(const char* str1, const char* str2) {
    return _strcmp(str1, str2);
}

char* strstr(const char* buffer, const char* target) {
    return _strstr(buffer, target);
}

int atoi(const char* buffer) {
    return _atoi(buffer);
}

float atof(const char* buffer) {
    return _atof(buffer);
}

char* itoa(int num, char* buffer, int base)
{
    int i = 0;
    bool isNegative = false;

    /* Handle 0 explicitly, otherwise empty string is printed for 0 */
    if (num == 0)
    {
        buffer[i++] = '0';
        buffer[i] = '\0';
        return buffer;
    }

    // In standard itoa(), negative numbers are handled only with
    // base 10. Otherwise numbers are considered unsigned.
    if (num < 0 && base == 10)
    {
        isNegative = true;
        num = -num;
    }

    // Process individual digits
    while (num != 0)
    {
        int rem = num % base;
        buffer[i++] = (rem > 9)? (rem-10) + 'a' : rem + '0';
        num = num/base;
    }

    // If number is negative, append '-'
    if (isNegative)
    {
        buffer[i++] = '-';
    }

    buffer[i] = '\0'; // Append string terminator

    // Reverse the string
    int start = 0;
    int end = i - 1;
    while (start < end)
    {
        char t = *(buffer+start);
        *(buffer+start) = *(buffer+end);
        *(buffer+end) = t;
        start++;
        end--;
    }

    return buffer;
}