.data
sirb16: .space 200
sirb2: .space 800
siraf: .space 200
scan: .asciz "%s"
formatPrintf: .asciz "%s\n"
contor1: .long 0
contor2: .long 0
contor3: .long 0
sum: .long 0
sump: .long 0
sumn: .long 0

.text

.global main

main:

pushl $sirb16
pushl $scan
call scanf
popl %ebx
popl %ebx

movl $sirb16, %edi
movl $sirb2, %esi
movl $siraf, %esp
xorl %ecx, %ecx

et_for:
	movb (%edi, %ecx, 1), %al
	cmp $0, %al
	je et_cont
	cmp $48, %al
	je et_0
	cmp $49, %al
	je et_1
	cmp $50, %al
	je et_2
	cmp $51, %al
	je et_3
	cmp $52, %al
	je et_4
	cmp $53, %al
	je et_5
	cmp $54, %al
	je et_6
	cmp $55, %al
	je et_7
	cmp $56, %al
	je et_8
	cmp $57, %al
	je et_9
	cmp $65, %al
	je et_10
	cmp $66, %al
	je et_11
	cmp $67, %al
	je et_12
	cmp $68, %al
	je et_13
	cmp $69, %al
	je et_14
	cmp $70, %al
	je et_15
cont1:
	incl %ecx
	jmp et_for
et_cont:
	movl $0, %eax
	movl %eax, contor2

et_for2:                                               
	movl contor2, %ecx
	movb (%esi, %ecx, 1), %al
	cmp $0, %al
	je et_exit                              
	add $1, %ecx
	movb (%esi, %ecx, 1), %al
	cmp $49, %al
	je et_op
	add $1, %ecx
	movb (%esi, %ecx, 1), %al
	cmp $49, %al
	je et_var
	add $1, %ecx
	movb (%esi, %ecx, 1), %al
	cmp $48, %al
	je et_poz
	jmp et_neg

cont2:
	movl contor2, %eax
	add $12, %eax
	movl %eax, contor2
	jmp et_for2
et_op:	

	movl contor2, %ecx
	add $9, %ecx
	movb (%esi, %ecx, 1), %al
	cmp $49, %al
        je et_div
        add $1, %ecx
	movb (%esi, %ecx, 1), %al
        cmp $49, %al
        je et_multsub
        add $1, %ecx
        movb (%esi, %ecx, 1), %al
        cmp $49, %al
        je et_add
	jmp et_let

et_div:
	movl contor3, %ecx
	movb $100, (%esp, %ecx, 1)
	add $1, %ecx
	movb $105, (%esp, %ecx, 1)
	add $1, %ecx
	movb $118, (%esp, %ecx, 1)
	add $1, %ecx
	movb $32, (%esp, %ecx, 1)
	add $1, %ecx
	movl %ecx, contor3
	jmp cont2
et_add:
	movl contor3, %ecx
	movb $97, (%esp, %ecx, 1)
	add $1, %ecx
	movb $100, (%esp, %ecx, 1)
	add $1, %ecx
	movb $100, (%esp, %ecx, 1)
	add $1, %ecx
	movb $32, (%esp, %ecx, 1)
	add $1, %ecx
	movl %ecx, contor3
	jmp cont2
et_let:
	movl contor3, %ecx
	movb $108, (%esp, %ecx, 1)
	add $1, %ecx
	movb $101, (%esp, %eax, 1)
	add $1, %ecx
	movb $116, (%esp, %ecx, 1)
	add $1, %ecx
	movb $32, (%esp, %ecx, 1)
	add $1, %ecx
	movl %ecx, contor3
	jmp cont2
et_multsub:
	movl contor2, %ecx
	add $11, %ecx
	movb (%esi, %ecx, 1), %al
	cmp $49, %al
	je et_mult
	jmp et_sub
et_sub:
	movl contor3, %ecx
	movb $115, (%esp, %ecx, 1)
	add $1, %ecx
	movb $117, (%esp, %ecx, 1)
	add $1, %ecx
	movb $98, (%esp, %ecx, 1)
	add $1, %ecx
	movb $32, (%esp, %ecx, 1)
	add $1, %ecx
	movl %ecx, contor3
	jmp cont2
