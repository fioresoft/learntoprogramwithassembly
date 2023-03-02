# 2. Write a program that prints out the same string ten times in a loop.
.section .data
mystring:
    .ascii "my string\n"
mystring_end:
.equ strlen, mystring_end - mystring

.globl _start
.section .text
_start:

# counter
mov $0, %rbx
loop:
    mov $1, %rax
    # file desc
    mov $1, %rdi
    # string
    mov $mystring, %rsi
    # len
    mov $strlen, %rdx
    syscall
    inc %rbx
    cmp $10, %rbx
    jne loop

# exit
mov $60, %rax
syscall

