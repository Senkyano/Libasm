/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libasm.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rihoy <rihoy@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/06/12 00:19:16 by rihoy             #+#    #+#             */
/*   Updated: 2025/09/29 16:14:59 by rihoy            ###   ########.fr       */
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

// Bonus
char	*ft_atoi_base(int number, char *base);
