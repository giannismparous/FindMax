#OMADIKH ERGASIA
#IWANNHS MPAROUS 3190131
#DHMHTRHS MHLIOS 3190120

#$t0<-kataxwrhths tou counter
#$t2<-kataxwrhths vashs toy A
#t3<-kataxwrhths tou b1
#t4<-kataxwrhths tou b2
# $s0 <- h dieythinsh A
# $s1 <- to K
# $s2 <- to P
# $s3 <- to maxA
# $s4 <- h dieythinsh tou keliou tou pinaka A pou elegxetai sthn max analogws to K kathe fora
#t5 <- 4 apla gia na kanoume pollaplasiasmo
#t6 gia thn ektypwsh tou max sto telos

.text
.globl main

main:

	la $a0,str1 #fortwsh mhnymatos "Read array A:" apthn mnhmh ston $a0
	li $v0,4
	syscall #ektypwsh toy mhnymatos
	li $t0,1 # fortwsh $t0 me thn timh 1
	la $t2,A #fortwsh $t2 me thn dieythinsh tou pinaka A apthn mnhmh (o opoios einai kenos)

for1: 

	bgt $t0,5,exit_for1 # an counter>5 phgaine sto label exit_for1
	li $v0,5
	syscall #diavase akeraio
	sw $v0,($t2)#topothethse ton akeraio sth prwth thesh tou A
	addi $t2,$t2,4#ayxhse ton $t2 kata 4, dhladh ayxhse to index tou pinaka kata 1
	addi $t0,$t0,1#ayxhse ton $t0, dhladh ton counter kata 1
	j for1 #phgaine sto label for1
	
exit_for1:

	la $a0,str2 #fortwsh mhnymatos "Read b1:" apthn mnhmh ston $a0
	li $v0,4
	syscall #ektypwsh toy mhnymatos
	li $v0,5 #diavase ton akeraio b1
	syscall
	move $t3,$v0 # antigrafh tou b1 ston $t3
	la $a0,str3 #fortwsh mhnymatos "Read b1:" apthn mnhmh ston $a0
	li $v0,4
	syscall #ektypwsh toy mhnymatos
	li $v0,5
	syscall
	move $t4,$v0 # antigrafh tou b1 ston $t3
	# --------------------- elegxos oriwn ----------------------
	blt $t3,1,error #an b1<1 phgaine sto label error
	bgt $t3,5,error #an b1>5 phgaine sto label error
	blt $t4,1,error #an b2<1 phgaine sto label error
	bgt $t4,5,error #an b2>5 phgaine sto label error
	bgt $t3,$t4,error #an b1>b2 phgaine sto label error
	#-----------------------------------------------------------
	la $a0,A #fortwsh ston $a0 th dieythinsh tou A ws prwto orisma synarthshs
	move $a1,$t3 #fortwsh ston $a1 to b1 ws deytero orisma synarthshs
	move $a2,$t4 #fortwsh ston $a2 to b2 ws trito orisma synarthshs
	jal max #kalese th synartarthsh max poy dexetai ta 3 parapanw orismata
	move $t6,$v0 #metakinhse to apotelesma ths synarthshs ston kataxwrhth $t6
	# --------------------- ektypwsh apotelesmatwn -----------------------
	la $a0,str4 #fortwsh toy mhnymatos "Max is:" ston $a0
	li $v0,4
	syscall #ektypwsh mhnymatos
	move $a0,$t6 #antigrafh tou apotelesmatos ths synarthsh ston $a0 gia ektypwsh 
	li $v0,1
	syscall #ektypwsh tou apotelesmatos ths synarthshs
	j exit #phgaine sto label exit
	#---------------------------------------------------------------------
	
error: 

	la $a0,str5 #fortwsh toy mhnymatos "Max is:" apthn mnhmh ston $a0
	li $v0,4
	syscall #ektypwsh mhnymatos
	
exit:

	li $v0,10
	syscall #termatismos programmatos
	
# --------------------- ypoprogramma max ----------------------

