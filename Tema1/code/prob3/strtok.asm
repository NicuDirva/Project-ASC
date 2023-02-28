.data
res: .space 4
contor: .long 0
sir: .space 100
v: .space 400
delim: .asciz " "
formatScanf: .asciz "%300[^\n]"


.text
.global main
main:
pushl $sir
pushl $formatScanf
call scanf
popl %ebx
popl %ebx

xorl %esi, %esi

movl $v, %esi

xorl %eax, %eax
xorl %ecx, %ecx

pushl $delim
pushl $sir
call strtok
popl %ebx
popl %ebx

movl %eax, res

xorl %eax, %eax
xorl %ecx, %ecx

pushl res
call atoi
popl %ebx

movl contor, %ecx
movl %eax, (%esi, %ecx, 4)
incl %ecx
movl %ecx, contor

xorl %eax, %eax
xorl %ecx, %ecx

et_for:
	xorl %eax, %eax
	xorl %ecx, %ecx
	
	pushl $delim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx
	
	cmp $0, %eax
	je et_exit
	
	movl %eax, res
	
	xorl %eax, %eax
	xorl %ecx, %ecx
	
	pushl res
	call atoi
	popl %ecx
	
	movl contor, %ecx
	movl %eax, (%esi, %ecx, 4)
	incl %ecx
	movl %ecx, contor
	jmp et_for
	
et_exit:
	movl $1, %eax
	xorl %ebx, %ebx
	int $0x80
