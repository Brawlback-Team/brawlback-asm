//
// Created by dareb on 9/19/2020.
//

#include "moduleFnAccessor.h"

ftCancelModule* moduleFnAccessor::getFtCancelModule(void* ft) {
    return ((ftCancelModule* (*)(void* ft))(this->fn_getFtCancelModule))(ft);
}