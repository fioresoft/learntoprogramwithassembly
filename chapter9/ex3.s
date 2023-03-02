# 3. Write a program that looks through an array of values for a specific
# value and then returns the index of that value.
# ONLY MADE IT TO WORK DIVIDING RDI BY 8 OR USING BYTES

.section .data
mylist:
.byte 1,2,3,4,5,6,7,8,9,0,10

.globl _start
.section .text
_start:
movq $-1, %rcx      # this makes rcx all 1
movq $mylist, %rdi
movb $10, %al
repne scasb

#movq $8, %rbx
#movq $0, %rdx
#movq %rdi, %rax
#divq %rbx
#movq %rax, %rdi

#movq %rcx, %rdi
movq $60, %rax
syscall
