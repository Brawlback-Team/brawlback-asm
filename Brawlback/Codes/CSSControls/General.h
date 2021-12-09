//
// Created by johno on 6/25/2020.
//

#ifndef CSSCUSTOMCONTROLS_GENERAL_H
#define CSSCUSTOMCONTROLS_GENERAL_H

template <class T> constexpr const T& max(const T& a, const T& b);
template <class T> constexpr const T& min(const T& a, const T& b);
template <class T> constexpr const T& clamp(const T& value, const T& max, const T& min);


template <class T>
constexpr const T& max(const T& a, const T& b) {
    return a >= b ? a : b;
}


template <class T>
constexpr const T& min(const T& a, const T& b) {
    return a <= b ? a : b;
}


template <class T>
constexpr const T& clamp(const T& value, const T& max, const T& min) {
    if(value > max) {
        return max;
    }
    if(value < min) {
        return min;
    }
    return value;
}

#endif //CSSCUSTOMCONTROLS_GENERAL_H
