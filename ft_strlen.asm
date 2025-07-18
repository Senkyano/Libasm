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

section .text ;						excutable code
	global ft_strlen

	; Function ft_strlen
	ft_strlen:
		cmp rdi, 0
		je .null_pointer

		xor rax, rax; 				Initialised registre rax to 0

	.loop:
		cmp	byte [rdi + rax], 0; 	Compare the pointer + index to compare if this bytes equal NULL or 0
		je	.return; 					if is this equal go to return
		inc	rax; 					increment len of the string with registre
		jmp	.loop; 					go to .loop

	.return:
		ret ; 						return

	.null_pointer:
		mov rax, -1
		ret

section .note.GNU-stack noalloc noexec nowrite progbits
