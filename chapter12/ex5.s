#5. The code to scan a single character is %c, which takes a pointer
#to a single byte (though you can also send it a pointer to a larger
#value than this if it is easier). Modify the program to ask the user to
#type Y to keep going.

# I didn't manage to make it :-(

.globl main
.section .data
question:
    .asciz "enter a number to call factorial\n"
input:
    .asciz "%d"
result:
    .asciz "the result is %d\n"
saida:
    .asciz "Enter Y to quit\n"
input2:
    .asciz "%c"

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
    # reads the response
    movq stdin, %rdi
    movq $input2, %rsi
    leaw -2(%rbp), %dx
    call fscanf
    movw -2(%rbp), %r9w
    cmpb $'Y', %r9b
    jne begin_loop

end_loop:
    leave
    ret
