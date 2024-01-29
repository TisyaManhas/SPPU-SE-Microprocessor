;hello.asm
section .data

	msg1 db "Enter Name",10 
	msg1len equ $-msg1

	msg2 db "My Name is:"
	msg2len equ $-msg2

	cnt db 5

section .bss
	str1 resb 15
	len resb 1

section .text
global _start
_start:
	mov rax,1
	mov rdi,1
	mov rsi,msg1
	mov rdx,msg1len
	syscall

	mov rax,0
	mov rdi,0
	mov rsi,str1
	mov rdx,15
	syscall

	mov [len],rax

	mov rax,1
	mov rdi,1
	mov rsi,msg2
	mov rdx,msg2len
	syscall

	mov rax,1
	mov rdi,1
	mov rsi,str1
	mov rdx,[len]
	syscall

	mov rax,60
	mov rdi,0
	syscall
