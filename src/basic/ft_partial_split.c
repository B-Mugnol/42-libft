/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_partial_split.c                                 :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bmugnol- <bmugnol-@student.42sp.org.br>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/03/08 22:19:43 by bmugnol-          #+#    #+#             */
/*   Updated: 2022/03/15 01:18:37 by bmugnol-         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

static size_t		count_words(char const *s, char delimiter, char stopper);
static char const	*separator(char const *s, char **dest, char delimiter,
						char stopper);

char	**ft_partial_split(char const *s, char delimiter, char stopper)
{
	char	**dest;
	size_t	i;
	size_t	j;

	if (!s)
		return (NULL);
	dest = malloc((count_words(s, delimiter, stopper) + 1) * sizeof (char *));
	if (!dest)
		return (NULL);
	i = 0;
	j = 0;
	while (s[i] != '\0' && j < count_words(s, delimiter, stopper))
	{
		i = separator(s + i, dest + j, delimiter, stopper) - s;
		if (!dest[j])
		{
			ft_free_matrix((void *)(&dest), j);
			return (NULL);
		}
		j++;
	}
	dest[j] = NULL;
	return (dest);
}

static size_t	count_words(char const *s, char delimiter, char stopper)
{
	size_t	word_count;
	size_t	i;
	size_t	j;

	i = -1;
	word_count = 0;
	while (s[++i] != '\0')
	{
		if (s[i] == stopper)
		{
			word_count++;
			j = 1;
			while (s[i + j] != stopper && s[i + j] != '\0')
				j++;
			if (i > 0 && s[i - 1] != delimiter && s[i + j] != '\0')
				word_count++;
			i += j;
			if (s[i] == '\0')
				break ;
		}
		else if (s[i] != delimiter && (s[i + 1] == delimiter
				|| s[i + 1] == '\0'))
			word_count++;
	}
	return (word_count);
}

static char const	*separator(char const *s, char **dest, char delimiter,
	char stopper)
{
	size_t	i;
	size_t	k;

	i = 0;
	while (s[i] == delimiter && s[i] != '\0')
		i++;
	if (s[i] == '\0')
		return (s + i);
	k = 0;
	if (s[i] == stopper)
	{
		while ((s[i + k] != stopper && s[i + k] != '\0') || k == 0)
			k++;
		if (k == 1)
			*dest = ft_substr(s, i, k);
		else if (s[i + k] == '\0')
			*dest = ft_substr(s, i + 1, k - 1);
		else
			*dest = ft_substr(s, ++i, k - 1);
		return (s + i + k);
	}
	while (s[i + k] != delimiter && s[i + k] != stopper && s[i + k] != '\0')
		k++;
	*dest = ft_substr(s, i, k);
	return (s + i + k);
}
