/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strtrim.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bmugnol- <bmugnol-@student.42sp.org.br>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/09/27 15:24:16 by bmugnol-          #+#    #+#             */
/*   Updated: 2021/09/29 13:39:49 by bmugnol-         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

char	*ft_strtrim(char const *s1, char const *set)
{
	char	*start;
	char	*end;

	if (ft_strlen(set) == 0)
		return (ft_substr(s1, 0, ft_strlen(s1)));
	start = (char *)(s1);
	end = (char *)(s1 + ft_strlen(s1) - 1);
	while (ft_strchr(set, *start) != NULL && *start != '\0')
		start++;
	while (ft_strchr(set, *end) != NULL && end > start)
		end--;
	return (ft_substr(start, 0, end - start + 1));
}
