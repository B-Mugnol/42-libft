# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bmugnol- <bmugnol-@student.42sp.org.br>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/09/27 17:20:49 by bmugnol-          #+#    #+#              #
#    Updated: 2021/09/30 11:39:57 by bmugnol-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	= libft.a

CC		= clang
CFLAGS	= 		\
		-Wall 	\
		-Wextra \
		-Werror
AR		= ar rcs

SRC	=		ft_isalpha.c	ft_isdigit.c	ft_isalnum.c	ft_isascii.c	ft_isprint.c	ft_toupper.c	ft_tolower.c\
ft_memset.c		ft_bzero.c		ft_memcpy.c		ft_memmove.c	ft_memchr.c	ft_memcmp.c\
ft_strlen.c		ft_strlcpy.c	ft_strlcat.c	ft_strchr.c		ft_strrchr.c	ft_strncmp.c	ft_strnstr.c	ft_strdup.c\
ft_calloc.c		ft_atoi.c\
ft_substr.c		ft_strjoin.c	ft_strtrim.c	ft_split.c		ft_itoa.c		#ft_strmapi.c	ft_striteri.c	ft_putchar_fd.c	ft_putstr_fd.c	ft_putendl_fd.c	ft_putnbr_fd.c
OBJ	= $(SRC:.c=.o)

all: $(NAME)

$(NAME): $(OBJ)
	$(AR) $(NAME) $(OBJ)

$(OBJ): $(SRC)
	$(CC) $(CFLAGS) -c $(SRC)

norm: $(SRC)
	norminette -R CheckForbiddenSourceHeader $(SRC)

clean:
	rm -rf $(OBJ)

fclean: clean
	rm -rf $(NAME)

re: fclean all

.PHONY: all norm clean fclean re
