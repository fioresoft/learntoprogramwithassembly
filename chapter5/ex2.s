#2. Create a program that just loops a certain number of times and
#then exits. Approximately how many times does it have to loop
#before it takes a full second to run? This number will be very large.
#Can you estimate how many instructions the CPU executed in that
#time period?

.section .text
.globl _start
_start:
movq $9999999999, %rcx # 9 billhoes, 999 milhoes, ...
begin_loop:
    decq %rcx
    cmpq $0, %rcx
    je end_loop
    jmp begin_loop
end_loop:
    movq %rcx, %rdi
    movq $60, %rax
    syscall
