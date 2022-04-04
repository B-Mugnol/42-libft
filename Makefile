# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bmugnol- <bmugnol-@student.42sp.org.br>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/09/27 17:20:49 by bmugnol-          #+#    #+#              #
#    Updated: 2022/04/02 05:23:27 by bmugnol-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


# -----------------------LIBRARY---------------------------------------------- #
# Generated static library name
NAME	:=	libft.a

# -----------------------COMPILER--------------------------------------------- #
# C Compiler
CC		:=	gcc
# Compiler flags
CFLAGS	:=	-Wall -Wextra -Werror
#	(Turn on all warning flags and extra warnings, treat warnings as errors)

# -----------------------ARCHIVER--------------------------------------------- #
# Archiver
AR		:= 	ar
# Archiver flags
ARFLAGS	:=	rcs
#	(Inserts files with replacement, creates the archive if not existent,
#		add index to archive)

# -----------------------HEADERS---------------------------------------------- #
# Headers files
HEADER_FILE	:=	libft.h ft_printf.h
# Headers directories
HEADER_DIR	:=	inc

# -----------------------PRECOMPILED HEADERS---------------------------------- #
# Compiled headers files
C_HEADER_FILE	:=	$(HEADER_FILE:.h=.h.gch)
# Compiled headers directory
C_HEADER_DIR	:=	pre
# Compiled headers file path
C_HEADER		:=	$(addprefix $(C_HEADER_DIR)/, $(C_HEADER_FILE))
# Compiled headers inclusion
C_INCLUDE		:=	$(addprefix -I, $(C_HEADER_DIR))

# -----------------------SOURCES---------------------------------------------- #
# Source directories
SRC_DIR		:=	src src/basic src/bonus src/ft_printf
# Files:
####<ctype.h>
SRC_FILE	:=	ft_isalpha.c	ft_isalnum.c	ft_isascii.c	ft_isdigit.c\
				ft_isprint.c	ft_toupper.c	ft_tolower.c
###	<stdlib.h>
SRC_FILE	+=	ft_atoi.c	ft_calloc.c
###	<strings.h>
SRC_FILE	+=	ft_bzero.c
###	<string.h>
SRC_FILE	+=	ft_memchr.c		ft_memcmp.c		ft_memcpy.c		ft_memmove.c\
				ft_memset.c 	# Memory
SRC_FILE	+=	ft_strlen.c		ft_strdup.c		ft_strchr.c		ft_strrchr.c\
				ft_strncmp.c	# Strings
SRC_FILE	+=	ft_strlcpy.c	ft_strlcat.c	ft_strnstr.c	# <bsd/string.h>
###	Libft specific
SRC_FILE	+=	ft_substr.c		ft_strjoin.c	ft_strtrim.c	ft_split.c	\
				ft_strmapi.c	ft_striteri.c
###	Libft specific
SRC_FILE	+=	ft_putchar_fd.c	ft_putstr_fd.c	ft_putendl_fd.c	ft_putnbr_fd.c
###	Custom
SRC_FILE	+=	ft_itoa.c		ft_utoa.c		ft_ptoa.c		ft_xtoa.c	\
				ft_xto_uppercase_a.c			# To string
SRC_FILE	+=	get_next_line.c	ft_null_free.c	ft_free_matrix.c			\
				ft_strmerge.c	ft_atoi_base.c	ft_free_char_matrix.c		\
				ft_partial_split.c				# Miscellaneous
###	Linked list
SRC_FILE	+=	ft_lstnew.c			ft_lstsize.c		ft_lstlast.c		\
				ft_lstadd_front.c	ft_lstadd_back.c	ft_lstdelone.c		\
				ft_lstclear.c		ft_lstiter.c		ft_lstmap.c
###	ft_printf
SRC_FILE	+=	ft_printf.c

# -----------------------OBJECTS---------------------------------------------- #
# Object directory
OBJ_DIR	:=	obj
# Object files
OBJ		:=	$(SRC_FILE:%.c=$(OBJ_DIR)/%.o)

# -----------------------RULES------------------------------------------------ #
vpath	%.h	$(HEADER_DIR)
vpath	%.c	$(SRC_DIR)

.PHONY: all norm clean fclean re

# Creates the target NAME
all: $(NAME)

# Lib making based on SRC_FILE
$(NAME): $(OBJ)
	@$(AR) $(ARFLAGS) $@ $^

# Compiling SRC_FILE into OBJ
$(OBJ): $(OBJ_DIR)/%.o: %.c $(C_HEADER) | $(OBJ_DIR)
	@$(CC) $(CFLAGS) $(C_INCLUDE) -o $@ -c $<

# Header precompiling
$(C_HEADER): $(C_HEADER_DIR)/%.h.gch: %.h $(HEADER_FILE) | $(C_HEADER_DIR)
	@$(CC) $(CFLAGS) -o $@ $<

# Directory making
$(OBJ_DIR) $(C_HEADER_DIR):
	@mkdir -p $@

# Norm: checks code for norm errors
norm:
	@norminette $(SRC_FILE) | grep "Error" | cat

# Clean: removes objects' and precompiled headers' directories
clean:
	@rm -rf $(OBJ_DIR) $(C_HEADER_DIR)

# Full clean: same as 'clean', but removes the generated libraries as well
fclean: clean
	@rm -rf $(NAME)

# Remake: full cleans and runs 'all' rule
re: fclean all
