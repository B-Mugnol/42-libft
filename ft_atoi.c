/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_atoi.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bmugnol- <bmugnol-@student.42sp.org.br>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/09/26 16:08:00 by bmugnol-          #+#    #+#             */
/*   Updated: 2021/09/29 22:49:32 by bmugnol-         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

static int	ft_isspace(char c)
{
	if (c == 32 || (c >= 9 && c <= 13))
		return (1);
	return (0);
}

int	ft_atoi(const char *s)
{
	int	num;
	int	sign;

	num = 0;
	sign = 1;
	while (ft_isspace(*s))
		s++;
	if (*s == '-')
		sign = -1;
	if (*s == '+' || *s == '-')
		s++;
	while (ft_isdigit(*s))
	{
		num = 10 * num + *s - '0';
		if (ft_isdigit(*(s + 1)) && 10 * num + *(s + 1) - '0' < 0 && sign == 1)
			return (2147483647);
		if (ft_isdigit(*(s + 1)) && 10 * num + *(s + 1) - '0' < 0 && sign == -1)
			return (-2147483648);
		s++;
	}
	return (num * sign);
}
