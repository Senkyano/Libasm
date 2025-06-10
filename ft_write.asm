;# **************************************************************************** #
;#                                                                              #
;#                                                         :::      ::::::::    #
;#    ft_write.asm                                       :+:      :+:    :+:    #
;#                                                     +:+ +:+         +:+      #
;#    By: rihoy <rihoy@student.42.fr>                +#+  +:+       +#+         #
;#                                                 +#+#+#+#+#+   +#+            #
;#    Created: 2025/06/11 00:39:41 by rihoy             #+#    #+#              #
;#    Updated: 2025/06/11 00:39:44 by rihoy            ###   ########.fr        #
;#                                                                              #
;# **************************************************************************** #

bits 64
;					rdi				rsi				rdx 
;1	sys_write	unsigned int fd	const char *buf	size_t count

section .text ;				section excutable code
	global ft_write

	ft_write:
		mov rsi, rdi	;			copy pointeur rdi at rsi
		xor rdx, rdx	;			compteur = 0

	.len_loop:
		cmp byte [rsi + rdx], 0
		je .end_function
		inc rdx
		jmp .len_loop

	.end_function:
		mov rax, 1 	;				systeme call of write
		mov rdi, 1
		syscall
		ret