et_mult:
	movl contor3, %ecx
	movb $109, (%esp, %ecx, 1)
	add $1, %ecx
	movb $117, (%esp, %ecx, 1)
	add $1, %ecx
	movb $108, (%esp, %ecx, 1)
	add $1, %ecx
	movb $32, (%esp, %ecx, 1)
	add $1, %ecx
	movl %ecx, contor3
	jmp cont2
et_var:

	movl contor2, %ecx
	add $4, %ecx
	movb (%esi, %ecx, 1), %al
	cmp $49, %al
	je et_27
	cont27:
	add $1, %ecx
	movb (%esi, %ecx, 1), %al
	je et_26
	cont26:
	add $1, %ecx
	movb (%esi, %ecx, 1), %al
	je et_25
	cont25:
	add $1, %ecx
	movb (%esi, %ecx, 1), %al
	je et_24
	cont24:
	add $1, %ecx
	movb (%esi, %ecx, 1), %al
	je et_23
	cont23:
	add $1, %ecx
	movb (%esi, %ecx, 1), %al
	je et_22
	cont22:
	add $1, %ecx
	movb (%esi, %ecx, 1), %al
	je et_21
	cont21:
	add $1, %ecx
	movb (%esi, %ecx, 1), %al
	je et_20
	cont20:
	add $1, %ecx
	movl contor3, %ecx
	movl sum, %eax
	movb %eax, (%esp, %ecx, 1)
	add $1, %ecx
	movb $32, (%esp, %ecx, 1)
	add $1, %ecx
	movl %ecx, contor3
	jmp cont2
et_27:
	movl sum, %ebx
	add $128, %ebx
	movl %ebx, sum
	jmp cont27
et_26:
	movl sum, %ebx
	add $64, %ebx
	movl %ebx, sum
	jmp cont26
et_25:
	movl sum, %ebx
	add $32, %ebx
	movl %ebx, sum
	jmp cont25
et_24:
	movl sum, %ebx
	add $16, %ebx
	movl %ebx, sum
	jmp cont24
et_23:
	movl sum, %ebx
	add $8, %ebx
	movl %ebx, sum
	jmp cont23
et_22:
	movl sum, %ebx
	add $4, %ebx
	movl %ebx, sum
	jmp cont22
et_21:
	movl sum, %ebx
	add $2, %ebx
	movl %ebx, sum
	jmp cont21
et_20:
	movl sum, %ebx
	add $1, %ebx
	movl %ebx, sum
	jmp cont20
et_poz:
	movl contor2, %ecx
	add $4, %ecx
	movb (%esi, %ecx, 1), %al
	cmp $49, %al
	je et_27p
	cont27p:
	add $1, %ecx
	movb (%esi, %ecx, 1), %al
	je et_26p
	cont26p:
	add $1, %ecx
	movb (%esi, %ecx, 1), %al
	je et_25p
	cont25p:
	add $1, %ecx
	movb (%esi, %ecx, 1), %al
	je et_24p
	cont24p:
	add $1, %ecx
	movb (%esi, %ecx, 1), %al
	je et_23p
	cont23p:
	add $1, %ecx
	movb (%esi, %ecx, 1), %al
	je et_22p
	cont22p:
	add $1, %ecx
	movb (%esi, %ecx, 1), %al
	je et_21p
	cont21p:
	add $1, %ecx
	movb (%esi, %ecx, 1), %al
	je et_20p
	cont20p:
	add $1, %ecx
	movl %ecx, contor2
	movl contor3, %ecx
	movl sump, %ebx
	movl $10, %eax
	cmp %ebx, %eax
	jg et_10_0
	movl $10, %eax
	cmp %ebx, %eax
	jg et_10_1
	jmp et_10_2
cont3:
	movl %ecx, contor3
	jmp cont2
et_27p:
	movl sump, %ebx
	add $128, %ebx
	movl %ebx, sump
	jmp cont27p
et_26p:
	movl sump, %ebx
	add $64, %ebx
	movl %ebx, sump
	jmp cont26p
