

@@INICIALIZACION

.text
.align 2
.global.main
.type main,%function 

main:
	
	stmfd sp!, {lr}
	
	ldr r0,=digito1
	ldr r1,[r0]
	
	ldr	r0,=digito2
	ldr r2,[r0]
	
	add r4,r1,r2
	
	ldr r5,=producto 
	str r3,[r5]
	
	ldr r5,=formato
	mov r1,r5
	bl printf
	
	mov r0,#0
	mov r1,#0
	mov r2,#0
	mov r3,#0
	
	ldmfd ap!, {lr}
	bx lr
	
	
.data
.align 2
formato:
	.asciz "El resultado de la suma es: %d\n"
