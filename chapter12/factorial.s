.globl factorial
.section .text
# This is the offset into the stack frame (%rbp) that we store the
# number for which we are taking the factorial.
.equ LOCAL_NUM, -8
factorial:
# We will reserve space for 1 variable - the value we were called with
# (aligned to 16 bytes)
enter $16, $0
# If the argument is 1, then return the result as 1.
# Otherwise, continue on.
cmpq $1, %rdi
jne continue
# Return 1
movq $1, %rax
leave
ret
continue:
# Save the argument into our stack storage
movq %rdi, LOCAL_NUM(%rbp)
# Call factorial with %rdi decreased by one
decq %rdi
call factorial
# The result will be in %rax.  Multiply the result by our
# first argument we stored on the stack
mulq LOCAL_NUM(%rbp)
# Result is in %rax, which is what is needed for the return value
leave
ret
