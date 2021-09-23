/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_memmove.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bmugnol- <bmugnol-@student.42sp.org.br>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/09/23 17:53:31 by bmugnol-          #+#    #+#             */
/*   Updated: 2021/09/23 19:57:05 by bmugnol-         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

void	*ft_memmove(void *dest, const void *src, size_t n)
{
	char	*cast_src;
	char	*cast_dest;
	size_t	i;

	cast_src = (char *)(src);
	cast_dest = (char *)(dest);
	i = 0;
	if (src > dest)
	{
		while (i < n)
		{
			*(cast_dest + i) = *(cast_src + i);
			i++;
		}
	}
	else if (dest > src)
	{
		while (i < n)
		{
			*(cast_dest + n - i - 1) = *(cast_src + n - i - 1);
			i++;
		}
	}
	return (dest);
}
