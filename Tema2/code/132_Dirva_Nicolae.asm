.data
x: .space 4
d2: .space 4
d: .space 4
n: .space 4
m: .space 4
sir: .space 1000
sir_citit: .space 2000
sol: .space 2000
delim: .asciz " "
formatScanf: .asciz "%300[^\n]"
formatPrintf: .asciz "%d "
newline: .asciz "\n"
.text

valid:
	pushl %ebp
	movl %esp, %ebp
	pushl %ebx
	
	pushl $0
	pushl $0

	movl 8(%ebp), %eax	
	
	xorl %ecx, %ecx
	
	et_for_valid:
		cmp %eax, %ecx
		je et_cont_valid
		
		movl (%edi, %ecx, 4), %edx
		movl (%edi, %eax, 4), %ebx
		cmp %edx, %ebx
		je et_valid
et_cont_for_valid:
		incl %ecx
		jmp et_for_valid
		
et_valid:
	movl -8(%ebp), %edx
	incl %edx
	cmp $3, %edx
	je et_valid_false
	movl %edx, -8(%ebp)
	
	movl %ecx, -12(%ebp)
	
	jmp et_cont_for_valid

et_cont_valid:
	movl -8(%ebp), %eax
	cmp $0, %eax
	je et_valid_true
	
	movl m, %ebx
	movl 8(%ebp), %eax
	subl -12(%ebp), %eax
	cmp %eax, %ebx
	jge et_valid_false
	
	jmp et_valid_true
	
et_valid_true:
	movl $1, %eax
	
	popl %edx
	popl %edx
	
	popl %ebx
	popl %ebp
	ret
	
et_valid_false:
	movl $0, %eax
	
	popl %edx
	popl %edx
	
	popl %ebx
	popl %ebp
	ret		

bkt:
	pushl %ebp
	movl %esp, %ebp
	pushl %ebx
	
	movl 8(%ebp), %eax
	cmp d, %eax
	je et_afisare
	
	movl (%esi, %eax, 4), %ebx
	cmp $0, %ebx
	jne bkt_else
	
	movl $1, %ebx
	
	et_for:
		cmp d2, %ebx
		je et_final
		
		movl 8(%ebp), %eax
		movl %ebx, (%edi, %eax, 4)
		jmp valid_1
		
		valid_1_true:
			
			jmp bkt_1
		cont_for:
			incl %ebx
			jmp et_for
				
	bkt_else:
		movl %ebx, (%edi, %eax, 4)
		jmp valid_2
		
		valid_2_true:
			jmp bkt_2
	
			
	et_final:
		popl %ebx
		popl %ebp
		ret
		
	et_afisare:
		xorl %ecx, %ecx
		
		et_for_afisare:
			cmp %ecx, d
			je et_exit
			
			pushl %ecx
			
			movl (%edi, %ecx, 4), %eax
			
			pushl %eax
			pushl $formatPrintf
			call printf
			popl %edx
			popl %edx
			
			popl %ecx
			incl %ecx
			jmp et_for_afisare
	
	valid_1:
		movl 8(%ebp), %eax
		
		pushl %eax
		call valid
		popl %edx
		
		cmp $1, %eax
		je valid_1_true
		
		jmp cont_for
		
	valid_2:
		movl 8(%ebp), %eax
		
		pushl %eax
		call valid
		popl %edx
		
		cmp $1, %eax
		je valid_2_true
		
		jmp et_final
		
	bkt_1:
		movl 8(%ebp), %eax
		incl %eax
		
		pushl %eax
		call bkt
		popl %edx
		
		jmp cont_for
		
	bkt_2:
		movl 8(%ebp), %eax
		incl %eax
		
		pushl %eax
		call bkt
		popl %edx
		
		jmp et_final				
				

.global main

main:

pushl $sir
pushl $formatScanf
call scanf
popl %ebx
popl %ebx

pushl $delim
pushl $sir
call strtok
popl %ebx
popl %ebx

pushl %eax
call atoi
popl %ebx

movl %eax, n

pushl $delim
pushl $0
call strtok
popl %ebx
popl %ebx

pushl %eax
call atoi
popl %ebx

movl %eax, m

movl n, %eax
movl %eax, d2
incl d2
movl $3, %ebx
xorl %edx, %edx

mull %ebx


movl %eax, d

xorl %ebx, %ebx
xorl %esi, %esi
lea sir_citit, %esi

et_citire:
	cmp %ebx, d
	je cont
	
	pushl $delim
	pushl $0
	call strtok
	popl %ecx
	popl %ecx

	pushl %eax
	call atoi
	popl %ecx
	
	movl %eax, (%esi, %ebx, 4)
	incl %ebx
	jmp et_citire

cont:
	lea sol, %edi
	
	movl $0, %eax
	
	pushl %eax
	call bkt
	popl %edx
	
	movl $-1, %eax
	
	pushl %eax
	pushl $formatPrintf
	call printf
	popl %edx
	popl %edx
	
	
	
et_exit:
		
	pushl $newline
	call printf
	popl %edx
	
	pushl $0
	call fflush
	popl %edx
	
	movl $1, %eax
	xorl %ebx, %ebx
	int $0x80
