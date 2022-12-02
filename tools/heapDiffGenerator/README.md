A python script that takes in memory dumps from the dolphin emulator, parses differences in the binary files, and gives the user
a list of changed addresses sorted by "heap region" (see heap_regions.txt)  
  
  
The purpose of this is to research which areas of memory are changing across frames for some game. Useful when implementing Rollback Netcode.  
  

An example output of this script might look like:

```
// System FW
{ 0x805b6cf0, 0x805b6dc0, nullptr, "System FW" },
...

// MenuInstance
{ 0x81734d60, 0x81734e10, nullptr, "MenuInstance" },
...

// Replay
{ 0x91301be0, 0x91301c40, nullptr, "Replay" },
...

// CopyFB
{ 0x9134cc00, 0x9134cc10, nullptr, "CopyFB" },
...

// Fighter1Resource
{ 0x9151fa00, 0x9151fab0, nullptr, "Fighter1Resource" },
.....

// Fighter2Resource
{ 0x91b04c80, 0x91b04d30, nullptr, "Fighter2Resource" },
...

// Fighter3Instance
{ 0x812deb60, 0x812deb80, nullptr, "Fighter3Instance" },
...
```

(... means truncated text)