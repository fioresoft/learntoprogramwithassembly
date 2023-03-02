.globl _start
.section .data
mynumber:
    .quad 9
.section .text
_start:
movq $0, %rdx
movq mynumber, %rax     # this POS has no $ at the beginning
#movq $2, %rcx
#divq %rcx
movq %rax, %rdi
movq $60, %rax
syscall