et_25p:
	movl sump, %ebx
	add $32, %ebx
	movl %ebx, sump
	jmp cont25p
et_24p:
	movl sump, %ebx
	add $16, %ebx
	movl %ebx, sump
	jmp cont24p
et_23p:
	movl sump, %ebx
	add $8, %ebx
	movl %ebx, sump
	jmp cont23p
et_22p:
	movl sump, %ebx
	add $4, %ebx
	movl %ebx, sump
	jmp cont22p
et_21p:
	movl sump, %ebx
	add $2, %ebx
	movl %ebx, sump
	jmp cont21p
et_20p:
	movl sump, %ebx
	add $1, %ebx
	movl %ebx, sump
	jmp cont20p

et_10_0:
	movl $48, %ebx
	add sump, %ebx
	movb %ebx, (%esp, %ecx, 1)
	add $1, %ecx
	movb $32, (%esp, %ecx, 1)
	add $1, %ecx
	jmp cont3
et_10_1:
	xorl %edx, %edx
	movl $10, %ebx
	add sump, %eax
	divl %ebx
	add $48, %eax
	//add sump, %eax
	movb %eax, (%esp, %ecx, 1)
	add $1, %ecx
	add $48, %edx
	//add sump, %edx
	movb %edx, (%esp, %ecx, 1)
	add $1, %ecx
	movb $32, (%esp, %ecx, 1)
	add $1, %ecx 
	jmp cont3
et_10_2:
	xorl %edx, %edx
	movl $100, %ebx
	add sump, %eax
	divl %ebx
	add $48, %eax
	//add sump, %eax
	movb %eax, (%esp, %ecx, 1)
	add $1, %ecx
	movl %edx, %eax
	movl $10, %ebx
	xorl %edx, %edx
	divl %ebx
	add $48, %eax
	//add sump, %eax
	movb %eax, (%esp, %ecx, 1)
	add $1, %ecx
	add $48, %edx
	//add sump, %edx
	movb %edx, (%esp, %ecx, 1)
	add $1, %ecx
	movb $32, (%esp, %ecx, 1)
	add $1, %ecx
	jmp cont3




et_neg:
	movl contor2, %ecx
	add $4, %ecx
	movb (%esi, %ecx, 1), %al
	cmp $49, %al
	je et_27n
	cont27n:
	add $1, %ecx
	movb (%esi, %ecx, 1), %al
	je et_26n
	cont26n:
	add $1, %ecx
	movb (%esi, %ecx, 1), %al
	je et_25n
	cont25n:
	add $1, %ecx
	movb (%esi, %ecx, 1), %al
	je et_24n
	cont24n:
	add $1, %ecx
	movb (%esi, %ecx, 1), %al
	je et_23n
	cont23n:
	add $1, %ecx
	movb (%esi, %ecx, 1), %al
	je et_22n
	cont22n:
	add $1, %ecx
	movb (%esi, %ecx, 1), %al
	je et_21n
	cont21n:
	add $1, %ecx
	movb (%esi, %ecx, 1), %al
	je et_20n
	cont20n:
	add $1, %ecx
	movl %ecx, contor2
	movl contor3, %ecx
	movl $45, (%esp, %ecx, 1)
	add $1, %ecx
	
	movl sumn, %ebx
	movl $10, %eax
	cmp %ebx, %eax
	jg et_10_0_n
	movl $10, %eax
	cmp %ebx, %eax
	jg et_10_1_n
	jmp et_10_2_n
cont3n:
	movl %ecx, contor3
	jmp cont2
et_27n:
	movl sumn, %ebx
	add $128, %ebx
	movl %ebx, sumn
	jmp cont27n
et_26n:
	movl sumn, %ebx
	add $64, %ebx
	movl %ebx, sumn
	jmp cont26n
et_25n:
	movl sumn, %ebx
	add $32, %ebx
	movl %ebx, sumn
	jmp cont25n
et_24n:
	movl sumn, %ebx
	add $16, %ebx
	movl %ebx, sumn
	jmp cont24n
et_23n:
	movl sumn, %ebx
	add $8, %ebx
	movl %ebx, sumn
	jmp cont23n
