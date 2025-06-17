;# **************************************************************************** #
;#                                                                              #
;#                                                         :::      ::::::::    #
;#    ft_atoi_base.asm                                   :+:      :+:    :+:    #
;#                                                     +:+ +:+         +:+      #
;#    By: rihoy <rihoy@student.42.fr>                +#+  +:+       +#+         #
;#                                                 +#+#+#+#+#+   +#+            #
;#    Created: 2025/06/17 15:26:42 by rihoy             #+#    #+#              #
;#    Updated: 2025/06/17 15:26:43 by rihoy            ###   ########.fr        #
;#                                                                              #
;# **************************************************************************** #

bits 64

section .data
	negatif		db 0;			initialised at 0 for positif

section .bss;					not initialised but jut alloed data
	len_base		resb 1;
	working_number	resb 1;

section .text
	global	ft_atoi_base
	extern	malloc, free, __errno_location, ft_strlen;		include external function

	ft_atoi_base:
		xor rcx, rcx
		cmp rsi, 0
		je	.string_base_null

	.malloc_fail:
		mov edi, 12
		call __errno_location
		mov [rax], edi
		xor rax, rax
		ret

	.string_base_null:
		mov edi, 101
		call __errno_location
		mov [rax], edi
		xor rax, rax
		ret

section .note.GNU-stack noalloc noexec nowrite progbits