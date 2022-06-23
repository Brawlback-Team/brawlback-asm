//
// Created by dareb on 7/25/2020.
//

#include "ftOwner.h"

double ftOwner::getDamage() {
    return _getDamage_ftOwner(this);
}

void ftOwner::setDamage(double newValue, int shouldLog) {
    _setDamage_ftOwner(newValue, this, shouldLog);
}

bool ftOwner::isCpu() {
    return _isOperationCpu_ftOwner(this);
}

int ftOwner::getStockCount() {
    return _getStockCount_ftOwner(this);
}

void ftOwner::setStockCount(int newValue) {
    return _setStockCount_ftOwner(this, newValue);
}