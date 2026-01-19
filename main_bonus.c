/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main_bonus.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rihoy <rihoy@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/06/10 23:29:21 by rihoy             #+#    #+#             */
/*   Updated: 2026/01/18 15:38:38 by rihoy            ###   ########.fr       */
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
	
	printf(CY"\nresult = %d"RST",	Base = 01, number = NULL\n", ft_atoi_base(NULL, "01"));
	printf(GR"expected result = 0\n"RST);
	printf(CY"\nresult = %d"RST", 	Base = NULL, number = 11\n", ft_atoi_base("11", NULL));
	printf(GR"expected result = 0\n"RST);
	
	printf("\n\nTEST LIST_PUSH_FRONT\n");

	printf("\n\nTEST LIST_SIZE\n");

	return (1);
}