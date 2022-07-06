1 )

.arm
.data
sum: .word
n1:  .word 0x00000112
n2:  .word 0x00000223

.text

.global main

main :
ldr r1,=n1  @r1 = address of n1
ldr r2,=n2  @r2 = address of n2
ldr r3,[r1] @contains n1
ldr r4,[r2] @contains n2
add r5,r3,r4  
ldr r6,=sum @r6=contains address of sum
str r5,[r6] @value of r6=r5


____________________________________________________________________________













2 ) 

@ Adding evaluate a= (b+c) - (d+e)

	.arm		
	.data
	 a: 	.word 
	 b:	.word 0x0000000A
	 c:	.word 0x00000016
      d:	.word 0x0000001E
      e:	.word 0x00000028

	.text
	.global main     @ 'main' function is mandatory.

	main:
	 ldr r1, =a
	 ldr r2, =b
      ldr r3, =c
      ldr r4, =d
      ldr r5, =e
       @ ldr r6,[r1]        @ r6=a
      ldr r7,[r2]        @r7 =b
      ldr r8,[r3]        @r8 =c
      ldr r9,[r4]        @r9 =d
      ldr r10,[r5]       @r10 =e
      add r11,r7,r8
      add r12,r9,r10
      sub r13,r11,r12
      str r13,[r1]


____________________________________________________________________________






3 )    with negative values

@ Adding evaluate a= (b+c) - (d+e)

	.arm		
	.data
	 a: 	.word 
	 b:	.word 0xfffffff6    @ -10  equlaent
	 c:	.word 0x00000014
      d:	.word 0x0000001E
      e:	.word 0xfffffffd8                    @ -40 equalent 

	.text
	.global main     @ 'main' function is mandatory.

	main:
	 ldr r1, =a
	 ldr r2, =b
      ldrsh r3, =c
      ldrsh r4, =d
      ldrsh r5, =e
       @ ldr r6,[r1]        @ r6=a
      ldrsh r7,[r2]        @r7 =b
      ldrsh r8,[r3]        @r8 =c
      ldrsh r9,[r4]        @r9 =d
      ldrsh r10,[r5]       @r10 =e
      add r11,r7,r8
      add r12,r9,r10
      sub r13,r11,r12
      strsh r13,[r1]


____________________________________________________________________________












4 )  mul array and take sum 

@multiply  elemnts of 2 array

	.arm

	.data
	 array1:	.word 1,2,3,4,5 
      array2:	.word 6,7,8,9,10 
 
	prod:		.word 

	.text
	.global main     @ 'main' function is mandatory.

	main:
        	mov r0, #5        	@ Set loop counter to 0
	mov r1, #0         	@ Set initial sum value to 0;  
	ldr r2, =array1
      ldr r5, =array2         @ r5 = &array2
  	
	.Lloop: 
	ldr r3, [r2], #4  	@ r3 = *r2; r2=r2+4 
      ldr  r6, [r5], #4
      mul r8,r3,r6
      add r1,r1,r8     	  
        	subs r0, r0, #1    	@ Decrement loop counter
        	bne .Lloop         	@ Branch back if the loop counter i!=0 
	ldr r0, =prod       	 @ r0 = &sum; Reuse register r0
        	str r1, [r0]       	@ *r0 = r1 (sum = r1) 


____________________________________________________________________________




       



