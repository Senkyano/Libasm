/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rihoy <rihoy@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/06/10 23:29:21 by rihoy             #+#    #+#             */
/*   Updated: 2025/06/17 16:13:00 by rihoy            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <unistd.h>
#include <stddef.h>
#include <stdlib.h>
#include <errno.h>
#include "libasm.h"

int main(void) {
	long len = 0;

	// TEST of strlen
	printf("TEST ft_strlen\n\n");
	len = ft_strlen("Hello 42World");
	printf("Lenght: %ld\n", len);

	printf("TEST ft_write\n\n");
	int err = ft_write(STDIN_FILENO, "ok\n\0", 4);
	printf("%d\n", err);

	printf("TEST ft_strcmp\n\n");
	printf("%d equal\n", ft_strcmp("ok\n", "ok\n"));
	printf("%d o - k\n", ft_strcmp("ook\n", "ok\n"));
	printf("%d k - o\n", ft_strcmp("ok\n", "ook\n"));

	printf("TEST ft_strcpy\n\n");
	char l[10];
	char k[10] = {'o', 'k' ,'f', '\0'};
	
	ft_strcpy(l, k);
	printf("%s\n", l);
	
	printf("TEST ft_strdup\n\n");
	char *le;
	le = ft_strdup("ok omg wtf\n");
	
	printf("%s\n", le);
	printf("TEST ft_read\n\n");
	char	p[1024];
	printf("%ld byte read\n", ft_read(STDOUT_FILENO, p, sizeof(p) - 1));
	printf("%s\n", p);
	printf("TEST completed\n");
	free(le);
	return (1);
}