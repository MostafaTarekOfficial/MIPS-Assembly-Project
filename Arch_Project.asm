.data
	name: .asciiz "Mostafa Tarek Khalil"
	section: .word 24
	sec: .asciiz "Section"
    	colon: .asciiz " : "
    	
    	num1: .asciiz "Enter The First Number : "
    	num2: .asciiz "Enter The Second Number : "
    	num3: .asciiz "Enter The Third Number : "
    	num4: .asciiz "Enter 1 if you want sum or 2 if you want sub: "
    	res1: .asciiz "sum (N1+N2+N3) = "
    	res2: .asciiz "sub (N1-N2-N3) = "
.text
	
	la $t0, name
	#First_Name_Char
	lb $a0, 0($t0)
	li $v0, 11
	syscall
	
	la $a0, colon
	li $v0, 4
	syscall 
	
	lb $a0, 0($t0)
    	li $v0, 1
    	syscall
    	
    	li $a0, 10 
    	li $v0, 11
    	syscall
	
	#second_Name_Char
	lb $a0, 8($t0)
	li $v0, 11
	syscall
	
	la $a0, colon
	li $v0, 4
	syscall 
	
	lb $a0, 8($t0)
    	li $v0, 1
    	syscall
    	
    	li $a0, 10 
    	li $v0, 11
    	syscall
	
	#last_Name_Char
	lb $a0, 14($t0)
	li $v0, 11
	syscall
	
	la $a0, colon
	li $v0, 4
	syscall 
	
	lb $a0, 14($t0)
    	li $v0, 1
    	syscall
    	
    	li $a0, 10 
    	li $v0, 11
    	syscall
    	
    	#print_Section_Number
    	la $a0, sec
    	li $v0, 4
    	syscall
    	
    	la $a0, colon
    	li $v0, 4
    	syscall
    	
    	lw $t0, section
    	move $a0, $t0
    	li $v0, 1
    	syscall
    	
    	li $a0, 10
    	li $v0, 11
    	syscall
    	
    	#Read_First_Number
    	la $a0, num1
    	li $v0, 4
    	syscall
    	li $v0, 5
    	syscall
    	move $t1, $v0
    	
    	#Read_second_Number
    	la $a0, num2
    	li $v0, 4
    	syscall
    	li $v0, 5
    	syscall
    	move $t2, $v0
    	
    	#Read_Third_Number
    	la $a0, num3
    	li $v0, 4
    	syscall
    	li $v0, 5
    	syscall
    	move $t3, $v0
    	
    	#read operation
    	la $a0,num4
    	li $v0,4
    	syscall
    	li $v0,5
    	syscall
    	move $s0,$v0
    	addi $s2,$0,1
    	addi $s3,$0,2
    	
    	beq $s0,$s2,sum1
    	beq $s0,$s3,sub1
    	#res1 num1+num2+num3
    	sum1:
    	add $t4,$t1,$t2 	#t4=num1+num2
    	add $t5,$t4,$t3 	#t5=t4+num3
    	
    	la $a0, res1
    	li $v0, 4
    	syscall
    	
    	move $a0, $t5
    	li $v0, 1
    	syscall
    	
    	li $a0, 10
    	li $v0, 11
    	syscall
    	
    	j end
    	#res2 num1-num2-num3
    	sub1:
    	sub $t6,$t1,$t2
    	sub $t7,$t6,$t3
    	
    	la $a0, res2
    	li $v0, 4
    	syscall
    	
    	move $a0, $t7
    	li $v0, 1
    	syscall
    	
    	li $a0, 10
    	li $v0, 11
    	syscall
    	end:
    	li $v0, 10
    	syscall
