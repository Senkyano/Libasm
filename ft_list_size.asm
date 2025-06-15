;# **************************************************************************** #
;#                                                                              #
;#                                                         :::      ::::::::    #
;#    ft_list_size.asm                                   :+:      :+:    :+:    #
;#                                                     +:+ +:+         +:+      #
;#    By: rihoy <rihoy@student.42.fr>                +#+  +:+       +#+         #
;#                                                 +#+#+#+#+#+   +#+            #
;#    Created: 2025/06/15 22:13:33 by rihoy             #+#    #+#              #
;#    Updated: 2025/06/15 22:13:34 by rihoy            ###   ########.fr        #
;#                                                                              #
;# **************************************************************************** #

bits 64

; return the length of the list
; first arg is the list
; structure need to be
; typedef struct	s_node
; {
;		void			*data; in the 8 first octets
;		struct s_node	*next; in address 8 octets (+8offset)
; }					t_node;

section	.text
	global	ft_list_size

	ft_list_size:
		xor rcx, rcx

	.loop_count:
		test rdi, rdi
		jz	.null_pointer
		inc rcx
		mov rdi, [rdi + 8]
		jmp .loop_count

	.null_pointer:
		mov rax, rcx
		ret
