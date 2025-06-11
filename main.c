/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rihoy <rihoy@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/06/10 23:29:21 by rihoy             #+#    #+#             */
/*   Updated: 2025/06/12 00:18:57 by rihoy            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <unistd.h>
#include <stddef.h>

extern size_t ft_strlen(const char *str);
extern char *ft_strdup(const char *str);
extern ssize_t ft_write(int fd, const char *str, size_t count);
extern ssize_t ft_read(int fd, void *buffer, size_t count);
extern int ft_strcmp(const char *str1, const char *str2);
extern char *ft_strcpy(const char *dest, const char *str);

int main(void) {
	long len = 0;

	// TEST of strlen
	len = ft_strlen("Hello 42World");
	fprintf(1, "Lenght: %l\n", len);


	return (1);
}