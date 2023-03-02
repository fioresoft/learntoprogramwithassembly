.section .text
.globl _start
_start:
    movq $256, %rax
    cmpq $1, %rax
    je end_loop
    begin_loop:
        subq $2,%rax
        jz end_loop
        cmpq $1, %rax
        je end_loop
        jmp begin_loop
    end_loop:
    cmpq $0, %rax
    je is_even
    movq $0, %rdi
    jmp end
    is_even:
        movq $1, %rdi
    end:
        mov $60, %eax
        syscall

