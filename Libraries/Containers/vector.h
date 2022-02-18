//
// Created by johno on 4/27/2020.
//

#ifndef CSSCUSTOMCONTROLS_VECTOR_H
#define CSSCUSTOMCONTROLS_VECTOR_H

#include "Memory.h"
#include "stddef.h"
#include "CLibs/InitializerList.h"


template<class T>
class vector {
public:
    typedef bool (*unaryPredicate)(const T& v);

    vector();
    explicit vector(size_t size);
    vector(size_t size, const T& val);
    vector(const vector<T>& other);
    vector(std::initializer_list<T> list);
    ~vector<T>();

    T& operator[](u32 index) const;
    bool operator==(const vector<T>& other);
    bool operator!=(const vector<T>& other);
    /*bool operator<(const vector<T>& other);
    bool operator>(const vector<T>& other);
    bool operator<=(const vector<T>& other);
    bool operator>=(const vector<T>& other);*/
    bool push(const T& val);
    void pop_back();
    size_t size() const;
    bool reallocate(size_t newSize);
    //void insert(size_t index, const T& val);
    void erase(size_t index);
    //destroys elements from start, up to (but not including) end
    //void erase(size_t start, size_t end);
    void clear();
    bool empty();

    T* allocate(size_t newSize);

    size_t index(const T& val);
    //size_t findIf(bool (*condition)(const T& x));

    T* getPtr();

private:
    size_t length = 0;
    size_t maxLength = 10;
    T* Array;
};


template<class T>
T& vector<T>::operator[](u32 index) const {
    return Array[index];
}


template<class T>
vector<T>::~vector<T>() {
    delete[] Array;
}


template<class T>
bool vector<T>::operator==(const vector<T>& other) {
    if (size() != other.size()) {
        return false;
    }
    for (int i = 0; i < size(); i++) {
        if (*this[i] != other[i]) {
            return false;
        }
    }
    return true;
}


template<class T>
bool vector<T>::operator!=(const vector<T>& other) {
    return !(*this == other);
}


/*bool vector<T>::operator<(const vector<T>& other);
bool vector<T>::operator>(const vector<T>& other);
bool vector<T>::operator<=(const vector<T>& other);
bool vector<T>::operator>=(const vector<T>& other);*/


template<class T>
bool vector<T>::push(const T& val) {
    if (length >= maxLength) {
        if (!reallocate(maxLength * 2)) {
            return false;
        };
    }
    Array[length] = val;
    length++;
    return true;
}

template<class T>
void vector<T>::pop_back() {
    delete Array[length];
    length--;
}

template<class T>
size_t vector<T>::size() const {
    return length;
}

template<class T>
void vector<T>::erase(size_t index) {
    delete Array[index];
    for (int i = index; i <= length; i++) {
        Array[i] = Array[i + 1];
    }
    length--;
}


template<class T>
bool vector<T>::reallocate(size_t newSize) {
    T* temp = allocate(newSize);
    if (temp == nullptr) { return false; }

    if(newSize < length) {
        length = newSize;
    }
    for(int i = 0; i < length; i++) {
        temp[i] = Array[i];
    }
    delete[] Array;
    Array = temp;
    maxLength = newSize;
    return true;
}


template<class T>
size_t vector<T>::index(const T& val) {
    for (size_t i = 0; i < this->size(); i++) {
        if (val == *this[i]) {
            return i;
        }
    }
    return -1;
}

template<class T>
T* vector<T>::getPtr() {
    return Array;
}


/*template<class T>
size_t vector<T>::findIf(bool (*condition)(const T& x)) {
    for (size_t i = 0; i < this->size(); i++) {
        if (condition(*this[i])) {
            return i;
        }
    }
    return this->size();
}*/

template<class T>
void vector<T>::clear() {
    for(int i = 0; i < length; i++) {
        delete Array[i];
    }
    length = 0;
}

template<class T>
T *vector<T>::allocate(size_t newSize) {
    return (T*)malloc(sizeof(T) * newSize);
}

template<class T>
vector<T>::vector() {
    Array = allocate(maxLength);
}

template<class T>
vector<T>::vector(size_t size) {
    maxLength = size;
    Array = allocate(maxLength);
}

template<class T>
vector<T>::vector(size_t size, const T &val) {
    maxLength = size;
    Array = allocate(maxLength);
    for(int i = 0; i < size; i++) {
        Array[i] = val;
    }
}

template<class T>
vector<T>::vector(const vector<T> &other) {
    maxLength = other.size();
    length = other.size();
    Array = allocate(maxLength);
    for(int i = 0; i < other.size(); i++) {
        Array[i] = other[i];
    }
}

template<class T>
vector<T>::vector(std::initializer_list<T> list) {
    Array = allocate(maxLength);
    auto x = list.begin();
    while(x != list.end()) {
        push(*x);
        x++;
    }
}

template<class T>
bool vector<T>::empty() {
    return length == 0;
}

#endif //CSSCUSTOMCONTROLS_VECTOR_H