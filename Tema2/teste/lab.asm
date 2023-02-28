.data

a: .long 10
b: .long 5
rez: .space 4
formatPrintf: .asciz "%d\n"
.text
.global main
main:
movl a, %eax
not %eax
//movl b, %ebx
//xor %ebx, %eax
movl %eax, rez

pushl rez
pushl $formatPrintf
call printf
popl %ebx
popl %ebx

movl $1, %eax
xorl %ebx, %ebx
int $0x80
