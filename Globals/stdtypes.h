#pragma once

#include <stdint.h>
#include <stddef.h>

typedef signed char s8;
typedef signed short s16;
typedef signed int s32;
typedef long long s64;

typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef unsigned long long u64;

typedef volatile signed char vs8;
typedef volatile signed short vs16;
typedef volatile signed int vs32;
typedef volatile long long vs64;

typedef volatile unsigned char vu8;
typedef volatile unsigned short vu16;
typedef volatile unsigned int vu32;
typedef volatile unsigned long long vu64;

typedef float f32;
typedef double f64;

typedef volatile float vf32;
typedef volatile double vf64;

struct Position2D {
    f32 x;
    f32 y;
};

struct Position3D {
    f32 x;
    f32 y;
    f32 z;
};

// #define offsetof(type, member) (__builtin_offsetof(type, member))

// template<class> class function; // not defined
 
//   template<class R, class... ArgTypes>
//   class function<R(ArgTypes...)> {
//   public:
//     using result_type = R;
 
//     // construct/copy/destroy
//     function() noexcept;
//     function(const function&);
//     function(function&&) noexcept;
 
//     function& operator=(const function&);
//     function& operator=(function&&);
//     template<class F> function& operator=(F&&);
 
//     ~function();
 
//     // function modifiers
//     void swap(function&) noexcept;
 
//     // function capacity
//     explicit operator bool() const noexcept;
 
//     // function invocation
//     R operator()(ArgTypes...) const;
 
//     // function target access
//     template<class T>       T* target() noexcept;
//     template<class T> const T* target() const noexcept;
//   };
 
//   template<class R, class... ArgTypes>
//     function(R(*)(ArgTypes...)) -> function<R(ArgTypes...)>;
