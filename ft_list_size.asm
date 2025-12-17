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
		xor rax, rax
		test rdi, rdi
		jz	.done

	.loop_count:
		inc rax
		mov rdi, [rdi + 8]
		test rdi, rdi
		jnz .loop_count

	.done:
		ret

section .note.GNU-stack noalloc noexec nowrite progbits