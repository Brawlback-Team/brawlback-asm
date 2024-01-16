# Writing your Own Mods for Brawl / P+ with C++

Heyooo - fudge here! Just so this project isn't lost to time, I've decided to write a guide so that anyone else that desires to write codes in C++ can do so if they desire!

## Things you'll need:

- A computer running Windows
- EITHER
  - [CLion](https://www.jetbrains.com/clion/)
    - arguably more powerful paid option
  - [VSCode (the blue one)](https://code.visualstudio.com/)
    - free but requires a bit more setup

- [MinGW](https://www.mingw-w64.org/downloads/)
  - install `MinGW-W64-builds` and change the architecture to `x86_64` and `Msys2`

## Setting Up:

### - [VSCode](./Setup/VSCode.md)

### - [CLion](./Setup/CLion.md)

### - [MinGW](./Setup/MinGW.md)

After you follow the guide for your respective platform, you should now have everything you need setup to start developing the codes. But how exactly do you do that? Continue reading to find out!

## Developing Codes

There are two main folders in the root directory that you'll be interested in:

1. Codes
   - this is where codes are created
2. Libraries
   -  this is where the libraries necessary to write codes are created
   -  if you're contributing to libraries, you'll also want to check out `BrawlFuncMap.map` at the root of the project
      -  this contains a list of all the known function names as well as their offsets.

### Defining Native Brawl Functions

To define brawl functions that are in known locations, we need to tell the program exactly where they are in memory. To do this, we can define macros that act as function definitions. Take a look at `ftManager.h` at `Libraries/Brawl/FT/ftManager.h`:

You can see some various macros created with `#define` statements, such as the following:

```c++
//gets the number of fighters in a match
#define _getEntryCount_ftManager ((int (*)(ftManager * self)) 0x80815be4)
```

This tells the compiler that at the address `0x80815be4` there is a function (which we'll name`_getEntryCount_ftManager`) which will return an `int` that takes a `ftManager` as an argument. If we look at the `BrawlFuncMap` and search for `80815be4` we'll find `80815be4 00000014 80815be4 0 getEntryCount/[ftManager]/ft_manager.o`, which consists of the offset, size, and name of the function.

If you want more information about the function, you'll need to either reverse-engineer it in ghidra or take a look at the asm at that address when you have dolphin paused with P+ running.

### Creating New Codes

#### CMake

in the `Codes` folder, there are a bunch of codes that we've already created. To tell the compiler to add a code to the output, we use `CMakeLists.txt` and use the `add_subdirectory` command. Then when creating a new code, you'll need another `CMakeLists.txt` containing an `add_code` command that has the code name followed by all the files it depends on.

#### INJECTION and SIMPLE_INJECTION

When in a code's cpp file, to inject code into Brawl we'll need to use the `SIMPLE_INJECTION` and `INJECTION` macros that fracture has defined for us. For arguments they take:

1. the function name
2. the offset
3. the asm which we wish to inject at that location

The main difference between `SIMPLE_INJECTION` and `INJECTION` is that `SIMPLE_INJECTION` will automatically surround the asm with the `SAVE_REGS` and `RESTORE_REGS` macros, which will save and restore the registers, respectively. It will also automatically create a branch to the function name that was given as an argument. For cases where you'll just be modifying the game's state, you'll often use `SIMPLE_INJECTION`. For when you want to mess with specific registers or output particular things, you'll use `INJECTION`.

It's important to know what line of code you're overwriting at that particular location so you can add it to the `asm` injection.

#### Injecting with C++

Writing and executing C++ code is relatively easy - there are five types of injections:

- `SIMPLE_INJECTION(name, address, code)`
  - for simple injections that call C++ code
- `INJECTION(name, address, code)`
  - for injections that may call C++ and ASM code
- `STRING_WRITE(address, string)`
  - writes an ASCII string once to a location in memory
- `??? (currently unimplemented)`
  - behaves like `STRING_WRITE` but called every frame
- `DATA_WRITE(address, data)`
  - writes hex to a location in memory at startup
- `DATA_WRITE_REPEAT(address, data, repeatCount)`
  - writes hex to a location in memory at startup repeated lengthwise a given amount of times
- `STARTUP(name)`
  - executes a function once when the game is starting up
  - useful for doing things like changing global values

`SIMPLE_INJECTION` example:

```c++
SIMPLE_INJECTION("renderInjection", 0x8001792c, "addi r3, r30, 280") {
   // code goes here
}
```

For a simple injection, there is no need for something like `extern "C"` - that's taken care of for you.

`INJECTION` example:

```c++
INJECTION("renderInjection", 0x8001792c, R"(
	addi r3, r30, 280
	SAVE_REGS
	bl renderInjection
	RESTORE_REGS
)");

extern "C" void renderInjection() {
   // code goes here
}
```

To actually write and execute C++ code with an `INJECTION` you **do** need `extern "C"` to be able to call it from the injected asm code with a `bl` instruction.

#### Arguments and Return Values

there's an excellent entry on the CustomMarioKart wiki here:

http://wiki.tockdom.com/wiki/Compiler#Register_Convention

the important takeaway here is the `Register Convention` section, which details exactly how registers normally work when using functions. Any function arguments called from an injected function ( called upon with `bl`) will follow those conventions. They'll start with the floating point-based arguments (registers `f1` through `f8`) followed by the integer-based arguments (registers `r3` through `r10`).

To access the registers you want in a C++ injection, you'll sometimes need to move registers around with `mr` and `fmr`. This is why it's important to use `SAVE_REGS` and `RESTORE_REGS` - because without them you may mess with the order of things that Brawl expects which could lead to unexpected behavior (such as crashes). If I'm not mistaken, defining local variables may also mess with registers, which could *also* lead to unexpected behavior (such as crashes) - so the takeaway here is that `SAVE_REGS` and `RESTORE_REGS` are extremely important to use unless you know what you're doing when using the `INJECTION` macro to define a code.

#### Moving Registers to Use as Arguments in Injected Functions

here's a snippet from one of my slightly more complex injections:

```c++
INJECTION("CUSTOM_AI_COMMANDS", 0x80917450, R"(
    lbz r4, 0x00(r30)
    SAVE_REGS
    mr r3, r26
    mr r4, r30
    bl aiCommandHandlers
    RESTORE_REGS
)");
// ...
extern "C" void aiCommandHandlers(aiAct* aiActInst, const int* args) { ... }
```

the `lbz r4, 0x00(r30)` is the code that was there before I injected it. The exclusion of this would cause `r30` to have an unexpected value. The two `mr` statements then move some data from registers `r26` and `r30` to `r3` and `r4`, respectively. In this case they're pointers to an `aiAct` instance and the "args" of the custom AI command. This allows us to access them in our custom `aiCommandHandlers` function as the first and second arguments, because they're in `r3` and `r4`.

## Using ETL (Embeeded Template Library) in Codes
In Libraries/etl we've brought in headers files from https://github.com/ETLCPP/etl (slightly modified to work in our env) which give us STL style classes like string, vector etc. that do not perform heap allocations. These containers should be used when possible to avoid bugs common with manually memory management (raw `new` / `delete` / `malloc` / `free` is hard).

### Limitations
Because the containers do not perform heap allocations, their maximum size must be known at compile time and provided as a template argument. Example:
```c++
#include "etl/string.h"
#include "etl/vector.h"

//String that can grow to a maximum of 32 chars
etl::string<32> str;

//vector that can grow to a maximum of 128 u8s
etl::vector<u8, 128> vec;
```

We can still use these clases for heap allocated data, but the whole container needs to be heap-allocated. This may be useful if the data would be too large to store on the stack. Example:

```c++
#include "etl/memory.h"
#include "etl/vector.h"

//Heap allocated buffer of 1000 bytes (there will be a few extra bytes allocated for whatever other bookeeping the etl::vector class does)
//Prefer unique_ptr to raw pointer to avoid needing to call delete yourself
etl::unique_ptr<etl::vector<u8, 1000>> heapAllocatedVec(new etl::vector<u8, 1000>);
```


## That's All Folks

Thank you for reading! We can't wait to see the amazing things you'll create with this new and powerful framework!

\- Fracture & Fudgepop01