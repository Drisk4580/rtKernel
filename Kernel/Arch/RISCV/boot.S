.section .text
.global _start
_start:
    # setup the stack
    la sp, _stack_top
    # li a0, 8192
    # add sp, sp, a0

    # entry is defined in Kernel/Start.cpp
    call entry
_spin:
    j _spin

.section .bss
_stack_top: .space 8192
