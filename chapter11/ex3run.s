.globl _start
.section .text
_start:
mov $3, %rdi
call pickfunction
mov %rax, %rdi
mov $60, %rax
syscall
