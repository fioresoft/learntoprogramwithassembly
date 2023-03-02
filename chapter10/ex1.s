# 1. Write a program that prints out two different strings one right after
# the other.
.equ STDIN,     0
.equ STDOUT,    1
.equ STDERR,    2


.globl  _start
.section .data
mystring:
    .ascii "Hello there!"
mystring_end:
mystring2:
    .ascii "hello world"
mystring2_end:
.equ mystring_length, mystring_end - mystring
.equ mystring2_length, mystring2_end - mystring2
.section .text
_start:
    ### Display the string
    # System call number
    movq $1, %rax
    # File descriptor
    movq $STDOUT, %rdi
    # Pointer to the data
    movq $mystring, %rsi
    # Length of the data
    movq $mystring_length, %rdx
    syscall
    # System call number
    movq $1, %rax
    # File descriptor
    movq $STDOUT, %rdi
    # Pointer to the data
    movq $mystring2, %rsi
    # Length of the data
    movq $mystring2_length, %rdx
    syscall
    ### Exit
    movq $0x3c, %rax
    movq $0, %rdi
    syscall
