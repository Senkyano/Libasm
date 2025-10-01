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

;| Registre ;| Usage                                                        |
;| -------- ;| ------------------------------------------------------------ |
;| `rdi`    ;| base string pour `ft_strlen`                                 |
;| `rsi`    ;| base string d'origine                                        |
;| `r11`    ;| working\_number                                              |
;| `r10`    ;| 0 = positif, 1 = négatif                                     |
;| `r12`    ;| len de la base                                               |
;| `rcx`    ;| compteur pour malloc (len chaîne + signe éventuel)           |
;| `rdx`    ;| reste de la division (à push pour construction de la chaîne) |

section .text
	global	ft_atoi_base
	extern	malloc, free, ft_strlen, __errno_location;		include external function

	ft_atoi_base:
		xor	rcx, rcx;						initialised compteur at 0
		cmp rsi, 0;							check if string is null
		je	.string_base_null

		cmp rdi, 2147483647;				only INT_MIN to INT_MAX
		jg	.overflow
		cmp rdi, -2147483648;
		jl	.overflow

		movsxd r11, edi;					Sign-extend edi (32-bit signed) → r11 (64-bit signed)
		mov r10, 0;							initialised at 0 to know positiviti
		mov rdi, rsi;						rdi stock the string base

		xor rax, rax

	.end:
		ret

	.end_negatif:
		dec rcx
		mov byte [rax + rcx], '-'
		jmp	.end
; 									error
	.malloc_fail:
		mov edi, 12;						ERROR Malloc not enough space
		jmp .calling_errno

	.string_base_null:
		mov edi, 101;						error null address
		jmp .calling_errno

	.overflow:
		mov edi, 132
		jmp .calling_errno

	.error_other:
		mov edi, 131
		jmp .calling_errno

	.calling_errno:
		call __errno_location
		mov [rax], edi
		xor rax, rax
		ret

section .note.GNU-stack noexec nowrite progbits