.file "gdt.S"

.section .data, "aw", @progbits
  .align 8
  gdt_start:
    .long 0x00000000, 0x00000000
    .long 0x0000FFFF, 0x00CF9A00
    .long 0x0000FFFF, 0x00CF9200
  gdt_end:
  .type gdt_start, @object
  .size gdt_start, gdt_end - gdt_start

  .align 8
  gdt_descriptor:
    .word gdt_end - gdt_start - 1
    .long gdt_start
  .type gdt_descriptor, @object
  .size gdt_descriptor, 6

section .text, "ax", @progbits
  .align 4096
  .globl gdt_init
  .type gdt_init, @function
  gdt_init:
    lgdt gdt_descriptor
    mov $0x10, %ax
    mov %ax, %ds
    mov %ax, %es
    mov %ax, %fs
    mov %ax, %gs
    mov %ax, %ss
    ljmp $0x08, $flush_cs
  .size gdt_init, . - gdt_init
