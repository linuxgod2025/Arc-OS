.file "stack.S"

.equ stack_size, 0x4000
.equ guard_size, 0x1000

.section .bss, "aw", @nobits
  .balign 4096
  .lcomm boot_stack_guard, guard_size

  .balign 4096
  .lcomm boot_stack_bottom, stack_size

  .set boot_stack_base, boot_stack_bottom & ~0xFFF
  .set boot_stack_top, (boot_stack_bottom + stack_size) & ~0xFFF

  .globl boot_stack_base
  .globl boot_stack_top

.section .text, "ax", @progbits
  .balign 4096
  .globl init_stack
  .type init_stack, @function

  init_stack:
    movl $boot_stack_top, %esp
    andl $0xFFFFFFF0, %esp
    subl $4, %esp
    ret
