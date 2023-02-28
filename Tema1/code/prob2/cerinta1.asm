.data
sirb16: .space 300
sirafisare: .space 400
contor1: .long 0
contor2: .long 0
formatScanf: .asciz "%300[^\n]"
formatPrintf: .asciz "%s\n"
sum: .long 0

.text
.global main
main:

pushl $sirb16
pushl $formatScanf
call scanf
popl %ebx
popl %ebx


movl $sirb16, %edi
movl $sirafisare, %esi

et_for:
	movl contor1, %ecx
	movb (%edi, %ecx, 1), %al
	cmp $0, %al
	je et_exit
	cmp $67, %al
	je et_op
	cmp $65, %al
	je et_var
	cmp $56, %al
	je et_poz
	jmp et_neg
cont:
	movl contor1, %ebx
	add $3, %ebx
	movl %ebx, contor1
	jmp et_for
	
et_op:
	movl contor1, %ecx
	add $2, %ecx
	movb (%edi, %ecx, 1), %al
	cmp $48, %al
	je et_let
	cmp $49, %al
	je et_add
	cmp $50, %al
	je et_sub
	cmp $51, %al
	je et_mul
	jmp et_div
et_let:
	movl contor2, %ecx
	movb $108, (%esi, %ecx, 1)
	incl %ecx
	movb $101, (%esi, %ecx, 1)
	incl %ecx
	movb $116, (%esi, %ecx, 1)
	incl %ecx
	movb $32, (%esi, %ecx, 1)
	incl %ecx
	movl %ecx, contor2
	jmp cont
et_add:
	movl contor2, %ecx
	movb $97, (%esi, %ecx, 1)
	incl %ecx
	movb $100, (%esi, %ecx, 1)
	incl %ecx
	movb $100, (%esi, %ecx, 1)
	incl %ecx
	movb $32, (%esi, %ecx, 1)
	incl %ecx
	movl %ecx, contor2
	jmp cont
et_sub:
	movl contor2, %ecx
	movb $115, (%esi, %ecx, 1)
	incl %ecx
	movb $117, (%esi, %ecx, 1)
	incl %ecx
	movb $98, (%esi, %ecx, 1)
	incl %ecx
	movb $32, (%esi, %ecx, 1)
	incl %ecx
	movl %ecx, contor2
	jmp cont
et_mul:
	movl contor2, %ecx
	movb $109, (%esi, %ecx, 1)
	incl %ecx
	movb $117, (%esi, %ecx, 1)
	incl %ecx
	movb $108, (%esi, %ecx, 1)
	incl %ecx
	movb $32, (%esi, %ecx, 1)
	incl %ecx
	movl %ecx, contor2
	jmp cont
et_div:
	movl contor2, %ecx
	movb $100, (%esi, %ecx, 1)
	incl %ecx
	movb $105, (%esi, %ecx, 1)
	incl %ecx
	movb $118, (%esi, %ecx, 1)
	incl %ecx
	movb $32, (%esi, %ecx, 1)
	incl %ecx
	movl %ecx, contor2
	jmp cont
et_var:
	movl $0, %edx
	movl %edx, sum
	movl contor1, %ecx
	add $1, %ecx
	movb (%edi, %ecx, 1), %al
	cmp $49, %al
	je et_1v_1
	cmp $50, %al
	je et_2v_1
	cmp $51, %al
	je et_3v_1
	cmp $52, %al
	je et_4v_1
	cmp $53, %al
	je et_5v_1
	cmp $54, %al
	je et_6v_1
	cmp $55, %al
	je et_7v_1
	cmp $56, %al
	je et_8v_1
	cmp $57, %al
	je et_9v_1
	cmp $65, %al
	je et_10v_1
	cmp $66, %al
	je et_11v_1
	cmp $67, %al
	je et_12v_1
	cmp $68, %al
	je et_13v_1
	cmp $69, %al
	je et_14v_1
	cmp $70, %al
	je et_15v_1
cont2:
	incl %ecx
	movb (%edi, %ecx, 1), %al
	cmp $49, %al
	je et_1v_2
	cmp $50, %al
	je et_2v_2
	cmp $51, %al
	je et_3v_2
	cmp $52, %al
	je et_4v_2
	cmp $53, %al
	je et_5v_2
	cmp $54, %al
	je et_6v_2
	cmp $55, %al
	je et_7v_2
	cmp $56, %al
	je et_8v_2
	cmp $57, %al
	je et_9v_2
	cmp $65, %al
	je et_10v_2
	cmp $66, %al
	je et_11v_2
	cmp $67, %al
	je et_12v_2
	cmp $68, %al
	je et_13v_2
	cmp $69, %al
	je et_14v_2
	cmp $70, %al
	je et_15v_2
