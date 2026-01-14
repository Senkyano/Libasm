/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libasm.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rihoy <rihoy@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/06/12 00:19:16 by rihoy             #+#    #+#             */
/*   Updated: 2026/01/14 21:33:47 by rihoy            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#pragma once

# include <stdio.h>
# include <unistd.h>
# include <stddef.h>

ssize_t ft_write(int fd, const char *str, size_t count);
ssize_t ft_read(int fd, void *buffer, size_t count);
size_t  ft_strlen(const char *str);
char    *ft_strdup(const char *str);
int     ft_strcmp(const char *s1, const char *s2);
char    *ft_strcpy(char *dest, const char *src);

typedef struct s_list
{
	void	*data;
	struct	s_list *next;
}	t_list;


// Bonus
char	*ft_itoa(int number, char *base);
int		*ft_atoi_base(char* number, char *base);
int		ft_list_size(t_list *begin_list);
void	ft_list_push_front(t_list **begin_list, void *data);
void	ft_list_sort(t_list **begin_list, int (*cmp)());
void	ft_list_remove_if(t_list **begin_list, void	*data_ref, int (*cmp)(), void (*free_fct)(void *));
