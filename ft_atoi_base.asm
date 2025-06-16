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

; need to stock lenq
section .bss
	len_base			resq 1;			len of base
	working_number		resq 1;			copy number
	negatif				resb 1;

;						rdi = integer
;						rsi = base convert to
;					if using this function you need to free this string at end of your
;	program

section .text
	global ft_atoi_base
	extern	ft_strlen, malloc, free, __errno_location;					can call outside function

	ft_atoi_base:
		cmp	rsi, 0;							if the second string is null base string convert to
		je	.null_pointer

		xor rcx, rcx;						initialised rcx

		test rdi, rdi
		jge .positiv_number;				if number is positif jmp to positif

		neg rdi;							transform negatif number in to positif
		mov [working_number], rdi;			stock the new value in working_number
		mov byte [negatif], 1;				stock value to be negatif
		inc rcx				;				increment for a '-'
		jmp .continue_treatment

	.positiv_number:
		mov byte [negatif], 0
		mov	[working_number], rdi;			copy number

	.continue_treatment
		mov rdi, rsi;						rsi transfert to rdi, for ft_strlen
		call ft_strlen;						to know len of base
		mov [len_base], rax;				stock the len of the base

	.len_number_in_string:
		mov rax, [working_number]
		cmp rax, 0
		je .malloc_string

		xor rdx, rdx
		mov rbx, [len_base]
		div rbx,							rax = quotient, rdx = reste
		push rdx;							stock reste for later
		mov [working_number], rax;			update working_number
		inc rcx;							counter of caracter
		jmp .len_number_in_string

	.malloc_string:
		mov rdi, rcx

		call malloc
		test rax, rax
		je .null_malloc

	.return:
		ret

	.null_malloc:
		mov edi, 12; 						error if malloc failed or if don't have enough space
		call __errno_location
		mov [rax], edi;						rax is the pointer of errno from __errno_location
		xor rax, rax
		ret

	.null_pointer:
		mov edi, 6;							none address
		call __errno_location
		mov [rax], edi
		xor rax, rax
		ret

section .note.GNU-stack noalloc noexec nowrite progbits
