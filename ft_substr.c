/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_substr.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bmugnol- <bmugnol-@student.42sp.org.br>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/09/27 13:28:33 by bmugnol-          #+#    #+#             */
/*   Updated: 2021/09/27 21:24:21 by bmugnol-         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

char	*ft_substr(char const *s, unsigned int start, size_t len)
{
	size_t	i;
	size_t	s_len;
	char	*substr;

	s_len = ft_strlen(s);
	if (start > s_len)
	{
		substr = (char *)(ft_calloc(1, sizeof (char)));
		return (substr);
	}
	if (s_len - start < len)
		len = s_len - start;
	substr = (char *)(malloc(len + 1 * sizeof (char)));
	if (!substr)
		return (NULL);
	i = 0;
	while (i < len)
	{
		*(substr + i) = *(s + start + i);
		i++;
	}
	return (substr);
}
