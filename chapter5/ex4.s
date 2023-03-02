#4. Even though we have already learned about the mulq instruction,
# write a program that will multiply two numbers by repeatedly
#adding in a loop.

.section .text
.globl _start
_start:
    movq $2, %rbx
    movq $0, %rax
    # multiplies rbx by rcx by summing
    movq $8, %rcx #this is the counter
    begin_loop:
        addq %rbx, %rax
        decq %rcx
        cmpq $0, %rcx
        je end_loop
        jmp begin_loop
    end_loop:
        movq %rax, %rdi
        movq $60, %rax
        syscall


