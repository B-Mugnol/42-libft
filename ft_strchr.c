/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strchr.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bmugnol- <bmugnol-@student.42sp.org.br>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/09/24 13:21:13 by bmugnol-          #+#    #+#             */
/*   Updated: 2021/09/24 14:23:34 by bmugnol-         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

char	*ft_strchr(const char *s, int c)
{
	size_t	i;
	char	cast_c;

	cast_c = (char)(c);
	i = 0;
	while (*(s + i) != '\0')
	{
		if (*(s + i) == cast_c)
			return ((char *)(s + i));
		i++;
	}
	if (cast_c == '\0')
		return ((char *)(s + i));
	return (NULL);
}
