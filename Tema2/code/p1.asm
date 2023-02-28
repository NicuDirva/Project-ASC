.data
nr: .long 0
x: .space 4
formatScanf: .asciz "%d"
formatPrintf: .asciz "%d\n"
.text
f:
	pushl %ebp
	movl %esp, %ebp
	pushl %ebx
	
	movl 8(%ebp), %ecx
	cmp $1, %ecx
	je et_exit
	
	xorl %edx, %edx
	movl 8(%ebp), %eax
	movl $2, %ebx
	divl %ebx
	cmp $0, %edx
	je et_par
	jmp et_impar
	
	et_par:
		incl nr
		
		pushl %eax
		call f
		popl %ebx
		
		jmp sfarsit
		
	et_impar:
		incl nr
			
		movl 8(%ebp), %eax
		xorl %edx, %edx
		movl $3, %ebx
		mull %ebx
		add $1, %eax
		
		pushl %eax
		call f
		popl %ebx
		
		jmp sfarsit
	sfarsit:
		movl nr, %eax
		popl %ebx
		popl %ebp
		ret

.global main
main:

pushl $x
pushl $formatScanf
call scanf
popl %ebx
popl %ebx

movl x, %eax

pushl %eax
call f
popl %ebx


et_exit:
movl nr, %eax

pushl %eax
pushl $formatPrintf
call printf
popl %ebx
popl %ebx

movl $1, %eax
xorl %ebx, %ebx
int $0x80




