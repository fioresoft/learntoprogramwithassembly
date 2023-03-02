.globl _start
.section .data
numberofnumbers:
    .quad 7
numbers:
    .quad 4,55,66,2,88,1,2

.section .text
_start:
movq numberofnumbers, %rcx  # holds the number of elements in the list
movq $0, %rbx               # holds the index in the list
movq $0, %rdi               # holds the max value
cmpq $0, %rcx   
je end_loop
begin_loop:
    movq numbers(,%rbx,8), %rax  #hold the current value
    cmpq %rdi, %rax
    jbe continue_loop
    # largest value so far
    movq %rax, %rdi
continue_loop:
    incq %rbx
    cmpq numberofnumbers, %rbx
    je end_loop
    jmp begin_loop
end_loop:
    movq $60, %rax
    syscall
