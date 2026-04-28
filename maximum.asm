# maximum.asm program
# CS 64, Z. Matni
#
# Get 3 integer imputs a solute from the user (std.in)
# Reveal the maximum absolute value (entering -3, 2, 1 will give the answer 3)
# See assignment description for details
#Data Area (i.e. memory setup directive)
.data
        # TODO: Complete these incomplete declarations / initializations
        prompt: .asciiz "Enter the next number:\n"
        maxStr: .asciiz "Maximum: "
        newline: .asciiz "\n"

#Text Area (i.e. instructions/code directive)
.text

main:
# TODO: Write your code here!
# Creates prompt -> user assigns first integer ($t0)
    la $a0, prompt
    li $v0, 4
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

# Checks if $t0 is positive -> converts using two's complement
    srl $t4, $t0, 31
    beq $t4, $zero, isPositive_FirstInteger # moves to isPositive_FirstInteger:, creates second integer

    nor $t0, $t0, $zero
    addi $t0, $t0, 1

# Creates prompt -> user assigns second integer ($t1)
    isPositive_FirstInteger: 
    la $a0, prompt
    li $v0, 4
    syscall

    li $v0, 5
    syscall
    move $t1, $v0

# Checks if $t1 is positive -> converts using two's complement
    srl $t4, $t1, 31
    beq $t4, $zero, isPositive_SecondInteger # moves to isPositive_SecondInteger:, creates third integer
    nor $t1, $t1, $zero
    addi $t1, $t1, 1

# Creates prompt -> user assigns third integer ($t2)
    isPositive_SecondInteger:
    la $a0, prompt
    li $v0, 4
    syscall
    li $v0, 5
    syscall
    move $t2, $v0
    srl $t4, $t2, 31
    beq $t4, $zero, isPositive_ThirdInteger
    nor $t2, $t2, $zero
    addi $t2, $t2, 1

    # Checks if $t2 is positive -> converts using two's complement
    isPositive_ThirdInteger:
    slt $t3, $t0, $t1
    beq $t3, $zero, compareFirstSecond
    move $t0, $t1

# compare values 
    compareFirstSecond:
    slt $t3, $t0, $t2
    beq $t3, $zero, compareSecondThird
    move $t0, $t2

    compareSecondThird:
    la $a0, maxStr
    li $v0, 4
    syscall

    move $a0, $t0
    li $v0, 1
    syscall
exit:
        # TODO: Write code to properly exit a SPIM simulation
    li $v0, 10
    syscall