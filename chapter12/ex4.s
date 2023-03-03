#4. Modify the previous program so that the user is prompted after
#each iteration and asked if they want to keep going. Have them
#enter the number 1 to keep going, so you can scan for a number.
.globl main
.section .data
question:
    .asciz "enter a number to call factorial\n"
input:
    .asciz "%d"
result:
    .asciz "the result is %d\n"
saida:
    .asciz "Enter 1 to quit\n"
input2:
    .asciz "%d"
.section .text
main:
    enter $16,$0
begin_loop:
# print message
    mov stdout, %rdi
    mov $question, %rsi
    mov $0, %rax
    call fprintf
# le a resposta
    mov stdin, %rdi
    mov $input, %rsi
    leaq -8(%rbp), %rdx
    mov $0, %rax
    call fscanf
    movq -8(%rbp), %rdi
    call factorial
    # prints the result
    mov stdout, %rdi
    mov $result, %rsi
    mov %rax, %rdx
    mov $0, %rax
    call fprintf
    # asks if the user wants to continue
    mov stdout, %rdi
    mov $saida, %rsi
    mov $0, %rax
    call fprintf
    # le a resposta
    mov stdin, %rdi
    mov $input2, %rsi
    mov $0, %rax
    leaq -8(%rbp), %rdx
    call fscanf
    mov -8(%rbp), %rdi
    cmp $1, %rdi
    jne begin_loop

end_loop:
    leave
    ret
