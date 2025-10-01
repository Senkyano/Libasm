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

; calculate the len of the string

section .text
	global ft_strlen

	; Function ft_strlen
	ft_strlen:
		cmp rdi, 0
		je .null_pointer

		xor rax, rax; 				initialised compteur

	.align_loop:
		mov rdi, [rdi + rax]; read 8 bytes
		mov rcx, rdx

		sub rcx, 0x0101010101010101
		not rdx
		and rdx, 0x8080808080808080
		jnz .find_zero

		add rax, 8
		jmp .align_loop

	.find_zero:
		mov rcx, rdi
		add rcx, rax
		xor rdx, rdx

	.byte_loop:
		cmp byte [rcx + rdx], 0
		je .done
		inc rdx
		jmp .byte_loop

	.done:
		add rax, rdx
		ret

	.null_pointer:
		mov rax, -1
		ret

section .note.GNU-stack noalloc noexec nowrite progbits
