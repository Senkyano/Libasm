;# **************************************************************************** #
;#                                                                              #
;#                                                         :::      ::::::::    #
;#    ft_list_push_front.asm                             :+:      :+:    :+:    #
;#                                                     +:+ +:+         +:+      #
;#    By: rihoy <rihoy@student.42.fr>                +#+  +:+       +#+         #
;#                                                 +#+#+#+#+#+   +#+            #
;#    Created: 2025/06/15 17:29:18 by rihoy             #+#    #+#              #
;#    Updated: 2025/06/15 17:29:19 by rihoy            ###   ########.fr        #
;#                                                                              #
;# **************************************************************************** #

bits 64

; return the pointer to the front
; first arg is the new one to add at the front
; second arg is the old one first of the list
; structure need to be
; typedef struct	s_node
; {
;		void			*data; in the 8 first octets
;		struct s_node	*next; in address 8 octets (+8offset)
; }					t_node;

section .text
	global	ft_list_push_front
	
	ft_list_push_front:
		test rdi, rdi;				test if first element == NULL ?
		jz	.return_rsi

		mov	rax, rdi;
		mov [rax + 8], rsi;			node->next = rsi
		ret

	.return_rsi:
		mov rax, rsi;				return the second node
		ret

section .note.GNU-stack noalloc noexec nowrite progbits