max: 

	add $sp,$sp,-4 #meiwsh tou stack pointer kata 4, dhladh kata enan akeraio
	sw $ra,0($sp) #apothikeysh ths dieythinshs epistrofhs afou ektelestei h synarthsh max ston stack, dhladh push tou $ra
	move $s0,$a0 #antigrafh ths dieythinshs tou A apton $a0 ston $s0
	move $s1,$a1 #antigrafh tou b1 apton $a1 ston $s1, dhladh ginetai K=b1
	move $s2,$a2 #antigrafh tou b2 apton $a2 ston $s2, dhladh ginetai P=b2
	move $s4,$s1 #antigrafh tou K apton $s1 ston $s4
	addi $s4,$s4,-1 #meiwsh tou $s4 kata 1
	li $t5,4 #fortwsh ths timhs 4 ston $t5 gia pollaplasiasmo
	mul $s4,$s4,$t5 #fortwsh ston $s4 to apotelesma tou pollaplasiasmou toy $s4 me to 4 ( dhladh (K-1)*4)
	add $s4,$s4,$s0 #fortwsh ston $s4 to apotelesma ths prostheshs toy $s4 me th dieythinsh tou A, dhladh me ton $s0 (dhladh (K-1)*4+A)
	lw $s3,($s4) #fortwsh tou periexomenou toy pinaka A sto index pou vrisketai analogws tou K ( dhladh sto index $s4)
	
for2: 

	addi $s1,$s1,1 #ayxhsh tou $s1, dhladh tou K kata 1
	bgt $s1,$s2,exit_for2 #an $s1>$s2, dhladh K>P phgaine sto label exit_for2
	move $s4,$s1 #antigrafh tou K apton $s1 ston $s4
	addi $s4,$s4,-1 #meiwsh tou $s4 kata 1
	mul $s4,$s4,$t5 #fortwsh ston $s4 to apotelesma tou pollaplasiasmou toy $s4 me to 4 ( dhladh (K-1)*4)
	add $s4,$s4,$s0 #fortwsh ston $s4 to apotelesma ths prostheshs toy $s4 me th dieythinsh tou A, dhladh me ton $s0 (dhladh (K-1)*4+A)
	move $a0,$s3 #metakinhsh tou maxA apton $s3 ston $a0 ws prwto orisma synarthshs
	lw $a1,($s4) #fortwsh tou periexomenou toy pinaka A sto index pou vrisketai analogws tou K ( dhladh sto index $s4) ws deytero orisma synarthshs
	jal greater #kalese th synartarthsh great poy dexetai ta 2 parapanw orismata
	move $s3,$v0 #metakinhsh tou apotelesmatos ths synarthshs ston $s3, dhladh ston maxA
	j for2 #phgaine sto label for2
	
exit_for2: 

	lw $ra,0($sp) #$epestrepse ston $ra thn swsth dieythinsh pou eixame apothikeusei sto stack, dhladh pop to ($ra)
	add $sp,$sp,4 #ayxhse to stack pointer kata 4, dhladh kata 1 akeraio 
	move $v0,$s3 #epistrefomenh timh einai to $s3
	jr $ra #phgaine sthn dieythinsh pou periexei o $ra, dhladh epestrepse ekei pou prepei

# --------------------- ypoprogramma greater ----------------------

greater:

	blt $a0,$a1,y #an $a0<$a1 phgaine sto label y
	j x #phgaine sto label x
	y:
		move $v0,$a1 #epistrefomenh timh einai to $a1
		j exit_greater #phgaine sto label exit_greater
	x:
		move $v0,$a0 #epistrefomenh timh einai to $a0
		
exit_greater: 

	jr $ra #phgaine sthn dieythinsh pou periexei o $ra, dhladh epestrepse ekei pou prepei


# -------------------------------------------------------------

.data

A: .space 20 #kenos pinakas 20 bytes, dhladh 5 akeraiwn
b1: .space 4 #akeraios pou den exei lavei timh
b2: .space 4 #akeraios pou den exei lavei timh
str1:		.asciiz "Read array A:"
str2:		.asciiz "Read b1:"
str3:		.asciiz "Read b2:"
str4:		.asciiz "Max is:"
str5:		.asciiz "Invalid input. Exiting..."