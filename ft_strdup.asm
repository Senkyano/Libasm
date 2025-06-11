;# **************************************************************************** #
;#                                                                              #
;#                                                         :::      ::::::::    #
;#    ft_strdup.asm                                      :+:      :+:    :+:    #
;#                                                     +:+ +:+         +:+      #
;#    By: rihoy <rihoy@student.42.fr>                +#+  +:+       +#+         #
;#                                                 +#+#+#+#+#+   +#+            #
;#    Created: 2025/06/11 00:40:00 by rihoy             #+#    #+#              #
;#    Updated: 2025/06/11 00:40:01 by rihoy            ###   ########.fr        #
;#                                                                              #
;# **************************************************************************** #

bits 64

section .text
	global	ft_strdup
	extern malloc, errno

	ft_strdup:
		xor rcx, rcx;				initialised index 0
		mov rsi, rdi;				change rdi in rsi

	.len_str:	;					boucle to count len
		cmp byte [rdi + rcx], 0;
		je .new_str
		inc rcx
		jmp .len_str

	.new_str	;					create a memory case for the new string
		inc rcx
		mov rdi, rcx
		call malloc

		test rax, rax
		je .error
		xor rcx, rcx
		mov rdi, rax
	
	.cpy_str:	;					copy the string in new emplacement memory
		mov al, [rsi + rcx];		copy the caracter in a tmp
		mov [rdi + rcx], al			copy the caracter a the new emplacement

		cmp al, 0;					watch if it's not the end
		je .return
		inc rcx
		jmp .cpy_str

	.error:;						error if malloc failed to not enough space
		mov dword [rel errno], 12
		xor rax, rax
		ret
	
	.return:
		mov rax, rdi
		ret