cont3:
	movl contor2, %ecx
	movl sum, %edx
	movb %dl, (%esi, %ecx, 1)
	incl %ecx
	movb $32, (%esi, %ecx, 1)
	incl %ecx
	movl %ecx, contor2
	jmp cont
et_1v_2:
	movl sum, %edx
	add $1, %edx
	movl %edx, sum
	jmp cont3
et_2v_2:
	movl sum, %edx
	add $2, %edx
	movl %edx, sum
	jmp cont3
et_3v_2:
	movl sum, %edx
	add $3, %edx
	movl %edx, sum
	jmp cont3
et_4v_2:
	movl sum, %edx
	add $4, %edx
	movl %edx, sum
	jmp cont3
et_5v_2:
	movl sum, %edx
	add $5, %edx
	movl %edx, sum
	jmp cont3
et_6v_2:
	movl sum, %edx
	add $6, %edx
	movl %edx, sum
	jmp cont3
et_7v_2:
	movl sum, %edx
	add $7, %edx
	movl %edx, sum
	jmp cont3
et_8v_2:
	movl sum, %edx
	add $8, %edx
	movl %edx, sum
	jmp cont3
et_9v_2:
	movl sum, %edx
	add $9, %edx
	movl %edx, sum
	jmp cont3
et_10v_2:
	movl sum, %edx
	add $10, %edx
	movl %edx, sum
	jmp cont3
et_11v_2:
	movl sum, %edx
	add $11, %edx
	movl %edx, sum
	jmp cont3
et_12v_2:
	movl sum, %edx
	add $12, %edx
	movl %edx, sum
	jmp cont3
et_13v_2:
	movl sum, %edx
	add $13, %edx
	movl %edx, sum
	jmp cont3
et_14v_2:
	movl sum, %edx
	add $14, %edx
	movl %edx, sum
	jmp cont3
et_15v_2:
	movl sum, %edx
	add $15, %edx
	movl %edx, sum
	jmp cont3
et_1v_1:
	movl sum, %edx
	add $16, %edx
	movl %edx, sum
	jmp cont2
et_2v_1:
	movl sum, %edx
	add $32, %edx
	movl %edx, sum
	jmp cont2
et_3v_1:
	movl sum, %edx
	add $48, %edx
	movl %edx, sum
	jmp cont2
et_4v_1:
	movl sum, %edx
	add $64, %edx
	movl %edx, sum
	jmp cont2
et_5v_1:
	movl sum, %edx
	add $80, %edx
	movl %edx, sum
	jmp cont2
et_6v_1:
	movl sum, %edx
	add $96, %edx
	movl %edx, sum
	jmp cont2
et_7v_1:
	movl sum, %edx
	add $112, %edx
	movl %edx, sum
	jmp cont2
et_8v_1:
	movl sum, %edx
	add $128, %edx
	movl %edx, sum
	jmp cont2
et_9v_1:
	movl sum, %edx
	add $144, %edx
	movl %edx, sum
	jmp cont2
et_10v_1:
	movl sum, %edx
	add $160, %edx
	movl %edx, sum
	jmp cont2
et_11v_1:
	movl sum, %edx
	add $176, %edx
	movl %edx, sum
	jmp cont2
et_12v_1:
	movl sum, %edx
	add $192, %edx
	movl %edx, sum
	jmp cont2
et_13v_1:
	movl sum, %edx
	add $208, %edx
	movl %edx, sum
	jmp cont2
et_14v_1:
	movl sum, %edx
	add $224, %edx
	movl %edx, sum
	jmp cont2
et_15v_1:
	movl sum, %edx
	add $240, %edx
	movl %edx, sum
	jmp cont2
et_poz:
	movl $0, %edx
	movl %edx, sum	
	movl contor1, %ecx
	add $1, %ecx
	movb (%edi, %ecx, 1), %al
	cmp $49, %al
	je et_1p_1
	cmp $50, %al
	je et_2p_1
	cmp $51, %al
	je et_3p_1
	cmp $52, %al
	je et_4p_1
	cmp $53, %al
	je et_5p_1
	cmp $54, %al
	je et_6p_1
	cmp $55, %al
	je et_7p_1
	cmp $56, %al
	je et_8p_1
	cmp $57, %al
	je et_9p_1
	cmp $65, %al
	je et_10p_1
	cmp $66, %al
	je et_11p_1
	cmp $67, %al
	je et_12p_1
	cmp $68, %al
	je et_13p_1
	cmp $69, %al
	je et_14p_1
	cmp $70, %al
	je et_15p_1
