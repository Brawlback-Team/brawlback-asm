#pragma once

#include "stdtypes.h"

asm(R"(
.set sp, 1;  .set rtoc, 2;
.set r0,0;   .set r1,1;   .set r2,2; .set r3,3;   .set r4,4
.set r5,5;   .set r6,6;   .set r7,7;   .set r8,8;   .set r9,9
.set r10,10; .set r11,11; .set r12,12; .set r13,13; .set r14,14
.set r15,15; .set r16,16; .set r17,17; .set r18,18; .set r19,19
.set r20,20; .set r21,21; .set r22,22; .set r23,23; .set r24,24
.set r25,25; .set r26,26; .set r27,27; .set r28,28; .set r29,29
.set r30,30; .set r31,31;
.set f0,0;   .set f1,1;   .set f2,2; .set f3,3;   .set f4,4
.set f5,5;   .set f6,6;   .set f7,7;   .set f8,8;   .set f9,9
.set f10,10; .set f11,11; .set f12,12; .set f13,13; .set f14,14
.set f15,15; .set f16,16; .set f17,17; .set f18,18; .set f19,19
.set f20,20; .set f21,21; .set f22,22; .set f23,23; .set f24,24
.set f25,25; .set f26,26; .set f27,27; .set f28,28; .set f29,29
.set f30,30; .set f31,31;
.set cr0,0; .set cr1,1; .set cr2,2; .set cr3,3;
.set cr4,4; .set cr5,5; .set cr6,6; .set cr7,7;
)");

//Use this to inject assembly into a Brawl function
//Automatically inserts a nop for the branch back
//takes a string name, the address to inject into, and a string of GAS PPC assembly
//#define INJECTION(name, address, code) \
	asm( \
		//".text\n" \
		//".globl " name "_INJECTION_" #address "\n" \
		//"\t.type " name "_INJECTION_" #address ", @function\n" \
		//name "_INJECTION_" #address ":\n" \
		//code "\n" \
		//"\tnop\n\n" \
		//"\t.size " name "_INJECTION_" #address ", .-" name "_INJECTION_" #address \
//	)

#define INJECTION(name, address, code) \
	asm( \
	    ".section " ".text." name "_INJECTION_" #address "\n" \
		".globl " name "_INJECTION_" #address "\n" \
		"\t.type " name "_INJECTION_" #address ", @function\n" \
		name "_INJECTION_" #address ":\n" \
		code "\n" \
		"\tnop\n\n" \
		"\t.size " name "_INJECTION_" #address ", .-" name "_INJECTION_" #address \
	);


#define SIMPLE_INJECTION(name, address, replacement) \
    INJECTION(#name, address, \
		"SAVE_REGS\n" \
		"bl " #name "\n" \
		"RESTORE_REGS\n" \
		replacement \
	);                         \
    extern "C" void name()

#define NO_REGS_INJECTION(name, address, replacement, returnType) \
    INJECTION(#name, address, \
		"bl " #name "\n" \
		replacement \
	);                         \
    extern "C" returnType name()

#define STARTUP(name) \
	asm( \
		".text\n" \
		".globl " #name "_STARTUP_\n" \
		"\t.type " #name "_STARTUP_, @function\n" \
		#name "_STARTUP_:\n" \
		"SAVE_REGS\n" \
		"bl " #name "\n" \
		"RESTORE_REGS\n" \
		"\tblr\n\n" \
		"\t.size " #name "_STARTUP_, .-" #name "_STARTUP_" \
	);                   \
    extern "C" void name()



#define STRING_WRITE(address, string) \
    asm(                              \
    ".section .text._STRING_WRITE_" #address "\n" \
    ".globl _STRING_WRITE_" #address "\n" \
    ".type _STRING_WRITE_" #address ", @function\n" \
    "_STRING_WRITE_" #address ":\n"       \
    ".ascii " #string "\n"            \
    ".size _STRING_WRITE_" #address ", .-_STRING_WRITE_" #address "\n" \
    ".align 2\n"                                  \
    )


#define DATA_WRITE_REPEAT(address, data, repeat) \
    asm(                              \
    ".globl _DATA_WRITE_" #address "_" #data "_" #repeat "\n" \
    ".type _DATA_WRITE_" #address "_" #data "_" #repeat ", @function\n" \
    "_DATA_WRITE_" #address "_" #data "_" #repeat ":\n"       \
    ".size _DATA_WRITE_" #address "_" #data "_" #repeat ", 4\n" \
    )


#define DATA_WRITE(address, data) \
    DATA_WRITE_REPEAT(address, data, 1)


//macro for calling saveRegs
asm(R"(.macro SAVE_REGS
	stw r0, -4(sp)
	mflr r0
	bl saveRegs
.endm)");

//macro for calling restoreRegs
asm(R"(.macro RESTORE_REGS
	bl restoreRegs
	mtlr r0
	lwz r0, -4(sp)
.endm)");



//push and pop offset by 8 each time so function calls don't overwrite values with bl
asm(R"(.macro PUSH reg
	stwu \reg, -0x8(sp)
.endm)");

asm(R"(.macro POP reg
	lwz \reg, 0(sp)
    addi sp, sp, -0x8
.endm)");



asm(R"(.macro SETREG reg label
    lis \reg, \label@ha
    addi \reg, \reg, \label@l
.endm)");

asm(R"(.macro BRANCH reg label
    SETREG \reg, \label
	mtctr \reg
	bctr
.endm)");

asm(R"(.macro getCurrentAddress reg
    bl 1f
    1:
    mflr \reg
.endm)");


/*#define STATIC_OBJECT(name, type, address) \
    extern type name;                      \
    namespace __STATIC_OBJECT__ {type __ ## name ## __ ## type ## __ ## address;}*/


static inline u32 read32(u32 addr) {
	u32 x;
	asm volatile("lwz %0,0(%1) ; sync" : "=r"(x) : "b"(0xc0000000 | addr));
	return x;
}

static inline void write32(u32 addr, u32 x) {
	asm("stw %0,0(%1) ; eieio" : : "r"(x), "b"(0xc0000000 | addr));
}

static inline void mask32(u32 addr, u32 clear, u32 set) {
	write32(addr, (read32(addr) & (~clear)) | set);
}

static inline u16 read16(u32 addr) {
	u16 x;
	asm volatile("lhz %0,0(%1) ; sync" : "=r"(x) : "b"(0xc0000000 | addr));
	return x;
}

static inline void write16(u32 addr, u16 x) {
	asm("sth %0,0(%1) ; eieio" : : "r"(x), "b"(0xc0000000 | addr));
}

static inline u8 read8(u32 addr) {
	u8 x;
	asm volatile("lbz %0,0(%1) ; sync" : "=r"(x) : "b"(0xc0000000 | addr));
	return x;
}

static inline void write8(u32 addr, u8 x) {
	asm("stb %0,0(%1) ; eieio" : : "r"(x), "b"(0xc0000000 | addr));
}

static inline void writef32(u32 addr, f32 x) {
	asm("stfs %0,0(%1) ; eieio" : : "f"(x), "b"(0xc0000000 | addr));
}



#define __stringify(rn)	#rn

#define mfmsr()   ({register u32 _rval; \
		asm volatile("mfmsr %0" : "=r" (_rval)); _rval;})
