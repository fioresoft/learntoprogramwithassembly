# 2. Pick two programs from previous chapters and convert them to
# functions.

# 2. Write a program that prints out the same string ten times in a loop.
.globl _start
.section .text
_start:
call _printtentimes
call oddoreven
mov $60, %rax
syscall

.section .data
mystring:
    .ascii "my string\n"
mystring_end:
.equ strlen, mystring_end - mystring

.globl _printtentimes
.section .text
_printtentimes:
enter $0, $0

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
leave
ret

# 3. Write a program that takes a number stored in memory and
# determines if that number is odd or even. Rather than using the
# exit status to communicate this information, have the program
# choose between two different strings to write to standard output.
#
#
.globl oddoreven
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
oddoreven:
enter $0, $0
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
leave
ret


