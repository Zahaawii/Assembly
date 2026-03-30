# Index pages:


1. Course 1: Orientation
2. Course 2: Add / Subtract registers
3. Course 3: Language of computer
4. Course 4:
5. Course 5:
6.
7.
8.
9.
10.

# Course 1 

By the end of this course I should be able to answer:

- How are programs written in a high-level languages translated into machine language for execution by hardware? How does the hardware execute the resulting program?

- What is the interface between software and hardware? How does software instruct the hardware to perform necessary functions?

- What factors determine the performance of a program? How can a programmer optimize program performance?


# Course 2: Add / Subtract registers

You always determine the variable first and then add/sub the values in it.

#### Open MIPS application: 

Option B: DOS shell using jar file. Save the jar file in some folder. Open a DOS shell in that folder. Rename the jar file to "Mars.jar" for convenience. Run MARS with the DOS command  java -jar Mars.jar

| instruction | Mips | Code | registers | comments |
| -----| --- | ---| ----------- | -- |
| add | add | a = b + c | add $t0, $s0, $s1| adding numbers
| subtract | sub | a = b - c | sub $t0, $s0, $s1 | removing numbers 
| add immediate | addi | for(int i = 0; i < 3; i++) | addi $s1, $s2, 1 | can be used to iterate through numbers or always add a value to the nubmer

#### Registers meaning
![registers](../screenshots/registers.png)

#### Arithmetic instructions
![instructions](../screenshots/instructions.png)


# Course 3: Language of the Computer
  
lw (load word) = load word from the memory

add = add value

sw (store word) = store the word in the memory

examples:

`C code: A[12] = h + A[8]`
`lw $t0, 32($s3)`
`add $t0, $s2, $t0`
`sw $t0, 48($s3)`

Step 1: The C code
Step 2: Load the word (value) from 32($s3) in memory into temporary variable $t0. 8 * 4 gives 32, thats why it has the naming 32 naming
Step 3: add variable $s2 and $t0 into the temporary variable $t0. Always place the value you want data to first.
Step 3: sw (store the word) temporary variable into the memory 48($s3). Reason for 48 is because A[12] and the array is 4 bits long 4*12 = 48


## Logical operations in MIPS (Assembly)
##### Shifts (bitwise)

| Logical operations | C   | Java | MIPS |
| ------------------ | --- | ---- | ---- |
| Shift left         | <<  | <<   | sll  |
| Shift right        | >>  | >>>  | srl  |
#### AND/OR (bitwise)

| Logical operations | C   | Java | MIPS      |
| ------------------ | --- | ---- | --------- |
| Bit-by-bit AND     | &   | &    | and, andi |
| Bit-by-bit OR      | \|  | \|   | or, ori   |
| Bit-by-bit NOT     | ~   | ~    | nor       |

### IF statement in MIPS
![[Screenshot 2026-03-30 at 15.49.30.heic]]
bne = Branch not equal - in C/Java = if x != y
beq = Branch equal - In C/Java = if x == y


	`bne $s3, $s4, Else # Go to else if i ≠ j`
	`add $s0, $s1, $s2 # f = g + h (skipped if i ≠ j)`
`j Exit # Go to Exit (j means jump)`
`Else: # Here is the label Else (A label that defines where the process can go)`
	`sub $s0, $s1, $s2 # f = g - h (skipped if i = j)`
`Exit: # Here is the label exit`


### While loop in MIPS

`In C/Java = while(save[i]== k){ i += 1}`

`Loop: # label for the while loop`
`sll $t1, $s3, 2 # temp reg $t1 = 1 * 4 (for the index in bytes)`
`add $t1, $t1, $s6 # $t1 = address of save[i]`
`lw $t0, 0($t1) # temp reg $t0 = save[i]`
`bne $t0, $s5, Exit # go to Exit if save[i] ≠ k`
`addi $s3, $s3, 1 # increment i with 1 (i = i + 1)`
`j Loop # Go to loop` 
`Exit: # Here is the label Exit that will be executed if BNE is false`

### For loop in MIPS

`in C/java = for(int i = 0; i < 4; i++) {code do something here}`

`add $t0, $zero, $zero # i is initialized to 0, $t0 = 0`
`Loop:`
`slti $t1, $t0, 4 # $t1 = 0 if i >= 4`
`beq $t1, $zero, Exit	# Go to Exit if $t1 = 0`
`-add code to do soemthing here-` 
`addi $t0, $t0, 1 # increment with 1 (i++)`
`j loop # Go back to the beginning of the loop.`
`Exit:`

Instructions in plain text:
- for(int i = 0; i < 4; i++) {do something} (i < 4 is the focus here)
	- How can we handle the condition i < 4
	- The line below shows how we can determine if a variable is less than another
- Set less than: `slt reg1, reg2, reg3 # reg1 = 1 if reg2 < reg3`
	- It compares two registers (reg2 and reg3), and sets a register (reg1) to 1 if reg2 < reg3
- Set less than immediate: slti reg1, reg2, const # reg1 = 1 if reg2 < const
	- Immediate version of slt
	- It compares reg2 and constant, and sets a register (reg1) to 1 if reg2 < constant
- for (int i = 0, i < 4; i++) {do something} (int i = 0 is the focus here)
	- How can we initialize the variable i to 0
	- MIPS $zero command holds value 0 
	- add $s0, $zero, $zero # $s0 will hold value of 0
