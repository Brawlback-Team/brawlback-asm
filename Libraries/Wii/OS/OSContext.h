#pragma once

#include "stdtypes.h"

struct OSContext {
	u32 gpr[32];

	u32 cr;
	u32 lr;
	u32 ctr;
	u32 xer;

	f64 fpr[32];

	u32 fpscr_pad;
	u32 fpscr;

	// Exception handling registers
	u32 srr0;
	u32 srr1;

	// Context mode
	u16 mode;           // since UIMM is 16 bits in PPC
	u16 state;          // OR-ed OS_CONTEXT_STATE_*

	// Place Gekko regs at the end so we have minimal changes to
	// existing code
	u32 gqr[8];
	u32 psf_pad;
	f64 psf[32];
};

//for inline ASM
asm(R"(
    .set OS_CONTEXT_R0,       0
    .set OS_CONTEXT_R1,       4
    .set OS_CONTEXT_R2,       8
    .set OS_CONTEXT_R3,       12
    .set OS_CONTEXT_R4,       16
    .set OS_CONTEXT_R5,       20
    .set OS_CONTEXT_R6,       24
    .set OS_CONTEXT_R7,       28
    .set OS_CONTEXT_R8,       32
    .set OS_CONTEXT_R9,       36
    .set OS_CONTEXT_R10,      40
    .set OS_CONTEXT_R11,      44
    .set OS_CONTEXT_R12,      48
    .set OS_CONTEXT_R13,      52
    .set OS_CONTEXT_R14,      56
    .set OS_CONTEXT_R15,      60
    .set OS_CONTEXT_R16,      64
    .set OS_CONTEXT_R17,      68
    .set OS_CONTEXT_R18,      72
    .set OS_CONTEXT_R19,      76
    .set OS_CONTEXT_R20,      80
    .set OS_CONTEXT_R21,      84
    .set OS_CONTEXT_R22,      88
    .set OS_CONTEXT_R23,      92
    .set OS_CONTEXT_R24,      96
    .set OS_CONTEXT_R25,      100
    .set OS_CONTEXT_R26,      104
    .set OS_CONTEXT_R27,      108
    .set OS_CONTEXT_R28,      112
    .set OS_CONTEXT_R29,      116
    .set OS_CONTEXT_R30,      120
    .set OS_CONTEXT_R31,      124

    .set OS_CONTEXT_CR,       128
    .set OS_CONTEXT_LR,       132
    .set OS_CONTEXT_CTR,      136
    .set OS_CONTEXT_XER,      140

    .set OS_CONTEXT_FPR0,     144
    .set OS_CONTEXT_FPR1,     152
    .set OS_CONTEXT_FPR2,     160
    .set OS_CONTEXT_FPR3,     168
    .set OS_CONTEXT_FPR4,     176
    .set OS_CONTEXT_FPR5,     184
    .set OS_CONTEXT_FPR6,     192
    .set OS_CONTEXT_FPR7,     200
    .set OS_CONTEXT_FPR8,     208
    .set OS_CONTEXT_FPR9,     216
    .set OS_CONTEXT_FPR10,    224
    .set OS_CONTEXT_FPR11,    232
    .set OS_CONTEXT_FPR12,    240
    .set OS_CONTEXT_FPR13,    248
    .set OS_CONTEXT_FPR14,    256
    .set OS_CONTEXT_FPR15,    264
    .set OS_CONTEXT_FPR16,    272
    .set OS_CONTEXT_FPR17,    280
    .set OS_CONTEXT_FPR18,    288
    .set OS_CONTEXT_FPR19,    296
    .set OS_CONTEXT_FPR20,    304
    .set OS_CONTEXT_FPR21,    312
    .set OS_CONTEXT_FPR22,    320
    .set OS_CONTEXT_FPR23,    328
    .set OS_CONTEXT_FPR24,    336
    .set OS_CONTEXT_FPR25,    344
    .set OS_CONTEXT_FPR26,    352
    .set OS_CONTEXT_FPR27,    360
    .set OS_CONTEXT_FPR28,    368
    .set OS_CONTEXT_FPR29,    376
    .set OS_CONTEXT_FPR30,    384
    .set OS_CONTEXT_FPR31,    392

    .set OS_CONTEXT_FPSCR,    400

    .set OS_CONTEXT_SRR0,     408
    .set OS_CONTEXT_SRR1,     412

    .set OS_CONTEXT_MODE,     416
    .set OS_CONTEXT_STATE,    418

    .set OS_CONTEXT_GQR0,     420
    .set OS_CONTEXT_GQR1,     424
    .set OS_CONTEXT_GQR2,     428
    .set OS_CONTEXT_GQR3,     432
    .set OS_CONTEXT_GQR4,     436
    .set OS_CONTEXT_GQR5,     440
    .set OS_CONTEXT_GQR6,     444
    .set OS_CONTEXT_GQR7,     448
    .set __OSCONTEXT_PADDING, 452

    .set OS_CONTEXT_PSF0,     456
    .set OS_CONTEXT_PSF1,     464
    .set OS_CONTEXT_PSF2,     472
    .set OS_CONTEXT_PSF3,     480
    .set OS_CONTEXT_PSF4,     488
    .set OS_CONTEXT_PSF5,     496
    .set OS_CONTEXT_PSF6,     504
    .set OS_CONTEXT_PSF7,     512
    .set OS_CONTEXT_PSF8,     520
    .set OS_CONTEXT_PSF9,     528
    .set OS_CONTEXT_PSF10,    536
    .set OS_CONTEXT_PSF11,    544
    .set OS_CONTEXT_PSF12,    552
    .set OS_CONTEXT_PSF13,    560
    .set OS_CONTEXT_PSF14,    568
    .set OS_CONTEXT_PSF15,    576
    .set OS_CONTEXT_PSF16,    584
    .set OS_CONTEXT_PSF17,    592
    .set OS_CONTEXT_PSF18,    600
    .set OS_CONTEXT_PSF19,    608
    .set OS_CONTEXT_PSF20,    616
    .set OS_CONTEXT_PSF21,    624
    .set OS_CONTEXT_PSF22,    632
    .set OS_CONTEXT_PSF23,    640
    .set OS_CONTEXT_PSF24,    648
    .set OS_CONTEXT_PSF25,    656
    .set OS_CONTEXT_PSF26,    664
    .set OS_CONTEXT_PSF27,    672
    .set OS_CONTEXT_PSF28,    680
    .set OS_CONTEXT_PSF29,    688
    .set OS_CONTEXT_PSF30,    696
    .set OS_CONTEXT_PSF31,    704
)");

//TODO: move relevent functins to OSContext struct
//TODO: Implement fucntions
u32         OSGetStackPointer(void);
u32         OSSwitchStack(u32 newsp);
int         OSSwitchFiber(u32 pc, u32 newsp);
int         OSSwitchFiberEx(u32 arg0, u32 arg1, u32 arg2, u32 arg3, u32 pc, u32 newsp);

void        OSSetCurrentContext(OSContext* context);
OSContext* OSGetCurrentContext(void);
u32         OSSaveContext(OSContext* context);

void        OSLoadContext(OSContext* context);
void        OSClearContext(OSContext* context);
void        OSInitContext(OSContext* context, u32 pc, u32 sp);

void        OSLoadFPUContext(OSContext* context);
void        OSSaveFPUContext(OSContext* context);

void        OSFillFPUContext(OSContext* context);

void        OSDumpContext(OSContext* context);