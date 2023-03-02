# 5. Write a program that starts with a value in a register and yields a
# 1 if that number is even and 0 if that number is odd (hint—think
# about the divq instruction and remainders).

# divq: Divides %rax by the source. %rax is the destination. A
# number cannot be used as the source—it must be a register or
# memory location. The remainder is stored in another register,
# %rdx, which should be set to zero before the instruction occurs.
.section .text
.globl _start
_start:
    movq $255, %rax
    movq $0, %rdx
    movq $2, %rbx
    divq %rbx
    addq $0, %rdx
    jz is_even          # jumps if rdx  é zero
    movq $0, %rdi
    jmp end
    is_even:
        movq $1, %rdi
    end:
        movq $60, %rax
        syscall
        