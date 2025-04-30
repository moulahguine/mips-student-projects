.data
message_one: .asciiz " is greater than "
message_two: .asciiz " is greater than or equal to "
new_line: .asciiz "\n"

.text
main:

    li $v0,5
    syscall
    move $s0,$v0

    li $v0,5
    syscall
    move $s1,$v0

    bgt $s0,$s1, greater

    move $a0,$s1
    li $v0,1
    syscall

    li $v0,4
    la $a0,message_two
    syscall

    move $a0,$s0
    li $v0,1
    syscall

    la $a0,new_line
    li $v0,4
    syscall

    addi $s1,$s1,-2
    j done

greater:

    move $a0,$s0
    li $v0,1
    syscall

    la $a0,message_one
    li $v0,4
    syscall

    move $a0,$s1
    li $v0,1
    syscall

    la $a0,new_line
    li $v0,4
    syscall

    addi $s0,$s0,2

done:
    li $v0,10
    syscall
