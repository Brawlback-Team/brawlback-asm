#pragma once

#include <types.h>

namespace SyringeUtils {
    u32 EncodeBranch(u32 start, u32 dest, bool linked);
    u32 EncodeBranch(u32 start, u32 dest);
} // namespace SyringeUtils
