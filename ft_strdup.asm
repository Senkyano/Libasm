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
; il faut que j'alligne la stack a l'appel dune fonction en c

section .text
	global	ft_strdup
	extern malloc, __errno_location, ft_strlen

	ft_strdup:
		cmp rdi,0
		je .null_pointer

		push rbp                ; Sauvegarde RBP (frame pointer)
   		mov rbp, rsp            ; (Optionnel: établir une nouvelle frame, mais souvent non nécessaire pour les feuilles)
   		push rbx                ; Sauvegarde RBX (registre non-volatile)

		xor rcx, rcx;				initialised index 0
		mov rsi, rdi;				change rdi in rsi

		call ft_strlen;				call my function ft_strlen
		mov	rcx, rax
		inc rcx;					+1 to put null caracter

	.new_str:	;					create a memory case for the new string
		mov rdi, rcx
		sub rsp, 8
		call malloc
		add rsp, 8	

		test rax, rax
		je .error
		xor rcx, rcx
		mov rdi, rax
	
	.cpy_str:	;					copy the string in new emplacement memory
		mov al, [rsi + rcx];		copy the caracter in a tmp
		mov [rdi + rcx], al;		copy the caracter a the new emplacement

		cmp al, 0;					watch if it's not the end
		je .return
		inc rcx
		jmp .cpy_str

	.error:;						error if malloc failed to not enough space
		mov edi, 12
		sub rsp, 8
		call __errno_location
		add rsp, 8
		mov [rax], edi;				rax is the pointer of errno from __errno_location
		xor rax, rax
		pop rbx
		pop rbp
		ret
	
	.return:
		mov rax, rdi
		pop rbx
		pop rbp
		ret

	.null_pointer:
		mov rax, 0
		ret

section .note.GNU-stack noalloc noexec nowrite progbits
