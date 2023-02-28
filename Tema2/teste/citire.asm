.data
sir: .space 36
sir_citit: .space 91
n: .space 4
m: .space 4
d: .space 4
delim: .asciz " "
formatScanf: .asciz "%300[^\n]"
formatPrintf: .asciz "%d "
newline: .asciz "\n"

.text

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
movl $3, %ebx
xorl %edx, %edx

mull %ebx

movl %eax, d

xorl %ebx, %ebx
xorl %esi, %esi
lea sir_citit, %esi

et_citire:
	cmp %ebx, d
	je et_cont
	
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
	
et_cont:
xorl %ebx, %ebx

et_afisare:
	cmp %ebx, d
	je et_exit
	
	movl (%esi, %ebx, 4), %eax
	
	pushl %eax
	pushl $formatPrintf
	call printf
	popl %ecx
	popl %ecx
	
	incl %ebx
	jmp et_afisare
	
et_exit:
	pushl $newline
	call printf
	popl %ecx
	
	pushl $0
	call fflush
	popl %ecx
	
	movl $1, %eax
	xorl %ebx, %ebx
	int $0x80
	
	
	






