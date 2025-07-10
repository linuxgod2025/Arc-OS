.file "multiboot2.S"

.section .multiboot2, "a", @progbits
.align 8

.globl multiboot_header
.type multiboot_header, @object

multiboot_header:
    .long 0xE85250D6
    .long 0
    .long multiboot_header_end - multiboot_header
    .long -(0xE85250D6 + 0 + (multiboot_header_end - multiboot_header))

multiboot_header_end:

.size multiboot_header, . - multiboot_header
