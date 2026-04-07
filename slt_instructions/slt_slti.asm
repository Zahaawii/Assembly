# Initialize value

 li $t0, 15 # Load immediate value 15 into $t0
 li $t1, 10 # Load lower threshold value (10) into $t1
 li $t2, 20 # Load upper threshold value (20) into $t2
 
 # Check if $t0 < 10 using slti (Set less than immediate)
 slti $t3, $t0, 10 # Set $t3 = 1 if $t0 < 10, otherwise set $t3 = 0
 bne $t3, $zero, too_small # if $t3 != 0 (i.e $t0 < 10) jump to 'too_small'
 
 # Check if $t0 >= 20 using slti (Set less than immediate)
 slti $t3, $t0, 20 # Set t3 = 1 if $t0 < 20, othwersie set $t3 = 0
 bne $t3, $zero, too_large # if $t3 == 0 (i.e $t0 >= 20), jump to 'too_large'
 