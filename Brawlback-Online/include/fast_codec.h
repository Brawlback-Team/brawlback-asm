#pragma once

#include <types.h>
#include <cstring>

namespace fastcodec {

inline void write_u32_le(u8* out, u32 v) {
    out[0] = (u8)(v & 0xFF);
    out[1] = (u8)((v >> 8) & 0xFF);
    out[2] = (u8)((v >> 16) & 0xFF);
    out[3] = (u8)((v >> 24) & 0xFF);
}

inline u32 read_u32_le(const u8* in) {
    return (u32)in[0] | ((u32)in[1] << 8) | ((u32)in[2] << 16) | ((u32)in[3] << 24);
}

inline u32 read_u32_unaligned(const u8* in) {
    u32 v = 0;
    ::memcpy(&v, in, sizeof(u32));
    return v;
}

inline u64 read_u64_unaligned(const u8* in) {
    u64 v = 0;
    ::memcpy(&v, in, sizeof(u64));
    return v;
}

static const size_t kMinMatch = 8;
static const int kHashBits = 12;
static const size_t kHashSize = (size_t)1 << kHashBits;
static const u32 kInvalidPos = 0xFFFFFFFFu;

enum Mode {
    MODE_FAST = 0,
    MODE_DENSE = 1,
};

inline u32 hash_sequence(u64 v) {
    return (u32)((v * 11400714819323198485ull) >> (64 - kHashBits));
}

inline size_t count_match_len(const u8* src, size_t p1, size_t p2, size_t src_size) {
    size_t matched = 0;
    while (p1 + matched + 8 <= src_size && read_u64_unaligned(src + p1 + matched) == read_u64_unaligned(src + p2 + matched)) {
        matched += 8;
    }
    while (p1 + matched < src_size && src[p1 + matched] == src[p2 + matched]) {
        matched++;
    }
    return matched;
}

inline unsigned clamp_skip_strength(unsigned v) {
    return v > 31 ? 31 : v;
}

inline unsigned compute_fast_skip_strength(u8 speedLevel) {
    // Higher speedLevel -> more aggressive skipping (lower shift).
    const unsigned base = 5;
    return clamp_skip_strength(base > speedLevel ? (base - speedLevel) : 1);
}

// LZ4-like upper bound + 4-byte uncompressed size header.
inline size_t max_compressed_size(size_t input_size) {
    return 4 + input_size + (input_size / 255) + 16;
}

inline bool compress_tuned(
    const u8* src,
    size_t src_size,
    u8* dst,
    size_t dst_cap,
    size_t& dst_size,
    Mode mode,
    u8 speedLevel
) {
    dst_size = 0;
    if (!src || !dst || dst_cap < 4)
        return false;

    if (src_size > 0xFFFFFFFFu)
        return false;

    if (dst_cap < max_compressed_size(src_size))
        return false;

    write_u32_le(dst, (u32)src_size);
    if (src_size == 0) {
        dst_size = 4;
        return true;
    }

    u32 hashTable[kHashSize];
    ::memset(hashTable, 0xFF, sizeof(hashTable));

    size_t o = 4;
    size_t anchor = 0;
    size_t i = 0;
    size_t skip = 1;
    const bool denseMode = (mode == MODE_DENSE);
    const unsigned fastSkipStrength = compute_fast_skip_strength(speedLevel);

    while (i + kMinMatch <= src_size) {
        u64 seq = read_u64_unaligned(src + i);
        u32 h = hash_sequence(seq);
        u32 refPos = hashTable[h];
        hashTable[h] = (u32)i;

        if (refPos == kInvalidPos) {
            if (denseMode) {
                i++;
            } else {
                i += skip;
                skip += (skip >> fastSkipStrength) + 1;
            }
            continue;
        }

        size_t ref = (size_t)refPos;
        if (ref >= i || (i - ref) > 65535) {
            if (denseMode) {
                i++;
            } else {
                i += skip;
                skip += (skip >> fastSkipStrength) + 1;
            }
            continue;
        }

        if (read_u64_unaligned(src + ref) != seq) {
            if (denseMode) {
                i++;
            } else {
                i += skip;
                skip += (skip >> fastSkipStrength) + 1;
            }
            continue;
        }

        skip = 1;

        size_t litLen = i - anchor;
        size_t tokenPos = o++;
        u8 token = 0;

        if (litLen < 15) {
            token = (u8)(litLen << 4);
        } else {
            token = 15u << 4;
            size_t extra = litLen - 15;
            while (extra >= 255) {
                dst[o++] = 255;
                extra -= 255;
            }
            dst[o++] = (u8)extra;
        }

        if (litLen > 0) {
            ::memcpy(dst + o, src + anchor, litLen);
            o += litLen;
        }

        size_t offset = i - ref;
        dst[o++] = (u8)(offset & 0xFF);
        dst[o++] = (u8)((offset >> 8) & 0xFF);

        size_t matchLen = count_match_len(src, i, ref, src_size);

        size_t matchTokenLen = matchLen - kMinMatch;
        if (matchTokenLen < 15) {
            token |= (u8)matchTokenLen;
        } else {
            token |= 15u;
            size_t extra = matchTokenLen - 15;
            while (extra >= 255) {
                dst[o++] = 255;
                extra -= 255;
            }
            dst[o++] = (u8)extra;
        }

        dst[tokenPos] = token;

        i += matchLen;
        anchor = i;

        if (i > 0 && i + kMinMatch <= src_size) {
            u64 backSeq = read_u64_unaligned(src + (i - 1));
            hashTable[hash_sequence(backSeq)] = (u32)(i - 1);
        }
    }

    // Final literal run.
    size_t litLen = src_size - anchor;
    u8 token = 0;
    if (litLen < 15) {
        token = (u8)(litLen << 4);
    } else {
        token = 15u << 4;
    }
    dst[o++] = token;

    if (litLen >= 15) {
        size_t extra = litLen - 15;
        while (extra >= 255) {
            dst[o++] = 255;
            extra -= 255;
        }
        dst[o++] = (u8)extra;
    }

    if (litLen > 0) {
        ::memcpy(dst + o, src + anchor, litLen);
        o += litLen;
    }

    dst_size = o;
    return true;
}

inline bool compress(const u8* src, size_t src_size, u8* dst, size_t dst_cap, size_t& dst_size) {
    return compress_tuned(src, src_size, dst, dst_cap, dst_size, MODE_FAST, 0);
}

inline bool decompress(const u8* src, size_t src_size, u8* dst, size_t dst_cap, size_t& out_size) {
    out_size = 0;

    if (!src || !dst || src_size < 4)
        return false;

    const size_t expected = (size_t)read_u32_le(src);
    if (expected > dst_cap)
        return false;

    size_t i = 4;
    size_t o = 0;

    while (i < src_size && o < expected) {
        const u8 token = src[i++];

        size_t litLen = (size_t)(token >> 4);
        if (litLen == 15) {
            u8 v = 255;
            while (v == 255) {
                if (i >= src_size)
                    return false;
                v = src[i++];
                litLen += (size_t)v;
            }
        }

        if (i + litLen > src_size || o + litLen > expected)
            return false;

        if (litLen > 0) {
            ::memcpy(dst + o, src + i, litLen);
            i += litLen;
            o += litLen;
        }

        // Pure literal tail block has no match that follows.
        if (i >= src_size) {
            break;
        }

        if (i + 2 > src_size)
            return false;

        size_t offset = (size_t)src[i] | ((size_t)src[i + 1] << 8);
        i += 2;
        if (offset == 0 || offset > o)
            return false;

        size_t matchLen = (size_t)(token & 0x0F) + kMinMatch;
        if ((token & 0x0F) == 15) {
            u8 v = 255;
            while (v == 255) {
                if (i >= src_size)
                    return false;
                v = src[i++];
                matchLen += (size_t)v;
            }
        }

        if (o + matchLen > expected)
            return false;

        size_t matchPos = o - offset;
        ::memmove(dst + o, dst + matchPos, matchLen);
        o += matchLen;
    }

    if (o != expected)
        return false;

    out_size = o;
    return true;
}

} // namespace fastcodec
