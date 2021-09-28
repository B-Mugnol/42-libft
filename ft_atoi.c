/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_atoi.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bmugnol- <bmugnol-@student.42sp.org.br>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/09/26 16:08:00 by bmugnol-          #+#    #+#             */
/*   Updated: 2021/09/27 23:47:11 by bmugnol-         ###   ########.fr       */
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
	unsigned int	num;
	int				sign;
	int				count;

	num = 0;
	count = 0;
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
		count++;
		s++;
	}
	if (count == 10 && num <= 2147483647)
		return (num * sign);
	if (count >= 10 && sign == 1)
		return (2147483647);
	if (count >= 10 && sign == -1)
		return (-2147483648);
	return (num * sign);
}
