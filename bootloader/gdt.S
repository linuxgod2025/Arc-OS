.file "gdt.S"

.section .data, "aw", @progbits
  .align 8
  gdt_start:
    .long 0x00000000, 00000000
    .long 0000FFFF, 0x00CF9A00
    .long 0x0000FFFF, 0x00CF9200
  gdt_end:
  .type gdt_start, @object
  .size gdt_start, gdt_end - gdt_start

  gdt_descriptor:
    .word gdt_end - gdt_start - 1
    .long gdt_start
  .type gdt_descriptor, @object
  .size gdt_descriptor, 6