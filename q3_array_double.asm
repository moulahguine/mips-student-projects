.data
numbers: .word 1, 2, 3, 4, 5
new_line: .asciiz "\n"

.text
main:
    li $t0, 0        

loop:
    bge $t0, 5, exit  

    la $t1, numbers       
    mul $t2, $t0, 4   
    add $t3, $t1, $t2
    lw $t4, 0($t3)    

    li $t5, 2
    mul $t6, $t4, $t5 

    move $a0, $t6
    li $v0, 1
    syscall

    li $v0, 4
    la $a0, new_line
    syscall

    addi $t0, $t0, 1  
    j loop

exit:
    li $v0, 10
    syscall
