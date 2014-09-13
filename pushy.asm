[bits 64]
;copyright:=kopimi
;proof of concept for user-mode self modifying assembly
;I push instructions onto the stack to modify the value on top
;of the stack, which after a call is the return value
;the last instuction pushed is "ret" which will jump to
;the modified address
;if the address is modified it will print 'jumped successfully!'
;otherwise it will just exit, see for yourself :)

section .text
	global _start

_start:
	push WORD 0xc301
	push WORD 0xb007
	push WORD 0x2404
	push WORD 0x8348

	call rsp

	mov al, 0x3c
	xor rdi, rdi
	syscall

	xor rdi, rdi
	mov rsi, test
	mov dl, 0x15
	syscall

	mov al, 0x3c
	xor rdi, rdi
	syscall

section .data
test: db 'jumped successfully!', 10
