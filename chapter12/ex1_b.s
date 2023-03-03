#1. Now that you know how to perform input and output, convert
#two of your previous programs from having hard-coded inputs to
#having a prompt for the user and reading stdin for the value and
#then writing the result back out to stdout.

# we are using exponential function here with stdin and stdout

.globl main
.section .data
promptformat:
    .ascii "Enter two numbers separated by spaces, then press return.\n\0"
scanformat:
    .ascii "%d %d\0"
resultformat:
    .ascii "The result is %d.\n\0"
.section .text
.equ LOCAL_NUMBER, -8
.equ LOCAL_EXPONENT, -16
main:
# Allocate space for two local variables
enter $16, $0
# Show the prompt to stdout
movq stdout, %rdi
movq $promptformat, %rsi
movq $0, %rax
call fprintf
# Request the data
movq stdin, %rdi
movq $scanformat, %rsi
leaq LOCAL_NUMBER(%rbp),%rdx
leaq LOCAL_EXPONENT(%rbp), %rcx
movq $0, %rax
call fscanf
movq LOCAL_NUMBER(%rbp), %rdi
movq LOCAL_EXPONENT(%rbp), %rsi
call exponent
movq stdout, %rdi
movq $resultformat, %rsi
movq %rax, %rdx
movq $0, %rax
call fprintf
leave
ret
