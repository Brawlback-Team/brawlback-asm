#include "Assembly.h"

//Assembly function used to save the state of registers during an injection
//TODO: Make this work when MSR has floating point disabled
asm(R"(
    .section .text.saveRegs
	.globl saveRegs
	.type saveRegs, @function
saveRegs:
	stw 0, 4(1)
	mfctr 0
	stw 0, -8(1)

	stfd 0, -0x10(1)
	stfd 1, -0x18(1)
	stfd 2, -0x20(1)
	stfd 3, -0x28(1)
	stfd 4, -0x30(1)
	stfd 5, -0x38(1)
	stfd 6, -0x40(1)
	stfd 7, -0x48(1)
	stfd 8, -0x50(1)
	stfd 9, -0x58(1)
	stfd 10, -0x60(1)
	stfd 11, -0x68(1)
	stfd 12, -0x70(1)
	stfd 13, -0x78(1)

	stwu 1, -248(1)
	stmw 2, 8(1)

	blr

	.size saveRegs, .-saveRegs
)");

//assembly function used to restore the state of save registers in an injection
//TODO: Make this work when MSR has floating point disabled
asm(R"(
    .section .text.restoreRegs
	.globl restoreRegs
	.type restoreRegs, @function
restoreRegs:
	lmw 2, 8(1)
	addi 1, 1, 248

	lfd 0, -0x10(1)
	lfd 1, -0x18(1)
	lfd 2, -0x20(1)
	lfd 3, -0x28(1)
	lfd 4, -0x30(1)
	lfd 5, -0x38(1)
	lfd 6, -0x40(1)
	lfd 7, -0x48(1)
	lfd 8, -0x50(1)
	lfd 9, -0x58(1)
	lfd 10, -0x60(1)
	lfd 11, -0x68(1)
	lfd 12, -0x70(1)
	lfd 13, -0x78(1)

	lwz 0, -8(1)
	mtctr 0
	lwz 0, 4(1)

	blr

	.size restoreRegs, .-restoreRegs
)");