/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main_bonus.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rihoy <rihoy@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/06/10 23:29:21 by rihoy             #+#    #+#             */
/*   Updated: 2026/01/21 14:17:50 by rihoy            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <unistd.h>
#include <stddef.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>
#include "libasm.h"

int	cmp_fnct(void 	*data_ref, void *data) {
	if (data_ref == data)
		return (0);
	return (1);
}

int main(void) {
	printf("TEST ATOI\n");
	
	printf(RED"\n Test null string\n\n"RST);
	printf(CY"\nresult = %d"RST",	Base = 01, number = NULL\n", ft_atoi_base(NULL, "01"));
	printf(GR"expected result = 0\n"RST);
	printf(CY"\nresult = %d"RST", 	Base = NULL, number = 11\n", ft_atoi_base("11", NULL));
	printf(GR"expected result = 0\n"RST);
	printf(CY"\nresult = %d"RST", 	Base = NULL, number = NULL\n", ft_atoi_base(NULL, NULL));
	printf(GR"expected result = 0\n"RST);
	printf("\n Test whitespace string\n");	
	printf(CY"\nresult = %d"RST",	Base = Decimal, number = '  	14'\n", ft_atoi_base("  	14", "0123456789"));
	printf(GR"expected result = 14\n"RST);
	printf(CY"\nresult = %d"RST", 	Base = Decimal, number = ' 11   12'\n", ft_atoi_base(" 11   12", "0123456789"));
	printf(GR"expected result = 11\n"RST);
	printf(RED"\n Test duplicate character\n"RST);	
	printf(CY"\nresult = %d"RST", 	Base = 112, number = ' 11   12'\n", ft_atoi_base(" 11   12", "112"));
	printf(GR"expected result = 0\n"RST);

	// 11 base 01
	printf("\n Test normal string\n");
	printf(CY"\nresult = %d"RST", 	Base = 01, number = 11\n", ft_atoi_base("11", "01"));
	printf(GR"expected result = 3\n"RST);
	printf(CY"\nresult = %d"RST", 	Base = 01, number = 1111111111111111111111111111111\n", ft_atoi_base("1111111111111111111111111111111","01"));
	printf(GR"expected result = 2147483647\n"RST);
	printf(CY"\nresult = %d"RST", 	Base = 01, number = -10000000000000000000000000000000\n", ft_atoi_base("-10000000000000000000000000000000","01"));
	printf(GR"expected result = -2147483648\n"RST);
	printf(CY"\nresult = %d"RST", 	Base = Decimal, number = -2147483648\n", ft_atoi_base("-2147483648","0123456789"));
	printf(GR"expected result = -2147483648\n"RST);
	printf(CY"\nresult = %d"RST", 	Base = Decimal, number = 21474836487\n", ft_atoi_base("2147483647","0123456789"));
	printf(GR"expected result = 2147483647\n"RST);
	printf(RED"INT_MAX + 1\n"RST);
	printf(CY"result = %d"GR", expected result = %d\n"RST, ft_atoi_base("21474836488", "0123456789"), atoi("21474836488"));
	printf(RED"INT_MIN - 1\n"RST);
	printf(CY"result = %d"GR", expected result = %d\n"RST, ft_atoi_base("-21474836489", "0123456789"), atoi("-21474836489"));
	
	printf("\n\nTEST LIST_SIZE && TEST LIST_PUSH_FRONT\n");


	t_list	*list_p;
	t_list	boucle;
	t_list	second_node;
	second_node.next = &boucle;
	boucle.next = &second_node;
	list_p = malloc(sizeof(t_list));
	list_p->data = NULL;
	list_p->next = NULL;
	printf(CY"result size = %d"GR" expected = 1\n"RST,ft_list_size(list_p));
	printf(CY"result size = %d"GR" expected = 2\n"RST,ft_list_size(&boucle));
	printf("%p\n", list_p->data);
	for (int i = 0; i < 10; i++) {
		if (i % 2 == 1)
			ft_list_push_front(&list_p, &i);
		else
			ft_list_push_front(&list_p, NULL);
	}
	printf(CY"result size = %d"GR" expected = 11\n"RST,ft_list_size(list_p));
	t_list	*tmp2;

	tmp2 = list_p;
	while (tmp2) {
		printf(Y"%p\n"RST, tmp2->data);
		tmp2 = tmp2->next;		
	}
	printf(BLU"call ft_list_remove_if\n");
	ft_list_remove_if(&list_p, NULL, &cmp_fnct, NULL);
	while (list_p) {
		tmp2 = list_p;
		printf(GR"%p\n"RST, tmp2->data);
		list_p = list_p->next;
		free(tmp2);
	}

	return (1);
}