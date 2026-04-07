# Exercise to use switch statements	
	.data
msg_case_1: 	.asciiz "Case 1 selected\n"
msg_case_2: 	.asciiz "Case 2 selected\n"
msg_case_3: 	.asciiz "Case 3 selected\n"
msg_default: 	.asciiz "Default case selected\n"

	.text
	.globl main

main:
 li $t0, 2 # Load the switch value (Expression to evaluate)
 li $t1, 1 # Case 1 value
 li $t2, 2 # Case 2 value
 li $t3, 3 # Case 3 value 
 
 
 # Compare value 5$0 with $t1, $t2, and $t3 using beq (Branch if equal)

 beq $t0, $t1, case_1 # In code: if $t0 == $t1 (1), jump to case_1 (function)
 beq $t0, $t2, case_2 # In code: If $t0 == $t2 (2), jump to case_2 (function)
 beq $t0, $t3, case_3 # In code: If $t0 == $t3 (3), jump to case_3 (function)
 j default_case       # If there is no match, jump to default_case
 
 
 # "functions" in code or instructions in mips
 
 case_1:
   li $v0, 4 # Load syscall for printing string (Java: System.out.printlin()"
   la $a0, msg_case_1 # Load address of "Case 1 selected" message
   syscall
   j end_program #  Jump to the end of the application when steps has been executed
   
   
 case_2:
 li $v0, 4 # Load syscall for printing string (Java: System.out.printlin()"
 la $a0, msg_case_2 # Load address of "Case 2 selected" message
 syscall
 j end_program #  Jump to the end of the application when steps has been executed
 
 case_3:
 li $v0, 4 # Load syscall for printing string (Java: System.out.printlin()"
 la $a0, msg_case_3 # Load address of "Case 2 selected" message
 syscall
 j end_program # Jump to the end of the application when steps has been executed
 
 default_case:
 li $v0, 4
 la $a0, msg_default
 syscall 
 j end_program
 
 
 end_program:
  li $v0, 10 # Exit syscall
  syscall