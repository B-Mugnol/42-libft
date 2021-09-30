/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_split.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bmugnol- <bmugnol-@student.42sp.org.br>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/09/28 13:24:20 by bmugnol-          #+#    #+#             */
/*   Updated: 2021/09/29 21:17:19 by bmugnol-         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

static size_t	count_words(char const *s, char c, size_t len)
{
	size_t	word_count;
	size_t	c_count;
	size_t	i;

	if (!*s)
		return (0);
	i = 1;
	c_count = 0;
	word_count = 0;
	while (i < len)
	{
		if (*(s + i - 1) == c)
			c_count++;
		if (*(s + i) == c && *(s + i - 1) != c)
			word_count++;
		i++;
	}
	if (c_count == len)
		return (0);
	if (*(s + i - 1) != c)
		word_count++;
	return (word_count);
}

static void	free_matrix(void **m, size_t line_count)
{
	size_t	i;

	if (line_count == 0)
		return ;
	i = 0;
	while (i < line_count)
	{
		free(m[i]);
		i++;
	}
	free(m);
}

static char	**populate(char **dest, char const *s, char c, size_t word_count)
{
	char	**temp;
	char	*split_char;
	size_t	i;

	if (word_count != 0)
	{
		temp = ft_calloc(word_count, sizeof (char *));
		if (!temp)
			return (NULL);
		temp[0] = ft_strtrim(s, &c);
	}
	i = 0;
	while (i < word_count)
	{
		split_char = ft_strchr(temp[i], c);
		if (!split_char)
		{
			dest[i] = ft_substr(temp[i], 0, ft_strlen(temp[i]));
			i++;
			break ;
		}
		else
			dest[i] = ft_substr(temp[i], 0, split_char - temp[i]);
		i++;
		temp[i] = ft_strtrim(split_char, &c);
	}
	free_matrix((void **)(temp), word_count);
	dest[i] = NULL;
	return (dest);
}

char	**ft_split(char const *s, char c)
{
	char	**dest;
	size_t	word_count;

	if (!*s)
		word_count = 0;
	else
		word_count = count_words(s, c, ft_strlen(s));
	dest = ft_calloc(word_count + 1, sizeof (char *));
	if (!dest)
		return (NULL);
	if (!c && *s)
	{
		dest[0] = ft_substr(s, 0, ft_strlen(s));
		dest[1] = NULL;
	}
	else
		dest = populate(dest, s, c, word_count);
	if (!dest)
		return (NULL);
	return (dest);
}
