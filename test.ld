_ctors = ADDR(.ctors);
_dtors = ADDR(.dtors);
SECTIONS
{
    .init : {}
    .text : { *(.text*)}
    .ctors : {
        *(.ctors*)
        *(.init*)
        LONG(0)
    }
    .dtors : {
        *(.dtors*)
        LONG(0)
    }
    .rodata : { *(.rodata*)}
    .data : {
        *(.data*)
    }
    .bss : {*(.bss*)}
}