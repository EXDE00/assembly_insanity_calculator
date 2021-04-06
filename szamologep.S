.intel_syntax noprefix

.section .data
hex_printer:
	.asciz "0x%x\n"
integer_printer:
	.asciz "%d\n"
new_line_epic:
	.asciz "\n"
sum_run:
	.asciz "Sum run\n"
sub_run:
	.asciz "Subers run\n"
right_run:
	.asciz "right run\n"
left_run:
	.asciz "left run\n"
bad_input_text:
	.asciz "bad input\n"


.section .text
.global calculator
calculator:	
	#int calculator(int lhs, int rhs, char op[]);
	#fuggveny prologus: start
	push ebp
	mov ebp, esp
	#fuggveny prologus: kill
	
	push ebx
	#cdecl konvecnio| ebx mentese
	# 1. argumentum: [ebp + 4*2] => lhs
	# 2. argumentum: [ebp + 4*3] => rhs
	# 3. argumentum: [ebp + 4*4] => op[]
	
	#"valtozok"	

	mov eax, [ebp + 4*4] #should be op[]

	#print that shit
	mov dword ptr [eax], edx
	push edx
	push offset hex_printer
	#push offset new_line_epic
	call printf
	push offset new_line_epic
	call printf
	pop edx
	pop eax	

	cmp byte ptr [eax], 0x0000002B
	je sum
	cmp eax, 0x0000002D
	je sub
	cmp eax, 0x00003C3C
	je roll_left
	cmp eax, 0x00003E3E
	je roll_right
	jne bad_input 

	
	#print that shit
	push eax
	#push offset new_line_epic
	call printf
	push offset new_line_epic
	call printf
	pop eax	
		

	#fuggveny epilogus: start
	mov esp, ebp
	pop ebp
	#fuggveny epilogus: kill
	ret

sum:			
	push offset sum_run
	call printf
	
	mov esp, ebp
	pop ebp
	ret
sub:
	push offset sub_run
	call printf

	mov esp, ebp
	pop ebp
	ret
roll_left:
	push offset left_run
	call printf
	pop ebx
	mov eax, -1

	mov esp, ebp
	pop ebp
	ret
roll_right:
	push offset right_run
	call printf
	pop ebx
	mov eax, -1

	mov esp, ebp
	pop ebp
	ret
bad_input:
	push offset bad_input_text
	call printf
	/*pop ebx
	mov eax, -1
	*/
	xor eax, eax
	mov eax, -1

	mov esp, ebp
	pop ebp	
	ret 
	


	/*	#get data out of register
	#compare if it's + - << or >> 
	#jump according to str
	#if none true just call some alt ending 
	#if all good return the goodies */
	
