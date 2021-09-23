/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_memset.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bmugnol- <bmugnol-@student.42sp.org.br>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/09/23 16:26:01 by bmugnol-          #+#    #+#             */
/*   Updated: 2021/09/23 19:22:02 by bmugnol-         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

void	*ft_memset(void *str, int c, size_t n)
{
	char			*p;
	unsigned char	cast_c;

	p = (char *)(str);
	cast_c = (unsigned char)(c);
	while (n > 0)
	{
		*p = cast_c;
		p++;
		n--;
	}
	return (str);
}