#define mtmsr(val)  asm volatile("mtmsr %0" : : "r" (val))

#define mfspr(_rn) \
({	register u32 _rval = 0; \
	asm volatile("mfspr %0," __stringify(_rn) \
	: "=r" (_rval));\
	_rval; \
})

#define mtspr(_rn, _val) asm volatile("mtspr " __stringify(_rn) ",%0" : : "r" (_val))

#define mfwpar()		mfspr(WPAR)
#define mtwpar(_val)	mtspr(WPAR,_val)

#define mfmmcr0()		mfspr(MMCR0)
#define mtmmcr0(_val)	mtspr(MMCR0,_val)
#define mfmmcr1()		mfspr(MMCR1)
#define mtmmcr1(_val)	mtspr(MMCR1,_val)

#define mfpmc1()		mfspr(PMC1)
#define mtpmc1(_val)	mtspr(PMC1,_val)
#define mfpmc2()		mfspr(PMC2)
#define mtpmc2(_val)	mtspr(PMC2,_val)
#define mfpmc3()		mfspr(PMC3)
#define mtpmc3(_val)	mtspr(PMC3,_val)
#define mfpmc4()		mfspr(PMC4)
#define mtpmc4(_val)	mtspr(PMC4,_val)

#define mfhid0()		mfspr(HID0)
#define mthid0(_val)	mtspr(HID0,_val)
#define mfhid1()		mfspr(HID1)
#define mthid1(_val)	mtspr(HID1,_val)
#define mfhid2()		mfspr(HID2)
#define mthid2(_val)	mtspr(HID2,_val)
#define mfhid4()		mfspr(HID4)
#define mthid4(_val)	mtspr(HID4,_val)

#define cntlzw(_val) ({register u32 _rval; \
					  asm volatile("cntlzw %0, %1" : "=r"((_rval)) : "r"((_val))); _rval;})

#define _CPU_MSR_GET( _msr_value ) \
  do { \
    _msr_value = 0; \
    asm volatile ("mfmsr %0" : "=&r" ((_msr_value)) : "0" ((_msr_value))); \
  } while (0)

#define _CPU_MSR_SET( _msr_value ) \
{ asm volatile ("mtmsr %0" : "=&r" ((_msr_value)) : "0" ((_msr_value))); }

#define _CPU_FPR_Enable() \
{ register u32 _val = 0; \
	  asm volatile ("mfmsr %0; ori %0,%0,0x2000; mtmsr %0" : \
					"=&r" (_val) : "0" (_val));\
}

#define _CPU_FPR_Disable() \
{ register u32 _val = 0; \
	  asm volatile ("mfmsr %0; rlwinm %0,%0,0,19,17; mtmsr %0" : \
					"=&r" (_val) : "0" (_val));\
}
