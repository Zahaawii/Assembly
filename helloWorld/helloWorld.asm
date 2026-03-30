# text segment

	.text

main: 
	# The main program goes here
	
	la $a0, hello_string
	jal Print_string
	
	
# Data segment

	.data
hello_string:
	.asciiz "Hello world\n"
	
	
# Text segment
	.text

Print_integer: # Print the integer register a0
	li $v0, 1
	syscall
	jr $ra
	
Print_string: # Print the string whose starting adress is in the register a0
	li $v0, 4
	syscall
	jr $ra
	
Exit:	#E End the program
	li $v0, 10
	syscall
	jr $ra
