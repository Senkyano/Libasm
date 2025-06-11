;# **************************************************************************** #
;#                                                                              #
;#                                                         :::      ::::::::    #
;#    ft_strcmp.asm                                      :+:      :+:    :+:    #
;#                                                     +:+ +:+         +:+      #
;#    By: rihoy <rihoy@student.42.fr>                +#+  +:+       +#+         #
;#                                                 +#+#+#+#+#+   +#+            #
;#    Created: 2025/06/10 16:24:33 by rihoy             #+#    #+#              #
;#    Updated: 2025/06/10 16:24:34 by rihoy            ###   ########.fr        #
;#                                                                              #
;# **************************************************************************** #

bits 64

; rdi pointer first string
; rsi pointer second string

global ft_strcmp
	ft_strcmp:
		xor al, al;									initialised al
		xor rcx, rcx;								initialised rcx to 0
	
	.loop:
		mov al, byte [rdi + rcx];						we can't cmp a memory to memory that why we need to put in a register
		mov bl, byte [rsi + rcx];

		cmp	al, 0
		je	.end_function ; 							Jump if equal 0 to end_function
		cmp	bl, 0
		je	.end_function
		cmp al, bl
		jne	.end_function

		inc	rcx
		jmp	.loop

	.end_function: ;									return a 8bits memory = char
		movzx eax, al
		movzx ebx, bl

		sub eax, ebx
		ret

