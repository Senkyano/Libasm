;# **************************************************************************** #
;#                                                                              #
;#                                                         :::      ::::::::    #
;#    ft_atoi_base.asm                                   :+:      :+:    :+:    #
;#                                                     +:+ +:+         +:+      #
;#    By: rihoy <rihoy@student.42.fr>                +#+  +:+       +#+         #
;#                                                 +#+#+#+#+#+   +#+            #
;#    Created: 2025/06/13 11:41:00 by rihoy             #+#    #+#              #
;#    Updated: 2025/06/13 11:41:18 by rihoy            ###   ########.fr        #
;#                                                                              #
;# **************************************************************************** #

bits 64

; need to stock len

section .bss
	len_base			resq 1;			len of base
	original_number		resq 1;			original_number
	working_number		resq 1;			copy number

;						rdi = integer
;						rsi = base convert to
;					if using this function you need to free this string at end of your
;	program

section .text
	global ft_atoi_base
	extern	ft_strlen, malloc, free, __errno_location;					can call outside function

	ft_atoi_base:
		cmp	rdi, 0;					if the first string is null the number to convert
		je	.null_pointer
		cmp	rsi, 0;					if the second string is null base string convert to
		je	.null_pointer

		mov	[original_number], rdi;		original number
		mov	[working_number], rdi;		copy number
		mov rdi, rsi;				rsi transfert to rdi, for ft_strlen
		call ft_strlen;				to know len of base
		mov [len_base], rax
		xor rcx, rcx

	.len_string:;							len for int convert in to string
		mov	rax, [working_number]
		test rax, rax
		je	.malloc_number

		xor rdx, rdx
		mov	rbx, [len_base];				divided by len_base
		div rbx;							call division
		mov [working_number], rax;			quotient we continue to divided this
		inc rcx;							len of string number
		jmp .len_string

	.malloc_number:
		inc	rcx
		mov rdi, rcx
		call malloc

		test rax, rax
		je	.null_malloc

	.return:
		ret

	.null_malloc:
		mov dword [rel __errno_location], 12; error if malloc failed or if don't have enough space
		xor rax, rax
		ret

	.null_pointer:
		mov dword [rel __errno_location], 6;		none address
		xor rax, rax
		ret

section .note.GNU-stack noalloc noexec nowrite progbits
