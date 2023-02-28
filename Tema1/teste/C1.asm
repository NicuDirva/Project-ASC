.data
sirb16: .space 800
sirb2: .space 3200
siraf: .space 800
scan: .asciz "%s"
print: .asciz "%s\n"
contor1: .long 0
contor2: .long 0
contor3: .long 0
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
	je et_exit
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
	movb $32, (%esi, %ecx, 1)
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
	movb $32, (%esi, %ecx, 1)	
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
	movb $32, (%esi, %ecx, 1)
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
	movb $32, (%esi, %ecx, 1)
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
	movb $32, (%esi, %ecx, 1)
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
	movb $32, (%esi, %ecx, 1)
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
	movb $32, (%esi, %ecx, 1)
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
	movb $32, (%esi, %ecx, 1)
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
	movb $32, (%esi, %ecx, 1)
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
	movb $32, (%esi, %ecx, 1)
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
	movb $32, (%esi, %ecx, 1)
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
	movb $32, (%esi, %ecx, 1)
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
	movb $32, (%esi, %ecx, 1)
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
	movb $32, (%esi, %ecx, 1)
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
	movb $32, (%esi, %ecx, 1)
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
	movb $32, (%esi, %ecx, 1)
	incl %ecx
	movl %ecx, contor1
	popl %ecx
	jmp cont1
												

//Am transformat sirulb16 hexa dat in sir in baza doi retinut in sirb2
//Trebuie sa transformam sirb2 in 
et_exit:
	pushl $sirb2
	pushl $print
	call printf
	popl %ebx	
	popl %ebx
	
	mov $1, %eax
	xorl %ebx, %ebx
	int $0x80
