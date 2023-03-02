# 3. Write a program that takes a number stored in memory and
# determines if that number is odd or even. Rather than using the
# exit status to communicate this information, have the program
# choose between two different strings to write to standard output.
#
#
.globl _start
.section .data
mynumber:
    .quad 143
iseven:
    .ascii "is even\n"
end1:
isodd:
    .ascii "is odd\n"
end2:

.equ LEN1, end1 - iseven
.equ LEN2, end2 - isodd

.section .text
_start:
movq $0, %rdx
movq mynumber, %rax
movq $2, %rcx
divq %rcx
cmpq $0, %rdx
je even
# syscall
mov $1, %rax
# desc
mov $1, %edi
# string
mov $isodd, %rsi
# len
mov $LEN2, %rdx
syscall
jmp fim
even:
    # syscall
    mov $1, %rax
    # desc
    mov $1, %edi
    # string
    mov $iseven, %rsi
    # len
    mov $LEN1, %rdx
    syscall
# exit
fim:
mov $60, %eax
syscall

