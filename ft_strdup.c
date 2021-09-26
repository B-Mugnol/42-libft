/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strdup.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bmugnol- <bmugnol-@student.42sp.org.br>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/09/26 15:30:22 by bmugnol-          #+#    #+#             */
/*   Updated: 2021/09/26 16:02:10 by bmugnol-         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

char	*ft_strdup(const char *s)
{
	char 	*dest;
	size_t	len;

	len = ft_strlen(s);
	dest = (char *)(ft_calloc((len + 1), sizeof (char)));
	return (ft_memmove(dest, s, len + 1));
}
