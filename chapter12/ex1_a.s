#1. Now that you know how to perform input and output, convert
#two of your previous programs from having hard-coded inputs to
#having a prompt for the user and reading stdin for the value and
#then writing the result back out to stdout.

# we are using factorial function here with stdin and stdout

.globl main
.section .data
question:
    .asciz "enter a number to call factorial\n"
input:
    .asciz "%d"
result:
    .asciz "the result is %d\n"

.section .text
main:
    enter $16,$0
    mov stdout, %rdi
    mov $question, %rsi
    mov $0, %rax
    call fprintf
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
    leave
    ret

    
    

