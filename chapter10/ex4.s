# 4. Write a program that loops ten times and alternates between
# printing two different strings each time.
# yes this is WRONG, it should print hello world hello word
.section .data
str1:
    .ascii "hello - "
end1:
str2:
    .ascii "world\n"
end2:
turn:
    .byte 0

.equ LEN1, end1 - str1
.equ LEN2, end2 - str2

.globl _start
.section .text
_start:

#counter
movq $10, %rbx
movq $2, %r10       # turn
myloop:
    #movq $1, turn
    movq $0, %rdx
    movq %rbx, %rax
    divq %r10
    cmpq turn, %rdx
    je continue
    # syscall
    movq $1, %rax
    # desc
    movq $1, %rdi
    
    # str
    movq $str1, %rsi
    # len
    movq $LEN1, %rdx
    syscall

continue:
    notq turn
    movq $0, %rdx
    movq %rbx, %rax
    divq %r10
    cmpq turn, %rdx
    je myloop
    # syscall
    movq $1, %rax
    # desc
    movq $1, %rdi
    movq $str2, %rsi
    movq $LEN2, %rdx
    syscall
    decq %rbx
    cmpq $0, %rbx
    jne myloop
    jmp finish

finish:
    # exit
    movq $60, %rax
    syscall
