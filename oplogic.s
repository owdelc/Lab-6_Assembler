
@@ INICIALIZAZION 
.text 
.align 2
.global main 
.type main,%function

main: 
	
	stmfd sp!, {lr}
	
	ldr r0, =valor1
	ldr r1, [r0]
	
	ldr r0, =valor2
	ldr r2, [r0]
	
	/* 
	*operador logico and
	*/
	
	and r5,r1,r2  @@ r5 <- r1 and r2
	
	ldr r0, =resultado
	str r3,[r0]
	bl printf 
	
	
	/*
	*operacion not a travez de movimiento de datos
	*/
	
	MVN r6,r1	@@ r6 <- not r1
	MVN r7,r2	@@ r7 <- not r2
	
	
	/*
	* Shift de un bit a la derecha 
	*/
	
	LSR r1,r1,#1  @@se realiza el shift de bit y se reubica en el mismo lugar
	LSR r2,r2,#1  @@se realiza el shift de bit y se reubica en el mismo lugar
	
	