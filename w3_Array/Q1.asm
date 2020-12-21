.text
.globl main

main:
  #Create temp register for array
  la $s1, array
  addi $s0, $zero, 0
  add $s0, $s1, $zero
  addi $t2, $zero, 0 #counter
  addi $t3, $zero, 0 #sum register
  
Loop :
  lw $t1, 0($s0)
  addi $s0, $s0, 4
  addi $t2, $t2, 1
  add $t3, $t3, $t1
  beq $t2, 10, Exit
  j Loop
  
Exit :
  li $v0,4 # print_string syscall code = 4
  la $a0, msg1 # load the address of msgsyscall
  syscall
  
  li $v0, 1
  move $a0, $t3
  syscall
  
.data
array: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
msg1: .asciiz "Sum of 10 array's elements is : "
