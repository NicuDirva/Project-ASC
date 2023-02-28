.data
con: .space 4
res2: .space 4
nrlinii: .space 4
nrcoloane: .space 4
res: .space 16
sircitit: .space 1600
v: .space 1600
n: .space 4
contor: .long 0
contor2: .long 0
operand: .space 4
new: .asciz "\n"
delim: .asciz " "
formatScanf: .asciz "%300[^\n]"
formatPrintfnr: .asciz "%d"
formatPrintfsir: .asciz "%s"
.text
.global main
main:

pushl $sircitit
pushl $formatScanf
call scanf
popl %ebx
popl %ebx

xorl %edi, %edi
xorl %esi, %esi

movl $sircitit, %edi
movl $v, %esi

pushl $delim
pushl $sircitit
call strtok
popl %ebx
popl %ebx


pushl $delim
pushl $0
call strtok
popl %ebx
popl %ebx
	
pushl %eax
call atoi
popl %ebx
	
movl %eax, nrlinii

pushl $delim
pushl $0
call strtok
popl %ebx
popl %ebx
	
pushl %eax
call atoi
popl %ebx
	
movl %eax, nrcoloane
//Am inserat nr de linii si coloane in variabilele corespunzatoare

xorl %edx, %edx
movl nrlinii, %eax
movl nrcoloane, %ebx
mull %ebx
movl %eax, n
xorl %ebx, %ebx

et_for:
	movl contor2, %ebx
	cmp n, %ebx
	je et_go
	
	pushl $delim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx

	pushl %eax
	call atoi
	popl %ecx
	
	movl contor, %edx
	movl %eax, (%esi, %edx, 4)
	incl %edx
	movl %edx, contor
	
	incl contor2
	jmp et_for
	
et_go:
pushl $delim
pushl $0
call strtok
popl %ebx
popl %ebx

pushl $delim
pushl $0
call strtok
popl %ebx
popl %ebx	


movl %eax, res
movl res, %esp
xorl %ecx, %ecx
movb (%esp, %ecx, 1), %al
cmp $114, %al
je et_rot

pushl $delim
pushl $0
call strtok
popl %ebx
popl %ebx

pushl %eax
call atoi
popl %ebx

movl %eax, operand

pushl $delim
pushl $0
call strtok
popl %ebx
popl %ebx

xorl %esp, %esp

movl %eax, res
movl res, %esp
xorl %ecx, %ecx
movb (%esp, %ecx, 1), %al
cmp $97, %al
je et_add
cmp $115, %al
je et_sub
cmp $109, %al
je et_mul
jmp et_div

et_rot:
	movl nrlinii, %ebx
	movl nrcoloane, %edx
	movl %ebx, nrcoloane
	movl %edx, nrlinii
	
	pushl nrlinii
	pushl $formatPrintfnr
	call printf
	popl %ebx
	popl %ebx
	
	pushl $delim
	pushl $formatPrintfsir
	call printf
	popl %ebx
	popl %ebx

	pushl nrcoloane
	pushl $formatPrintfnr
	call printf
	popl %ebx
	popl %ebx
	
	pushl $delim
	pushl $formatPrintfsir
	call printf
	popl %ebx
	popl %ebx	
	
	xorl %ecx, %ecx
	xorl %edx, %edx
	movl $2, %ebx
	movl n, %eax
	div %ebx
	movl %eax, con
	et_for_rot:
		cmp con, %ecx
		je et_exit
		
		movl con, %edx
		add %ecx, %edx
		movl (%esi, %edx, 4), %eax
		
		pushl %ecx
		
		pushl %eax
		pushl $formatPrintfnr
		call printf
		popl %edx
		popl %edx
		
		pushl $delim
		pushl $formatPrintfsir
		call printf
		popl %edx
		popl %edx
		
		popl %ecx
		
		movl (%esi, %ecx, 4), %eax
		
		pushl %ecx
		
		pushl %eax
		pushl $formatPrintfnr
		call printf
		popl %edx
		popl %edx
	
		pushl $delim
		pushl $formatPrintfsir
		call printf
		popl %edx
		popl %edx
		
		popl %ecx
		incl %ecx
		jmp et_for_rot

et_add:
	pushl nrlinii
	pushl formatPrintfnr
	call printf
	popl %ebx
	popl %ebx
	
	pushl $delim
	pushl $formatPrintfsir
	call printf
	popl %ebx
	popl %ebx
	
	pushl nrcoloane
	pushl formatPrintfnr
	call printf
	popl %ebx
	popl %ebx	

	pushl $delim
	pushl $formatPrintfsir
	call printf
	popl %ebx
	popl %ebx
	
	xorl %ebx, %ebx	
	et_for_add:
		movl (%esi, %ebx, 4), %eax
		cmp $0, %eax
		je et_exit
		
		add operand, %eax
		pushl %ebx
		
		pushl %eax
		pushl $formatPrintfnr
		call printf
		popl %edx
		popl %edx
		
		pushl $delim
		pushl $formatPrintfsir
		call printf
		popl %edx
		popl %edx
		
		popl %ebx
		incl %ebx
		jmp et_for_add
		
