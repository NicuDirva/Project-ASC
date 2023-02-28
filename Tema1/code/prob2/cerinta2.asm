.data
formatScanf: .asciz "%300[^\n]"
formatPrintf: .asciz "%d\n"
sir: .space 400
delim: .asciz " "
res: .space 4
.text
.global main
main:

pushl $sir
pushl $formatScanf
call scanf
popl %ebx
popl %ebx

xor %eax, %eax

pushl $delim
pushl $sir
call strtok
popl %ebx
popl %ebx

movl %eax, res
pushl res
call atoi
popl %ebx
pushl %eax

et_for:
	pushl $delim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx
	
	cmp $0, %eax
	je et_exit
	
	movl %eax, %edi
	movl %eax, res
	pushl res
	call atoi
	popl %ebx
	
	cmp $0, %eax
	je et_op
	pushl %eax
cont:
	jmp et_for


et_op:
	xorl %ecx, %ecx
	movb (%edi, %ecx, 1), %al
	cmp $97, %al
	je et_add
	cmp $115, %al
	je et_sub
	cmp $109, %al
	je et_mul
	jmp et_div
	
et_add:
	popl %ecx
	popl %ebx
	add %ecx, %ebx
	pushl %ebx
	jmp cont
et_sub:
	popl %ecx
	popl %ebx
	sub %ecx, %ebx
	pushl %ebx
	jmp cont
et_mul:
	popl %ebx
	popl %eax
	xorl %edx, %edx
	mul %ebx
	pushl %eax
	jmp cont
et_div:
	xorl %edx, %edx
	popl %ebx
	popl %eax
	div %ebx
	pushl %eax
	jmp cont
	

et_exit:
	popl %eax
	movl %eax, res
	pushl res
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	
	pushl $0
	call fflush
	popl %ebx
	
	movl $1, %eax
	xorl %ebx, %ebx
	int $0x80
