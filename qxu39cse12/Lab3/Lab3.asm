.data
	userInput: .asciiz "Enter the height of the pattern (must be greater than 0):\n"
	newLine: .asciiz "\n"
	space: .asciiz "\t"
	sign: .asciiz "*"
	invalidMsg: .asciiz "Invalid Entry!\n"
	
.text
	
	li $t0,1 
	li $s0,1 
	li $v0,4
	la $a0,userInput # ask for userinput
	syscall
	
	li $v0,5 # gets the userinput
	syscall

	move $t1,$v0 # store the value $t1 
	while: sle $s1,$t1,$0 # while loop if user input > 0
	beq $s1,$0,startloop # if height is greater than 0 start the loop 
	li $v0,4
	la $a0,invalidMsg
	syscall

	li $v0,4
	la $a0,userInput
	syscall

	li $v0,5
	syscall

	move $t1,$v0
	j while
startloop: sle $s2,$t0,$t1 # this loop execute when $t0 value is <= to the height
	beq $s2,$zero, exit # exit
	li $v0,1
	move $a0,$t0 # prints the number in triangle
	syscall

secondloop: slt $s3,$s0,$t0 # this loop execute when $s0 value is < $t0
	beq $s3,$zero,continue # continue 
	li $v0,4
	la $a0,space # prints the space between the sign and numbers
	syscall

	li $v0,4
	la $a0,sign # prints * sign
	syscall

	addi $s0,$s0,1 # increment value of $s0 + 1
	j secondloop
	continue: li $v0,4
	la $a0,newLine # it prints new line
	syscall

	addi $t0,$t0,1 # increment $t0 value + 1
	li $s0,1 
	j startloop
	exit: li $v0,10 # exit 
	syscall
