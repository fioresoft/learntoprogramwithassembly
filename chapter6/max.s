.globl _start
.section .data
numberofnumbers:
    .quad 7
numbers:
    .quad 4,55,66,2,88,1,2

.section .text
_start:
movq numberofnumbers, %rcx
movq $1, %rdi   # holds the index in the list
cmpq $0, %rcx   # holds the max value so far
je end_loop
movq $numbers, %rbx
begin_loop:
    movq (%rbx), %rax
    cmpq %rcx, %rax
    jbe continue
    # largest value so far
    movq %rax, %rcx
continue:
    incq %rdi
    cmpq numberofnumbers, %rdi
    je end_loop
    addq $8, %rbx
    jmp begin_loop
end_loop:
    movq %rcx, %rdi
    movq $60, %rax
    syscall
