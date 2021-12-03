# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bmugnol- <bmugnol-@student.42sp.org.br>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/09/27 17:20:49 by bmugnol-          #+#    #+#              #
#    Updated: 2021/12/03 15:56:37 by bmugnol-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


# -----------------------LIBRARY---------------------------------------------- #

# Generated static library name
NAME	:=	libft.a

# -----------------------COMPILER--------------------------------------------- #

# C Compiler
CC		:=	gcc
# Compiler flags
CFLAGS	:=			\
			-Wall	\
			-Wextra	\
			-Werror
#	(Turns on all warning flags, including extra, and turns warning into errors)

# -----------------------ARCHIVER--------------------------------------------- #

# Archiver
AR		:= 	ar
# Archiver flags
ARFLAGS	:=	rcs
#	(Inserts files with replacement, creates the archive if not existent,
#		add index to archive)

# -----------------------HEADERS---------------------------------------------- #

# Headers files
HEADER_FILE	:=	libft.h
# Headers directory
HEADER_DIR	:=	./inc
# Header file path
HEADER		:=	$(addprefix $(HEADER_DIR)/, $(HEADER_FILE))
# Headers inclusion
INCLUDE		:=	$(addprefix -I, $(HEADER_DIR))

# -----------------------PRECOMPILED HEADERS---------------------------------- #

# Compiled headers files
C_HEADER_FILE	:=	$(HEADER_FILE:.h=.h.gch)
# Compiled headers directory
C_HEADER_DIR	:=	./pre
# Compiled headers file path
C_HEADER		:=	$(addprefix $(C_HEADER_DIR)/, $(C_HEADER_FILE))
# Compiled headers inclusion
C_INCLUDE		:=	$(addprefix -I, $(C_HEADER_DIR))

# -----------------------SOURCES---------------------------------------------- #

# Source files
SRC_FILE	:=	ft_isalpha.c	ft_isdigit.c	ft_isalnum.c	ft_isascii.c\
				ft_isprint.c	ft_toupper.c	ft_tolower.c
SRC_FILE	+=	ft_memset.c		ft_bzero.c		ft_memcpy.c		ft_memmove.c\
				ft_memchr.c		ft_memcmp.c		ft_calloc.c
SRC_FILE	+=	ft_strlen.c		ft_strlcpy.c	ft_strlcat.c	ft_strchr.c	\
				ft_strrchr.c	ft_strncmp.c	ft_strnstr.c	ft_strdup.c
SRC_FILE	+=	ft_itoa.c		ft_utoa.c		ft_ptoa.c		ft_xtoa.c	\
				ft_xto_uppercase_a.c
SRC_FILE	+=	ft_atoi.c		ft_substr.c		ft_strjoin.c	ft_strtrim.c\
				ft_split.c		ft_strmapi.c	ft_striteri.c	ft_putchar_fd.c\
				ft_putstr_fd.c	ft_putendl_fd.c	ft_putnbr_fd.c
# Source directory
SRC_DIR		:=	./src
# Sources
SRC			:=	$(addprefix $(SRC_DIR)/, $(SRC_FILE))

# -----------------------OBJECTS---------------------------------------------- #

# Object files
OBJ_FILE	:=	$(SRC_FILE:.c=.o)
# Object directory
OBJ_DIR		:=	./obj/basic
# Objects
OBJ			:=	$(addprefix $(OBJ_DIR)/, $(OBJ_FILE))

# -----------------------BONUS SOURCES---------------------------------------- #

# Bonus source files
B_SRC_FILE	:=	ft_lstnew.c	ft_lstsize.c	ft_lstlast.c				\
				ft_lstadd_front.c	ft_lstadd_back.c	ft_lstdelone.c	\
				ft_lstclear.c	ft_lstiter.c	ft_lstmap.c
# Bonus source directory
B_SRC_DIR	:=	./src
# Bonus sources
B_SRC		:= $(addprefix $(B_SRC_DIR)/, $(B_SRC_FILE))

# -----------------------BONUS OBJECTS---------------------------------------- #

# Bonus object files
B_OBJ_FILE	:=	$(B_SRC_FILE:.c=.o)
# Bonus object directory
B_OBJ_DIR	:=	./obj/bonus
# Bonus objects
B_OBJ		:=	$(addprefix $(B_OBJ_DIR)/, $(B_OBJ_FILE))

# ---------------------------------------------------------------------------- #
# -----------------------RULES------------------------------------------------ #
# ---------------------------------------------------------------------------- #

.PHONY: all basic bonus norm clean fclean re


# Creates the target NAME
all: $(NAME)


# 							LIBRARY MAKING
# Lib making based on SRC
basic $(NAME): $(OBJ)
	$(AR) $(ARFLAGS) $@ $^

# Lib making based on SRC and B_SRC
bonus: $(NAME) $(B_OBJ)
	$(AR) $(ARFLAGS) $< $(B_OBJ)


# 							COMPILING
# Header precompiling
$(C_HEADER): $(HEADER) | $(C_HEADER_DIR)
	$(CC) $(CFLAGS) -o $@ $<

# Compiling SRC into OBJ
$(OBJ): $(OBJ_DIR)/%.o: $(SRC_DIR)/%.c $(SRC) $(C_HEADER) | $(OBJ_DIR)
	@$(CC) $(CFLAGS) $(C_INCLUDE) -o $@ -c $<

# Compiling B_SRC into B_OBJ
$(B_OBJ): $(B_OBJ_DIR)/%.o: $(B_SRC_DIR)/%.c $(B_SRC) $(C_HEADER) | $(B_OBJ_DIR)
	@$(CC) $(CFLAGS) $(C_INCLUDE) -o $@ -c $<


# 							DIRECTORY MAKING
# Dir making
$(OBJ_DIR) $(B_OBJ_DIR) $(C_HEADER_DIR):
	@mkdir -p $@


#							Q.O.L. RULES
# Norm: checks code for norm errors
norm:
	norminette $(SRC) $(B_SRC) $(HEADER_FILE)

# Clean: removes objects, precompiled headers and created directories
clean:
	@rm -rf $(OBJ_DIR) $(B_OBJ_DIR) $(C_HEADER_DIR)
	@rm -f $(wildcard $(OBJ_FILE))
	@rm -f $(wildcard $(B_OBJ_FILE))
	@rm -f $(wildcard $(C_HEADER_FILE))

# Full clean: same as 'clean', but removing NAME as well
fclean: clean
	@rm -rf $(NAME)

# Remake: full cleans and runs 'all' rule
re: fclean all
