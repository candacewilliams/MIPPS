.data
buffer: .space 9 #allocates space for characters
new_line: .asciiz "\n" #used to separate 8 characters from extra ones
.text
  main:
      li $v0, 8 #receives input
      la $a0, buffer #loads buffer into address
      li $a1, 9 # allocates buffer space for string
      syscall

      la $a0, new_line # loads newline
      li $v0, 4 #prints new line
      syscall

      li $v0,10 #ends program
      syscall
