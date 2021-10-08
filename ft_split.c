/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_split.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bmugnol- <bmugnol-@student.42sp.org.br>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/09/28 13:24:20 by bmugnol-          #+#    #+#             */
/*   Updated: 2021/10/08 11:57:09 by bmugnol-         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

static size_t	count_words(char const *s, char c)
{
	size_t	word_count;
	size_t	i;

	if (!*s)
		return (0);
	i = 0;
	word_count = 0;
	while (*(s + i) != '\0')
	{
		if (*(s + i) != c && (*(s + i + 1) == c || *(s + i + 1) == '\0'))
			word_count++;
		i++;
	}
	return (word_count);
}

static size_t	count_not_char(char const *s, char c)
{
	size_t	i;

	if (!*s)
		return (0);
	i = 0;
	while (*(s + i) != '\0' && *(s + i) != c)
		i++;
	return (i);
}

// static void	free_matrix(void **m, size_t line_count)
// {
// 	size_t	i;

// 	if (line_count == 0)
// 		return ;
// 	i = 0;
// 	while (i < line_count)
// 	{
// 		free(m[i]);
// 		i++;
// 	}
// 	free(m);
// }

char	**ft_split(char const *s, char c)
{
	char	**dest;
	size_t	valid_char_count;
	size_t	i;
	size_t	j;

	if (!s)
		return (NULL);
	dest = ft_calloc(count_words(s, c) + 1, sizeof (char *));
	if (!dest)
		return (NULL);
	i = 0;
	j = 0;
	while (*(s + i) != '\0')
	{
		while (*(s + i) == c && *(s + i) != '\0')
			i++;
		if (*(s + i) == '\0')
			break ;
		valid_char_count = count_not_char(s + i, c);
		dest[j] = ft_substr(s, i, valid_char_count);
		i += valid_char_count;
		j++;
	}
	dest[j] = NULL;
	return (dest);
}
