;# **************************************************************************** #
;#                                                                              #
;#                                                         :::      ::::::::    #
;#    ft_list_sort.asm                                   :+:      :+:    :+:    #
;#                                                     +:+ +:+         +:+      #
;#    By: rihoy <rihoy@student.42.fr>                +#+  +:+       +#+         #
;#                                                 +#+#+#+#+#+   +#+            #
;#    Created: 2025/06/15 22:20:56 by rihoy             #+#    #+#              #
;#    Updated: 2025/06/15 22:20:57 by rihoy            ###   ########.fr        #
;#                                                                              #
;# **************************************************************************** #

bits 64

; return the front pointer
; first arg is the list
; structure need to be
; typedef struct	s_node
; {
;		void			*data; in the 8 first octets
;		struct s_node	*next; in address 8 octets (+8offset)
; }					t_node;

section .text
	global	ft_list_sort

	ft_list_sort:
		
