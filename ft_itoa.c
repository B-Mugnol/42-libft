/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_itoa.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bmugnol- <bmugnol-@student.42sp.org.br>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/09/30 11:39:53 by bmugnol-          #+#    #+#             */
/*   Updated: 2021/10/11 17:30:59 by bmugnol-         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

static int	count_digits(int n)
{
	int	digit_count;

	if (n == 0)
		return (1);
	digit_count = 0;
	while (n != 0)
	{
		n /= 10;
		digit_count++;
	}
	return (digit_count);
}

static int	ft_pow(int x, int y)
{
	int	result;

	if (x == 0 && y < 0)
		return (0);
	result = 1;
	while (y > 0)
	{
		result *= x;
		y--;
	}
	while (y < 0 && x)
	{
		result /= x;
		y++;
	}
	return (result);
}

static int	ft_abs(int x)
{
	if (x < 0)
		return (-x);
	return (x);
}

static void	populate_string(int n, int digit_count, char *s, unsigned int index)
{
	while (digit_count != 0)
	{
		s[index] = ft_abs(n / ft_pow(10, digit_count - 1)) + '0';
		n = n % ft_pow(10, digit_count - 1);
		digit_count--;
		index++;
	}
	s[index] = '\0';
}

char	*ft_itoa(int n)
{
	char	*s;
	int		is_negative;
	int		digit_count;
	int		i;

	is_negative = 0;
	digit_count = count_digits(n);
	if (n < 0)
		is_negative = 1;
	s = malloc((digit_count + is_negative + 1) * sizeof (char));
	if (!s)
		return (NULL);
	i = 0;
	if (is_negative)
	{
		s[0] = '-';
		i++;
	}
	populate_string(n, digit_count, s, i);
	return (s);
}