cont4:
	incl %ecx
	movb (%edi, %ecx, 1), %al
	cmp $49, %al
	je et_1p_2
	cmp $50, %al
	je et_2p_2
	cmp $51, %al
	je et_3p_2
	cmp $52, %al
	je et_4p_2
	cmp $53, %al
	je et_5p_2
	cmp $54, %al
	je et_6p_2
	cmp $55, %al
	je et_7p_2
	cmp $56, %al
	je et_8p_2
	cmp $57, %al
	je et_9p_2
	cmp $65, %al
	je et_10p_2
	cmp $66, %al
	je et_11p_2
	cmp $67, %al
	je et_12p_2
	cmp $68, %al
	je et_13p_2
	cmp $69, %al
	je et_14p_2
	cmp $70, %al
	je et_15p_2
cont5:
	movl sum, %ebx
	movl $10, %eax
	cmp %ebx, %eax
	jg et_10_0
	movl $100, %eax
	cmp %ebx, %eax
	jg et_10_1
	jmp et_10_2
et_10_0:
	movl contor2, %ecx
	movl $48, %ebx
	add sum, %ebx
	movb %ebx, (%esi, %ecx, 1)
	add $1, %ecx
	movb $32, (%esi, %ecx, 1)
	add $1, %ecx
	movl %ecx, contor2
	jmp cont
et_10_1:
	movl contor2, %ecx
	xorl %edx, %edx
	xorl %eax, %eax
	movl $10, %ebx
	add sum, %eax
	divl %ebx
	add $48, %eax
	movb %eax, (%esi, %ecx, 1)
	add $1, %ecx
	add $48, %edx
	movb %edx, (%esi, %ecx, 1)
	add $1, %ecx
	movb $32, (%esi, %ecx, 1)
	add $1, %ecx 
	movl %ecx, contor2
	jmp cont
et_10_2:
	movl contor2, %ecx
	xorl %edx, %edx
	xorl %eax, %eax
	movl $100, %ebx
	add sum, %eax
	divl %ebx
	add $48, %eax
	movb %eax, (%esi, %ecx, 1)
	add $1, %ecx
	movl %edx, %eax
	movl $10, %ebx
	xorl %edx, %edx
	divl %ebx
	add $48, %eax
	movb %eax, (%esi, %ecx, 1)
	add $1, %ecx
	add $48, %edx
	//add sump, %edx
	movb %edx, (%esi, %ecx, 1)
	add $1, %ecx
	movb $32, (%esi, %ecx, 1)
	add $1, %ecx
	movl %ecx, contor2
	jmp cont

et_1p_2:
	movl sum, %edx
	add $1, %edx
	movl %edx, sum
	jmp cont5
et_2p_2:
	movl sum, %edx
	add $2, %edx
	movl %edx, sum
	jmp cont5
et_3p_2:
	movl sum, %edx
	add $3, %edx
	movl %edx, sum
	jmp cont5
et_4p_2:
	movl sum, %edx
	add $4, %edx
	movl %edx, sum
	jmp cont5
et_5p_2:
	movl sum, %edx
	add $5, %edx
	movl %edx, sum
	jmp cont5
et_6p_2:
	movl sum, %edx
	add $6, %edx
	movl %edx, sum
	jmp cont5
et_7p_2:
	movl sum, %edx
	add $7, %edx
	movl %edx, sum
	jmp cont5
et_8p_2:
	movl sum, %edx
	add $8, %edx
	movl %edx, sum
	jmp cont5
et_9p_2:
	movl sum, %edx
	add $9, %edx
	movl %edx, sum
	jmp cont5
et_10p_2:
	movl sum, %edx
	add $10, %edx
	movl %edx, sum
	jmp cont5
et_11p_2:
	movl sum, %edx
	add $11, %edx
	movl %edx, sum
	jmp cont5
et_12p_2:
	movl sum, %edx
	add $12, %edx
	movl %edx, sum
	jmp cont5
et_13p_2:
	movl sum, %edx
	add $13, %edx
	movl %edx, sum
	jmp cont5
et_14p_2:
	movl sum, %edx
	add $14, %edx
	movl %edx, sum
	jmp cont5
et_15p_2:
	movl sum, %edx
	add $15, %edx
	movl %edx, sum
	jmp cont5
