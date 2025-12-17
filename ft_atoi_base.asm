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

section	.data
	int_max dq 2147483647
	int_min	dq -2147483648

section .text
	global	ft_atoi_base
	extern	malloc, free, ft_strlen, __errno_location;		include external function

	ft_atoi_base:
		test	rsi, rsi
		jz		.null_base
		; limite
		cmp		rdi, 0
		jl		.negatif_number
		push rbx;			save call
		push r12
		mov rbx, rdi;		saving var
		mov r12, rsi
		mov rdi, r12
		call	ft_strlen
		cmp rax, 1
		jle	.null_base

	.negatif_number:

	.null_base:
		xor rax, rax
	.done:
		pop r12
		pop rbx
		ret

section .note.GNU-stack noexec nowrite progbits