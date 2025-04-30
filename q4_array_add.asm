.data
array1: .word 1, 2, 3, 4, 5
array2: .word 10, 20, 30, 40, 50
result: .space 20          
new_line: .asciiz "\n"

.text
main:
    li $t0, 0              

add_loop:
    bge $t0, 5, print_loop 

    la $t1, array1
    la $t2, array2
    la $t3, result

    mul $t4, $t0, 4        

    add $t5, $t1, $t4
    lw $t6, 0($t5)        

    add $t7, $t2, $t4
    lw $t8, 0($t7)       

    add $t9, $t6, $t8     

    add $s0, $t3, $t4
    sw $t9, 0($s0)         

    addi $t0, $t0, 1
    j add_loop

print_loop:
    li $t0, 0             

print_next:
    bge $t0, 5, exit      

    la $t1, result
    mul $t4, $t0, 4
    add $t5, $t1, $t4
    lw $a0, 0($t5)         

    li $v0, 1
    syscall

    li $v0, 4
    la $a0, new_line
    syscall

    addi $t0, $t0, 1
    j print_next

exit:
    li $v0, 10
    syscall