et_1p_1:
	movl sum, %edx
	add $16, %edx
	movl %edx, sum
	jmp cont4
et_2p_1:
	movl sum, %edx
	add $32, %edx
	movl %edx, sum
	jmp cont4
et_3p_1:
	movl sum, %edx
	add $48, %edx
	movl %edx, sum
	jmp cont4
et_4p_1:
	movl sum, %edx
	add $64, %edx
	movl %edx, sum
	jmp cont4
et_5p_1:
	movl sum, %edx
	add $80, %edx
	movl %edx, sum
	jmp cont4
et_6p_1:
	movl sum, %edx
	add $96, %edx
	movl %edx, sum
	jmp cont4
et_7p_1:
	movl sum, %edx
	add $112, %edx
	movl %edx, sum
	jmp cont4
et_8p_1:
	movl sum, %edx
	add $128, %edx
	movl %edx, sum
	jmp cont4
et_9p_1:
	movl sum, %edx
	add $144, %edx
	movl %edx, sum
	jmp cont4
et_10p_1:
	movl sum, %edx
	add $160, %edx
	movl %edx, sum
	jmp cont4
et_11p_1:
	movl sum, %edx
	add $176, %edx
	movl %edx, sum
	jmp cont4
et_12p_1:
	movl sum, %edx
	add $192, %edx
	movl %edx, sum
	jmp cont4
et_13p_1:
	movl sum, %edx
	add $208, %edx
	movl %edx, sum
	jmp cont4
et_14p_1:
	movl sum, %edx
	add $224, %edx
	movl %edx, sum
	jmp cont4
et_15p_1:
	movl sum, %edx
	add $240, %edx
	movl %edx, sum
	jmp cont4
et_neg:
	movl $0, %edx
	movl %edx, sum	
	movl contor1, %ecx
	add $1, %ecx
	movb (%edi, %ecx, 1), %al
	cmp $49, %al
	je et_1n_1
	cmp $50, %al
	je et_2n_1
	cmp $51, %al
	je et_3n_1
	cmp $52, %al
	je et_4n_1
	cmp $53, %al
	je et_5n_1
	cmp $54, %al
	je et_6n_1
	cmp $55, %al
	je et_7n_1
	cmp $56, %al
	je et_8n_1
	cmp $57, %al
	je et_9n_1
	cmp $65, %al
	je et_10n_1
	cmp $66, %al
	je et_11n_1
	cmp $67, %al
	je et_12n_1
	cmp $68, %al
	je et_13n_1
	cmp $69, %al
	je et_14n_1
	cmp $70, %al
	je et_15n_1
cont6:
	incl %ecx
	movb (%edi, %ecx, 1), %al
	cmp $49, %al
	je et_1n_2
	cmp $50, %al
	je et_2n_2
	cmp $51, %al
	je et_3n_2
	cmp $52, %al
	je et_4n_2
	cmp $53, %al
	je et_5n_2
	cmp $54,  %al
	je et_6n_2
	cmp $55, %al
	je et_7n_2
	cmp $56, %al
	je et_8n_2
	cmp $57, %al
	je et_9n_2
	cmp $65, %al
	je et_10n_2
	cmp $66, %al
	je et_11n_2
	cmp $67, %al
	je et_12n_2
	cmp $68, %al
	je et_13n_2
	cmp $69, %al
	je et_14n_2
	cmp $70, %al
	je et_15n_2
cont7:
	movl sum, %ebx
	movl $10, %eax
	cmp %ebx, %eax
	jg et_10_0_n
	movl $100, %eax
	cmp %ebx, %eax
	jg et_10_1_n
	jmp et_10_2_n
et_10_0_n:
	movl contor2, %ecx
	movb $45, (%esi, %ecx, 1)
	incl %ecx
	movl $48, %ebx
	add sum, %ebx
	movb %ebx, (%esi, %ecx, 1)
	add $1, %ecx
	movb $32, (%esi, %ecx, 1)
	add $1, %ecx
	movl %ecx, contor2
	jmp cont
et_10_1_n:
	movl contor2, %ecx
	movb $45, (%esi, %ecx, 1)
	incl %ecx
	xorl %edx, %edx
	xorl %eax, %eax
	movl $10, %ebx
	add sum, %eax
	divl %ebx
	add $48, %eax
	movb %eax, (%esi, %ecx, 1)
	add $1, %ecx
	add $48, %edx
	movb %edx, (%esi, %ecx, 1)
	add $1, %ecx
	movb $32, (%esi, %ecx, 1)
	add $1, %ecx 
	movl %ecx, contor2
	jmp cont