et_22n:
	movl sumn, %ebx
	add $4, %ebx
	movl %ebx, sumn
	jmp cont22n
et_21n:
	movl sumn, %ebx
	add $2, %ebx
	movl %ebx, sumn
	jmp cont21n
et_20n:
	movl sumn, %ebx
	add $1, %ebx
	movl %ebx, sumn
	jmp cont20n

et_10_0_n:
	movl $48, %ebx
	add sumn, %ebx
	movb %ebx, (%esp, %ecx, 1)
	add $1, %ecx
	movb $32, (%esp, %ecx, 1)
	add $1, %ecx
	jmp cont3n
et_10_1_n:
	xorl %edx, %edx
	add sumn, %eax
	movl $10, %ebx
	divl %ebx
	add $48, %eax
	//add sumn, %eax
	movb %eax, (%esp, %ecx, 1)
	add $1, %ecx
	add $48, %edx
	//add sumn, %edx
	movb %edx, (%esp, %ecx, 1)
	add $1, %ecx
	movb $32, (%esp, %ecx, 1)
	add $1, %ecx 
	jmp cont3n
et_10_2_n:
	xorl %edx, %edx
	add sumn, %eax
	movl $100, %ebx
	divl %ebx
	add $48, %eax
	//add sumn, %eax
	movb %eax, (%esp, %ecx, 1)
	add $1, %ecx
	movl %edx, %eax
	movl $10, %ebx
	xorl %edx, %edx
	divl %ebx
	add $48, %eax
	//add sumn, %eax
	movb %eax, (%esp, %ecx, 1)
	add $1, %ecx
	add $48, %edx
	//add sumn, %edx
	movb %edx, (%esp, %ecx, 1)
	add $1, %ecx
	movb $32, (%esp, %ecx, 1)
	add $1, %ecx
	jmp cont3n	


et_0:
	pushl %ecx
	movl contor1, %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movl %ecx, contor1
	popl %ecx
	jmp cont1
et_1:
	pushl %ecx
	movl contor1, %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movl %ecx, contor1
	popl %ecx
	jmp cont1
et_2:
	pushl %ecx
	movl contor1, %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movl %ecx, contor1
	popl %ecx
	jmp cont1
et_3:
	pushl %ecx
	movl contor1, %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movl %ecx, contor1
	popl %ecx
	jmp cont1
et_4:
	pushl %ecx
	movl contor1, %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movl %ecx, contor1
	popl %ecx
	jmp cont1
et_5:
	pushl %ecx
	movl contor1, %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movl %ecx, contor1
	popl %ecx
	jmp cont1
et_6:
	pushl %ecx
	movl contor1, %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movl %ecx, contor1
	popl %ecx
	jmp cont1
et_7:
	pushl %ecx
	movl contor1, %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movl %ecx, contor1
	popl %ecx
	jmp cont1
et_8:
	pushl %ecx
	movl contor1, %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movl %ecx, contor1
	popl %ecx
	jmp cont1
et_9:
	pushl %ecx
	movl contor1, %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movl %ecx, contor1
	popl %ecx
	jmp cont1
et_10:
	pushl %ecx
	movl contor1, %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movl %ecx, contor1
	popl %ecx
	jmp cont1
et_11:
	pushl %ecx
	movl contor1, %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movl %ecx, contor1
	popl %ecx
	jmp cont1
et_12:
	pushl %ecx
	movl contor1, %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movl %ecx, contor1
	popl %ecx
	jmp cont1
et_13:
	pushl %ecx
	movl contor1, %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movl %ecx, contor1
	popl %ecx
	jmp cont1
et_14:
	pushl %ecx
	movl contor1, %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movl %ecx, contor1
	popl %ecx
	jmp cont1
et_15:
	pushl %ecx
	movl contor1, %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movl %ecx, contor1
	popl %ecx
	jmp cont1
												

//Am transformat sirulb16 hexa dat in sir in baza doi retinut in sirb2
//Trebuie sa transformam sirb2 in 
et_exit:
	pushl $siraf
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	
	mov $1, %eax
	xorl %ebx, %ebx
	int $0x80
