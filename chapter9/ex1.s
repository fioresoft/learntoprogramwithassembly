# 1. Write a program that returns bit 5 of a number.

.equ mask,      0b00100000
.equ number,    0b10100011
.globl _start
.section .text
_start:
xor %rax, %rax
mov $mask, %rax
mov $number, %rbx
andb %bl, %al
jz zero
movq $1, %rdi
jmp end
zero:
movq $0, %rdi
end:
movq $60, %rax
syscall
