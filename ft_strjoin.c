/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strjoin.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bmugnol- <bmugnol-@student.42sp.org.br>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/09/27 15:09:11 by bmugnol-          #+#    #+#             */
/*   Updated: 2021/09/27 15:21:36 by bmugnol-         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

char	*ft_strjoin(char const *s1, char const *s2)
{
	char	*s3;
	size_t	size;

	size = ft_strlen(s1) + ft_strlen(s2) + 1;
	s3 = (char *)(ft_calloc(size, sizeof (char)));
	if (s3 == NULL)
		return (NULL);
	ft_strlcpy(s3, s1, size);
	ft_strlcat(s3, s2, size);
	return (s3);
}
