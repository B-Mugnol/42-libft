/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_atoi.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bmugnol- <bmugnol-@student.42sp.org.br>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/09/26 16:08:00 by bmugnol-          #+#    #+#             */
/*   Updated: 2021/09/27 22:44:23 by bmugnol-         ###   ########.fr       */
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
	int	sign;
	int	num;

	num = 0;
	sign = 1;
	while (ft_isspace(*s))
		s++;
	if (*s == '-')
	{
		sign = -1;
		s++;
	}
	else if (*s == '+')
		s++;
	while (*s >= '0' && *s <= '9')
	{
		num = 10 * num + *s - '0';
		if (s[1] >= 48 && s[1] <= 57 && num * 10 + s[1] - 48 < 0 && sign == 1)
			return (2147483647);
		if (s[1] >= 48 && s[1] <= 57 && num * 10 + s[1] - 48 < 0 && sign == -1)
			return (-2147483648);
		s++;
	}
	return (num * sign);
}
