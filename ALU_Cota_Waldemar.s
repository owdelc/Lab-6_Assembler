/*

Programa ALU en assembly ARM
Universidad Del Valle de Guatemala
Edman Cota, Oscar Waldemar, 15.4.2020

*/

/* 
Calculo aritmetico
*/


.data
.align 2

/*Variables*/
recibido:	.word 0
resultado:	.word 0

/*Mensajes*/
bienvenida:	.asciz "Bienvenido!"
ingresar:	.asciz "Por favor ingrese un numero: "
decimal: 	.asciz "%d"		@@ formato para captura de digito %s srting
formato:	.asciz "La respuesta de todo es: %d\n"

@@ INICIALIZACION
.text
.align 2
.global main
.type main,%function

/*
* CUERPO DEL PROGRAMA
*/
main:

	stmfd sp!, {lr}		@@ Punto de retorno LR = SP
	
	/* MENSAJE DE BIENVENIDA */
	ldr r0,=bienvenida
	bl puts
	
	
	/* INGRESO DE DATO 1 */
	ldr r0, =ingresar
	bl puts
	
	ldr r0,=decimal		@@ direccion memoria formato
	ldr r1,=recibido	@@ direccion memoria del dato
	bl scanf
	
	ldr r4,=recibido
	ldr r4,[r4]
	
	/* INGRESO DATO 2 - ITERADOR */
	ldr r0, =ingresar
	bl puts
	
	ldr r0,=decimal
	ldr r1,=recibido
	bl scanf
	
	ldr r5,=recibido
	ldr r5,[r5]
	
	/* INICIALIZACION DE VALOR ACUMULADOR */
	mov r7,#0
	
	/*
	* LOOP PARA MULTIPLICAR USANDO SUMAS
	*/

	sumar:
		cmp r5:#0
		beq mostrarResultado
		add r7, r4
	
	restar:
		cmp r5:#0
		beq mostrarResultado
		sub r7, r4
		
	multiplicar:
		cmp r5,#0
		beq mostrarResultado	@@ evita loop infnito
		mul r7, r4
		
	
	
	/*IMPRESION DE RESULTADOS*/
	
	mostrarResultado:
		ldr r0,=resultado
		str r7,[r0]
		
		ldr r0,=formato
		mov r1,r7
		bl printf
		
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
		
	/* SALIDA */
	
	mov r0,#0
	mov r3,#0
	ldmfd sp!,{lr}
	bx lr