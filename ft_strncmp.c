/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strncmp.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bmugnol- <bmugnol-@student.42sp.org.br>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/09/24 15:23:16 by bmugnol-          #+#    #+#             */
/*   Updated: 2021/09/26 14:48:14 by bmugnol-         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

int	ft_strncmp(const char *s1, const char *s2, size_t size)
{
	size_t			i;
	unsigned char	*cast_s1;
	unsigned char	*cast_s2;

	cast_s1 = (unsigned char *)(s1);
	cast_s2 = (unsigned char *)(s2);
	if (size == 0)
		return (0);
	i = 0;
	while (i < size && *(cast_s1 + i) != '\0' && *(cast_s2 + i) != '\0')
	{
		if (*(cast_s1 + i) - *(cast_s2 + i) != 0)
			return (*(cast_s1 + i) - *(cast_s2 + i));
		i++;
	}
	if (*(cast_s1 + i) == '\0' || *(cast_s2 + i) == '\0')
		return (*(cast_s1 + i) - *(cast_s2 + i));
	return (0);
}
