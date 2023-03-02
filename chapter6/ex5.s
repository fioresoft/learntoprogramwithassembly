#5. Write a new program to search an array for a value. In addition to
#having values in memory like numberofnumbers and mynumbers,
#have another value that is the number you are searching for. Write
#a program to give back 1 if the value is found and 0 if it is not
#found. Test it with several values.
.globl _start
.section .data
numberofnumbers:
    .quad 7
numbers:
    .quad 4,55,66,2,88,1,2
find:
    .quad 2

.section .text
_start:
movq numberofnumbers, %rcx  # its the index and the counter
cmpq $0, %rcx   
je end_loop
movq $0, %rdi
begin_loop:
    movq numbers-8(,%rcx,8), %rax #hold the current value
    cmpq find, %rax
    je continue_loop
    decq %rcx
    cmpq $1, %rcx
    je not_found
    jmp begin_loop
continue_loop:
   movq $1, %rdi
   jmp end_loop
not_found:
    movq $0, %rdi
end_loop:
    movq $60, %rax
    syscall
