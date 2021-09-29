/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_split.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bmugnol- <bmugnol-@student.42sp.org.br>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/09/28 13:24:20 by bmugnol-          #+#    #+#             */
/*   Updated: 2021/09/29 13:20:31 by bmugnol-         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

static size_t	countsplits(char const *s, char c)
{
	size_t	count;
	char	*p;

	count = 0;
	p = (char *)(s);
	while (*p != '\0')
	{
		if (*p == c && p == s)
			count--;
		if (*p == c && *(p + 1) != c)
			count++;
		p++;
	}
	if (*(p - 1) != c)
		count++;
	return (count);
}

char	**ft_split(char const *s, char c)
{
	char	**s2;
	char	*temp;
	char	*split_char;
	size_t	i;
	size_t	split_count;

	split_count = countsplits(s, c);
	printf("\n%zu\n", split_count);
	s2 = ft_calloc(split_count + 1, sizeof (char));
	if (!s2)
		return (NULL);
	temp = ft_strtrim(s, &c);
	if (!temp)
		return (NULL);
	if (split_count == 0)
	{
		free(temp);
		s2[0] = ft_strtrim(s, &c);
		s2[1] = NULL;
		return (s2);
	}
	i = 0;
	while (i < split_count)
	{
		split_char = ft_strchr(temp, c);
		if (!split_char)
		{
			s2[i] = ft_substr(temp, 0, ft_strlen(temp));
			free(temp);
			i++;
			break ;
		}
		else
		{
			s2[i] = ft_substr(temp, 0, split_char - temp + 1);
			free(temp);
		}
		i++;
		temp = ft_strtrim(split_char, &c);
	}
	s2[i] = NULL;
	return (s2);
}
