/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strtrim.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bmugnol- <bmugnol-@student.42sp.org.br>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/09/27 15:24:16 by bmugnol-          #+#    #+#             */
/*   Updated: 2021/09/27 16:17:33 by bmugnol-         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

char	*ft_strtrim(char const *s1, char const *set)
{
	char	*s2;
	char	*start;
	char	*end;
	size_t	set_len;

	start = (char *)(s1);
	end = (char *)(s1) + ft_strlen(s1);
	set_len = ft_strlen(set);
	if (ft_strnstr(start, set, set_len))
		start = start + set_len;
	if (ft_strnstr(end - set_len, set, set_len))
		end = end - set_len;
	s2 = ft_calloc(end - start + 1, sizeof (char));
	ft_strlcpy(s2, start, end - start + 1);
	return (s2);
}
