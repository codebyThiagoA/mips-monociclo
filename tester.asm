.text
.globl main
main:
    # addi $s0, $zero, 10
    addi $s0, $zero, 10
    li $v0, 1
    move $a0, $s0
    syscall
    li $v0, 4
    la $a0, newline
    syscall

    # addi $s1, $zero, 20
    addi $s1, $zero, 20
    li $v0, 1
    move $a0, $s1
    syscall
    li $v0, 4
    la $a0, newline
    syscall

    # add $t0, $s0, $s1
    add $t0, $s0, $s1
    li $v0, 1
    move $a0, $t0
    syscall
    li $v0, 4
    la $a0, newline
    syscall

    # sw $t0, 0($s0)
    sw $t0, 0($s0)

    # lw $t1, 0($s0)
    lw $t1, 0($s0)
    li $v0, 1
    move $a0, $t1
    syscall
    li $v0, 4
    la $a0, newline
    syscall

    # Terminar
    li $v0, 10
    syscall

.data
newline: .asciiz "\n"


