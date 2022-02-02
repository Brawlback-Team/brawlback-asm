#ifndef PROJECTMCODES_ARRAYVECTOR_H
#define PROJECTMCODES_ARRAYVECTOR_H

struct ArrayListVTable {
    char _spacer[0x8];
    void** isNullFn;
    void** atFn1;
    void** at_7Fn;
    void** sizeFn;
    void** isEmptyFn;
    void** __dtFn;
    void** shiftFn;
    void** popFn;
    void** clearFn;
    void** unshiftFn;
    void** pushFn;
    void** insertFn;
    void** eraseFn;
    void** capacityFn;
    void** isFullFn;
    void** setFn;
};

template<class T>
struct ArrayList {
    bool isNull();
    T* at(int index);
    // T* at();
    int size();
    bool isEmpty();
    ~ArrayList();
    T* shift();
    T* pop();
    T * clear();
    void unshift(T* element);
    void push(T* element);
    void insert(T* element, int index);
    void erase(int index);
    int capacity();
    bool isFull();
    // these parameters are just a guess
    void set(int index, T* element);

    ArrayListVTable* vtable1;
};

template<class T>
bool ArrayList<T>::isNull() {
    return ((bool (*)(void* self)) this->vtable1->isNullFn)(this);
}

template<class T>
T* ArrayList<T>::at(int index) {
    return ((T* (*)(void* self, int index)) this->vtable1->at_7Fn)(this, index);
}

// template<class T>
// T* ArrayList<T>::at() {
//   return ((T* (*)(void* self, int index)) this->vtable1->isNullFn)(this);
// }

template<class T>
int ArrayList<T>::size() {
    return ((int (*)(void* self)) this->vtable1->sizeFn)(this);
}

template<class T>
bool ArrayList<T>::isEmpty() {
    return ((bool (*)(void* self)) this->vtable1->isEmptyFn)(this);
}

template<class T>
ArrayList<T>::~ArrayList() {
    ((void (*)(void* self)) this->vtable1->__dtFn)(this);
}

template<class T>
T* ArrayList<T>::shift() {
    return ((T* (*)(void* self)) this->vtable1->shiftFn)(this);
}

template<class T>
T* ArrayList<T>::pop() {
    return ((T* (*)(void* self)) this->vtable1->popFn)(this);
}

template<class T>
T* ArrayList<T>::clear() {
    return ((T* (*)(void* self)) this->vtable1->clearFn)(this);
}

template<class T>
void ArrayList<T>::unshift(T* element) {
    return ((void (*)(void* self)) this->vtable1->unshiftFn)(this, element);
}

template<class T>
void ArrayList<T>::push(T* element) {
    return ((void (*)(void* self)) this->vtable1->pushFn)(this, element);
}

template<class T>
void ArrayList<T>::insert(T* element, int index) {
    return ((void (*)(void* self)) this->vtable1->insertFn)(this, element, index);
}

template<class T>
void ArrayList<T>::erase(int index) {
    return ((void (*)(void* self)) this->vtable1->eraseFn)(this, index);
}

template<class T>
int ArrayList<T>::capacity() {
    return ((int (*)(void* self)) this->vtable1->capacityFn)(this);
}

template<class T>
void ArrayList<T>::set(int index, T* element) {
    return ((void (*)(void* self)) this->vtable1->setFn)(this, index, element);
}

#endif