et_10_2_n:
	movl contor2, %ecx
	movb $45, (%esi, %ecx, 1)
	incl %ecx
	xorl %edx, %edx
	xorl %eax, %eax
	movl $100, %ebx
	add sum, %eax
	divl %ebx
	add $48, %eax
	movb %eax, (%esi, %ecx, 1)
	add $1, %ecx
	movl %edx, %eax
	movl $10, %ebx
	xorl %edx, %edx
	divl %ebx
	add $48, %eax
	movb %eax, (%esi, %ecx, 1)
	add $1, %ecx
	add $48, %edx
	movb %edx, (%esi, %ecx, 1)
	add $1, %ecx
	movb $32, (%esi, %ecx, 1)
	add $1, %ecx
	movl %ecx, contor2
	jmp cont

et_1n_2:
	movl sum, %edx
	add $1, %edx
	movl %edx, sum
	jmp cont7
et_2n_2:
	movl sum, %edx
	add $2, %edx
	movl %edx, sum
	jmp cont7
et_3n_2:
	movl sum, %edx
	add $3, %edx
	movl %edx, sum
	jmp cont7
et_4n_2:
	movl sum, %edx
	add $4, %edx
	movl %edx, sum
	jmp cont7
et_5n_2:
	movl sum, %edx
	add $5, %edx
	movl %edx, sum
	jmp cont7
et_6n_2:
	movl sum, %edx
	add $6, %edx
	movl %edx, sum
	jmp cont7
et_7n_2:
	movl sum, %edx
	add $7, %edx
	movl %edx, sum
	jmp cont7
et_8n_2:
	movl sum, %edx
	add $8, %edx
	movl %edx, sum
	jmp cont7
et_9n_2:
	movl sum, %edx
	add $9, %edx
	movl %edx, sum
	jmp cont7
et_10n_2:
	movl sum, %edx
	add $10, %edx
	movl %edx, sum
	jmp cont7
et_11n_2:
	movl sum, %edx
	add $11, %edx
	movl %edx, sum
	jmp cont7
et_12n_2:
	movl sum, %edx
	add $12, %edx
	movl %edx, sum
	jmp cont7
et_13n_2:
	movl sum, %edx
	add $13, %edx
	movl %edx, sum
	jmp cont7
et_14n_2:
	movl sum, %edx
	add $14, %edx
	movl %edx, sum
	jmp cont7
et_15n_2:
	movl sum, %edx
	add $15, %edx
	movl %edx, sum
	jmp cont7
et_1n_1:
	movl sum, %edx
	add $16, %edx
	movl %edx, sum
	jmp cont6
et_2n_1:
	movl sum, %edx
	add $32, %edx
	movl %edx, sum
	jmp cont6
et_3n_1:
	movl sum, %edx
	add $48, %edx
	movl %edx, sum
	jmp cont6
et_4n_1:
	movl sum, %edx
	add $64, %edx
	movl %edx, sum
	jmp cont6
et_5n_1:
	movl sum, %edx
	add $80, %edx
	movl %edx, sum
	jmp cont6
et_6n_1:
	movl sum, %edx
	add $96, %edx
	movl %edx, sum
	jmp cont6
et_7n_1:
	movl sum, %edx
	add $112, %edx
	movl %edx, sum
	jmp cont6
et_8n_1:
	movl sum, %edx
	add $128, %edx
	movl %edx, sum
	jmp cont6
et_9n_1:
	movl sum, %edx
	add $144, %edx
	movl %edx, sum
	jmp cont6
et_10n_1:
	movl sum, %edx
	add $160, %edx
	movl %edx, sum
	jmp cont6
et_11n_1:
	movl sum, %edx
	add $176, %edx
	movl %edx, sum
	jmp cont6
et_12n_1:
	movl sum, %edx
	add $192, %edx
	movl %edx, sum
	jmp cont6
et_13n_1:
	movl sum, %edx
	add $208, %edx
	movl %edx, sum
	jmp cont6
et_14n_1:
	movl sum, %edx
	add $224, %edx
	movl %edx, sum
	jmp cont6
et_15n_1:
	movl sum, %edx
	add $240, %edx
	movl %edx, sum
	jmp cont6


et_exit:
	pushl $sirafisare
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	
	pushl $0
	call fflush
	popl %ebx
	
	mov $1, %eax
	xorl %ebx, %ebx
	int $0x80
	
