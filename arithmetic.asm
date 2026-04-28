# arithmetic.asm program
# CS 64, Z. Matni
# 1. Prompt the user for 3 inputs: a, b, c
# 2. Calculate 64 * (a - 4*b) + 9*c using only one mult instruction
# 3. Print out the result

.text 
main:
    # TODO: Write your code here!
    li $v0, 5 # assign a
    syscall
    move $t0, $v0

    li $v0, 5   # assign b
    syscall
    move $t1, $v0

    li $v0, 5   # assign c
    syscall
    move $t2, $v0

    sll $t1, $t1, 2 # multiply b by two by shifting left by 2
    sub $t3, $t0, $t1 # subtract (a-4b) and stores in result ($t3)

    li $t4, 9 # creates constant 9 and stores in $t4
    mult $t2, $t4 # multiplies $t4 and $t2 (9 * c) and stores in result ($t3)
    mflo $t5

    sll $t3, $t3, 6
    
    add $t3, $t3, $t5

    move $a0, $t3
    li $v0, 1
    syscall

exit:
    # Exit SPIM: Write your code
    li $v0, 10
    syscall