et_sub:
	pushl nrlinii
	pushl formatPrintfnr
	call printf
	popl %ebx
	popl %ebx
	
	pushl $delim
	pushl $formatPrintfsir
	call printf
	popl %ebx
	popl %ebx
	
	pushl nrcoloane
	pushl formatPrintfnr
	call printf
	popl %ebx
	popl %ebx	

	pushl $delim
	pushl $formatPrintfsir
	call printf
	popl %ebx
	popl %ebx
	
	xorl %ebx, %ebx	
	et_for_sub:
		movl (%esi, %ebx, 4), %eax
		cmp $0, %eax
		je et_exit
		
		sub operand, %eax
		pushl %ebx
		
		pushl %eax
		pushl $formatPrintfnr
		call printf
		popl %edx
		popl %edx
		
		pushl $delim
		pushl $formatPrintfsir
		call printf
		popl %edx
		popl %edx
		
		popl %ebx
		incl %ebx
		jmp et_for_sub
		
et_div:
	pushl nrlinii
	pushl formatPrintfnr
	call printf
	popl %ebx
	popl %ebx
	
	pushl $delim
	pushl $formatPrintfsir
	call printf
	popl %ebx
	popl %ebx
	
	pushl nrcoloane
	pushl formatPrintfnr
	call printf
	popl %ebx
	popl %ebx	

	pushl $delim
	pushl $formatPrintfsir
	call printf
	popl %ebx
	popl %ebx
		
	movl $0, %eax
	movl operand, %ebx
	cmp %eax, %ebx
	jge et_div_poz
	jmp et_div_neg
	
et_div_neg:
	xorl %ebx, %ebx	
	et_for_div_neg:
		movl (%esi, %ebx, 4), %eax
		cmp $0, %eax
		je et_exit
		movl $0, %edx
		cmp %edx, %eax
		jge et_neg_poz
		jmp et_neg_neg
	cont2:
		incl %ebx
		jmp et_for_div_neg

et_neg_poz:
	pushl %ebx
	pushl %eax
	movl operand, %eax
	movl $0, %ebx
	sub %eax, %ebx
	movl %ebx, operand
	popl %eax
	movl $0, %ebx
	sub %eax, %ebx
	movl %ebx, %eax
	xorl %edx, %edx
	movl operand, %ecx
	cdq
	idiv %ecx
	
	pushl %eax
	pushl $formatPrintfnr
	call printf
	popl %edx
	popl %edx
	
	pushl $delim
	pushl $formatPrintfsir
	call printf
	popl %edx
	popl %edx
	
	popl %ebx
	jmp cont2

et_neg_neg:
	pushl %ebx
	
	movl operand, %edx
	movl $0, %ecx
	sub %edx, %ecx
	movl %ecx, %ebx
	
	movl $0, %ecx
	sub %eax, %ecx
	movl %ecx, %eax
	xorl %edx, %edx
	cdq
	div %ebx
	
	pushl %eax
	pushl $formatPrintfnr
	call printf
	popl %edx
	popl %edx
	
	pushl $delim
	pushl $formatPrintfsir
	call printf
	popl %edx
	popl %edx
	
	popl %ebx
	jmp cont2
	
et_div_poz:
	xorl %ebx, %ebx	
	et_for_div_poz:
		movl (%esi, %ebx, 4), %eax
		cmp $0, %eax
		je et_exit
		movl $0, %edx
		cmp %edx, %eax
		jge et_poz_poz
		jmp et_poz_neg
	cont1:
		incl %ebx
		jmp et_for_div_poz

et_poz_poz:
	pushl %ebx
	
	xorl %edx, %edx
	movl operand, %ecx
	div %ecx
	
	pushl %eax
	pushl $formatPrintfnr
	call printf
	popl %ecx
	popl %ecx
	
	pushl $delim
	pushl $formatPrintfsir
	call printf
	popl %ecx
	popl %ecx
	
	popl %ebx
	jmp cont1
	
et_poz_neg:
	pushl %ebx
	
	xorl %edx, %edx
	movl operand, %ecx
	cdq
	idiv %ecx

	pushl %eax
	pushl $formatPrintfnr
	call printf
	popl %ecx
	popl %ecx
	
	pushl $delim
	pushl $formatPrintfsir
	call printf
	popl %ecx
	popl %ecx
	
	popl %ebx
	jmp cont1
et_mul:
	pushl nrlinii
	pushl formatPrintfnr
	call printf
	popl %ebx
	popl %ebx
	
	pushl $delim
	pushl $formatPrintfsir
	call printf
	popl %ebx
	popl %ebx
	
	pushl nrcoloane
	pushl formatPrintfnr
	call printf
	popl %ebx
	popl %ebx	

	pushl $delim
	pushl $formatPrintfsir
	call printf
	popl %ebx
	popl %ebx
	
	xorl %ebx, %ebx
	et_for_mul:
		movl (%esi, %ebx, 4), %eax
		cmp $0, %eax
		je et_exit
		xorl %edx, %edx
		movl operand, %ecx
		imul %ecx
		
		pushl %ebx
		
		pushl %eax
		pushl $formatPrintfnr
		call printf
		popl %ecx
		popl %ecx
		
		pushl $delim
		pushl $formatPrintfsir
		call printf
		popl %ecx
		popl %ecx
		
		popl %ebx
		incl %ebx
		jmp et_for_mul
		
et_exit:
	pushl $new
	pushl $formatPrintfsir
	call printf
	popl %edx
	popl %edx
	
	pushl $0
	call fflush
	popl %edx
	
	movl $1, %eax
	xorl %ebx, %ebx
	int $0x80

