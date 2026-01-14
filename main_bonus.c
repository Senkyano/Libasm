/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main_bonus.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rihoy <rihoy@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/06/10 23:29:21 by rihoy             #+#    #+#             */
/*   Updated: 2026/01/14 18:12:16 by rihoy            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <unistd.h>
#include <stddef.h>
#include <stdlib.h>
#include <errno.h>
#include "libasm.h"

int main(void) {
	printf("TEST ATOI\n");

	char	*test;
	
	test = ft_atoi_base(42, "01");
	printf("int = %d, base = %s\n", 42, "01");
	if (test) {
		printf("pointer = %p , string = %s\n", test, test);
		free(test);
	}
	test = ft_atoi_base(2147483647, "01");
	printf("int = %d, base = %s\n", 2147483647, "01");
	if (test) {
		printf("pointer = %p , string = %s\n", test,test);
		free(test);
	}
	test = ft_atoi_base(-2147483648, "011");
	printf("int = %d, base = %s\n", -2147483647, "011");
	printf("pointeur = %p\n", test);
	if (test) {
		printf("pointer = %p , string = %s\n", test, test);
		free(test);
	}
	test = ft_atoi_base(-2147483647, "0123");
	printf("int = %d, base = %s\n", -2147483647, "0123");
	printf("pointeur = %p\n", test);
	if (test) {
		printf("pointer = %p , string = %s\n", test, test);
		free(test);
	}
	test = ft_atoi_base(2147483648, "0123456789");
	printf("int = %ld, base = %s\n", 2147483648, "0123456789");
	if (test) {
		printf("pointer = %p , string = %s\n",test, test);
		free(test);
	}
	test = ft_atoi_base(2147483647, "0123456789");
	printf("int = %d, base = %s\n", 2147483647, "0123456789");
	if (test) {
		printf("pointer = %p , string = %s\n",test, test);
		printf("resultat = 2147483647\n");
		free(test);
	}
	test = ft_atoi_base(123, "0");
	printf("int = %d, base = %s\n", 123, "0");
	printf("pointeur = %p\n", test);
	if (test) {
		printf("pointer = %p , string = %s\n", test, test);
		free(test);
	}
	test = ft_atoi_base(420, "0123456789ABCDEF");
	printf("int = %d, base = %s\n", 420, "0123456789ABCDEF");
	printf("pointeur = %p\n", test);
	if (test) {
		printf("pointer = %p , string = %s\n", test, test);
		free(test);
	}

	printf("\n\nTEST LIST_PUSH_FRONT\n");
	t_list	**l_test;
	l_test = NULL;

	printf("Pushing a NULL data while **l_test is NULL\n");
	ft_list_push_front(l_test, NULL);
	printf("pointeur = %p\n", l_test);
	l_test = malloc(sizeof(l_test));
	*l_test = NULL;
	printf("pointeur l_test = %p\n", l_test);
	printf("pointeur *l_test = %p\n", *l_test);
	ft_list_push_front(l_test, NULL);
	printf("Pushing a NULL data\n");
	printf("pointeur *l_test = %p\n", *l_test);
	free(*l_test);
	free(l_test);

	printf("\n\nTEST LIST_SIZE\n");
	t_list	**l_test2;
	l_test2 = malloc(sizeof(l_test2));
	*l_test2 = NULL;
	printf("size = %d\n", ft_list_size(*l_test2));
	printf("add 1 time a node\n");
	ft_list_push_front(l_test2, NULL);
	printf("size = %d\n",ft_list_size(*l_test2));
	printf("add 5 time a node\n");
	ft_list_push_front(l_test2, NULL);
	ft_list_push_front(l_test2, NULL);
	ft_list_push_front(l_test2, NULL);
	ft_list_push_front(l_test2, NULL);
	ft_list_push_front(l_test2, NULL);
	printf("size = %d\n", ft_list_size(*l_test2));
	t_list	*p = (*l_test2);
	while (1)
	{
		t_list	*p2 = p->next;
		free(p);
		if (!p2)
		break;
		p = p2;
	}
	free(l_test2);
	return (1);
}