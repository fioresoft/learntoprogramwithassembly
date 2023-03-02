.globl _start
.section .data
numberofnumbers:
    .quad 7
numbers:
    .quad 4,55,66,2,88,1,2

.section .text
_start:
movq numberofnumbers, %rcx  # its the index and the counter
movq $100, %rdi               # holds the min value
cmpq $0, %rcx   
je end_loop
begin_loop:
    movq numbers-8(,%rcx,8), %rax #hold the current value
    cmpq %rdi, %rax
    jge continue_loop
    # min value so far
    movq %rax, %rdi
continue_loop:
    # Decrement %rcx and keep going until %rcx is zero
    loopq begin_loop
end_loop:
    movq $60, %rax
    syscall
