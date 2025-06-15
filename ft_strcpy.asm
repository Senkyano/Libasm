;# **************************************************************************** #
;#                                                                              #
;#                                                         :::      ::::::::    #
;#    ft_strcpy.asm                                      :+:      :+:    :+:    #
;#                                                     +:+ +:+         +:+      #
;#    By: rihoy <rihoy@student.42.fr>                +#+  +:+       +#+         #
;#                                                 +#+#+#+#+#+   +#+            #
;#    Created: 2025/06/11 00:40:16 by rihoy             #+#    #+#              #
;#    Updated: 2025/06/11 00:40:17 by rihoy            ###   ########.fr        #
;#                                                                              #
;# **************************************************************************** #

bits 64

; first string is the destination
; second string sources
; to use properly you need to alloc the first string with equal octet of the second

section .text
	global ft_strcpy

	ft_strcpy:
		xor rcx, rcx;					initialised index to 0

	.loop_cpy:
		cmp	byte [rsi + rcx], 0;				Compare pointer index char if it not 0
		je .return;						if equal go in return
		mov al, [rsi + rcx];			copy in tmp
		mov [rdi + rcx], al;			at string dest cpy tmp
		inc rcx;						increment index
		jmp .loop_cpy

	.return:
		mov byte [rdi + rcx], 0;				set the last element at null
		mov rax, rdi;					rax equal pointer of dest
		ret

section .note.GNU-stack noalloc noexec nowrite progbits
