.file "stack.S"

.equ stack_size, 0x4000
.equ guard_size, 0x1000

.section .bss, "aw", @nobits

.align 4096
.lcomm boot_stack_guard, guard_size

.align 64
.lcomm boot_stack_bottom, stack_size

.set boot_stack_base, boot_stack_bottom & ~0xF
.set boot_stack_top, (boot_stack_bottom + stack_size) & ~0xF

.globl boot_stack_base
.globl boot_stack_top