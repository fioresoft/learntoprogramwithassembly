# 2. Write a full program that calculates the length of a string using
# scasb.

.section .data
mystring:
    .asciz "hello, world!"

.globl _start
.section .text
_start:

movq $-1, %rcx # this makes rcx all 1
movq $mystring, %rdi    # load the address of the string
movb $0, %al            # looking for a null value
repne scasb             # repeat until found

# subq $mystring, %rdi  # this i didnt understand so i removed it
decq %rdi
movq $60, %rax
syscall
