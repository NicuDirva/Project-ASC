.data
matrix: .long 1, 2, 3, 4, 5, 6
indexcol: .space 4
indexline: .space 4
line: .space 3
columns: .space 2
formatPrintf: .asciz "%d\n"
newLine: .asciz "\n"
.text

.global main

main:

lea matrix, %edi
movl $0, indexline

et_for_line:
	movl indexline, %ebx
	cmp %ebx, line
	je et_exit
	
	movl $0, indexcol
	et_for_col:
		movl indexcol, %ebx
		cmp %ebx, columns
		je et_cont
		
		xorl %edx, %edx
		movl columns, %ebx
		movl indexline, %eax
		mull %ebx
		add indexcol, %eax
		movl (%edi, %eax, 4), %ecx
		
		pushl %ecx
		pushl $formatPrintf
		call printf
		popl %ebx
		popl %ebx
		
		pushl $0
		call fflush
		popl %ebx
		
		incl indexcol
		jmp et_for_col
	
et_cont:	
	incl indexline
	
	movl $4, %eax
	movl $1, %ebx
	movl $newLine, %ecx
	movl $2, %edx
	int $0x80
	
	pushl $0
	call fflush
	popl %ebx
	jmp et_for_line
	
et_exit:
	
	pushl $0
	call fflush
	popl %ebx
	movl $1, %eax
	xorl %ebx, %ebx
	int $0x80
