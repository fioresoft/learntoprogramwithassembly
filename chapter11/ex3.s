.globl pickfunction
.section .text
pickfunction:
enter $0, $0
mov %rdi, %rax
mov $2, %rbx
mov $0, %rdx
divq %rbx
cmpq $0, %rdx
jne odd
movq %rax, %rdi
call factorial
jmp exit
odd:
    movq $3, %rsi
    call exponent
exit:
leave
ret


