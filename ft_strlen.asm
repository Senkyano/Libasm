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

		xor rax, rax
	.loop:
		cmp byte [rdi + rax], 0
		je .done
		inc rax
		jmp .loop
	.done:
		ret
		.null_pointer:
			mov rax, 0
			ret

section .note.GNU-stack noalloc noexec nowrite progbits
