.data
new_line: .asciiz "\n"

.text
main:
    li $t0, 0 

loop:
    bge $t0, 10, exit 

    remu $t1, $t0, 2   
    bnez $t1, skip     

    move $a0, $t0     
    li $v0, 1
    syscall

    li $v0, 4       
    la $a0, new_line
    syscall

skip:
    addi $t0, $t0, 1  
    j loop

exit:
    li $v0, 10
    syscall
