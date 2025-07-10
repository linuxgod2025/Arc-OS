.section .text, "ax", @progbits
.globl invalid_boot
.type  invalid_boot, @function

invalid_boot:
    cli
    hlt
    jmp invalid_boot

.size invalid_boot, . - invalid_boot
