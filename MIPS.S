.data
buffer: .space 9 #allocates space for characters
new_line: .asciiz "\n" #used to separate 8 characters from extra ones
.text
  main:
      li $v0, 8 #receives input
      la $a0, buffer #loads buffer into address
      li $a1, 9 # allocates buffer space for string
      la $t2, buffer #stores string address into register
      syscall

      la $a0, new_line # loads newline
      li $v0, 4 #prints new line for string
      syscall

      add $t3, $0, $0 #initializes $t3 to zero (counter)

  find_length:

      lb $t1,0($t2) #loads first index of string
      beq $t1,0, Exit #checks for null, then exits
      beq $t1,10, Exit #looks for new line character, then exits
      addi $t3, $t3, 1 #counter increments
      addi $t2, $t2, 1 #points to next character in string
      j find_length #jumps to continues loop

  Exit:
      addi $a0, $t3, 0 #stores $t3 in $a0
      li $v0, 1 #prints signed integer
      syscall

      li $v0,10 #ends program
      syscall
