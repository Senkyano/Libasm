;# **************************************************************************** #
;#                                                                              #
;#                                                         :::      ::::::::    #
;#    ft_strlen.asm                                      :+:      :+:    :+:    #
;#                                                     +:+ +:+         +:+      #
;#    By: rihoy <rihoy@student.42.fr>                +#+  +:+       +#+         #
;#                                                 +#+#+#+#+#+   +#+            #
;#    Created: 2025/05/27 10:55:16 by rihoy             #+#    #+#              #
;#    Updated: 2025/06/10 15:23:01 by rihoy            ###   ########.fr        #
;#                                                                              #
;# **************************************************************************** #

bits 64

section .text
	string db "Hello 42World!", 0;	string contains 14 bytes of caracters

global _start
	_start:      ;					similar of void main()
		mov rdi, string;			mov rdi to point on string
		call ft_strlen;				call my function ft_strlen

;	at this points we have the value of ft_strlen in rax and now we can use

		mov rax, 60	;				Number of call system for exit
		xor rdi, rdi	;		Initialised register rdi to 0
		syscall ;					We call the system core

; Function ft_strlen
ft_strlen:
	xor rax, rax; 				Initialised registre rax to 0

.loop:
	cmp	byte [rdi + rax], 0; 	Compare the pointer + index to compare if this bytes equal NULL or 0
	je	.return; 					if is this equal go to return
	inc	rax; 					increment len of the string with registre
	jmp	.loop; 					go to .loop

.return:
	ret ; 						return