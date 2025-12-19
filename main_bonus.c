/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main_bonus.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rihoy <rihoy@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/06/10 23:29:21 by rihoy             #+#    #+#             */
/*   Updated: 2025/12/19 14:16:58 by rihoy            ###   ########.fr       */
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
	if (test) {
		printf("%s\n", test);
		free(test);
	}
	test = ft_atoi_base(2147483647, "01");
	if (test) {
		printf("%s\n", test);
		free(test);
	}
	test = ft_atoi_base(-2147483648, "01");
	if (test) {
		printf("%s\n", test);
		free(test);
	}
	test = ft_atoi_base(2147483648, "01");
	if (test) {
		printf("%s\n", test);
		free(test);
	}
	return (1);
}