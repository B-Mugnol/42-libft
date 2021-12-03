# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bmugnol- <bmugnol-@student.42sp.org.br>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/09/27 17:20:49 by bmugnol-          #+#    #+#              #
#    Updated: 2021/12/03 19:01:34 by bmugnol-         ###   ########.fr        #
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
HEADER_FILE	:=	libft.h
# Headers directories
HEADER_DIR	:=	./inc
# Header files path
HEADER		:=	$(foreach directory, $(HEADER_DIR), $(directory)/$(HEADER_FILE))
# Headers inclusion
INCLUDE		:=	$(foreach directory, $(HEADER_DIR), -I$(directory))

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

# Main source directory
MAIN_SRC_DIR	:= ./src
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
SRC_DIR		:=	$(MAIN_SRC_DIR)/basic
# Sources
SRC			:=	$(addprefix $(SRC_DIR)/, $(SRC_FILE))

# -----------------------OBJECTS---------------------------------------------- #

# Main object directory
MAIN_OBJ_DIR	:= ./obj
# Object files
OBJ_FILE		:=	$(SRC_FILE:.c=.o)
# Object directory
OBJ_DIR			:=	$(MAIN_OBJ_DIR)/basic
# Objects
OBJ				:=	$(addprefix $(OBJ_DIR)/, $(OBJ_FILE))

# -----------------------BONUS SOURCES---------------------------------------- #

# Bonus source files
B_SRC_FILE	:=	ft_lstnew.c	ft_lstsize.c	ft_lstlast.c				\
				ft_lstadd_front.c	ft_lstadd_back.c	ft_lstdelone.c	\
				ft_lstclear.c	ft_lstiter.c	ft_lstmap.c
# Bonus source directory
B_SRC_DIR	:=	$(MAIN_SRC_DIR)/bonus
# Bonus sources
B_SRC		:= $(addprefix $(B_SRC_DIR)/, $(B_SRC_FILE))

# -----------------------BONUS OBJECTS---------------------------------------- #

# Bonus object files
B_OBJ_FILE	:=	$(B_SRC_FILE:.c=.o)
# Bonus object directory
B_OBJ_DIR	:=	$(MAIN_OBJ_DIR)/bonus
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
$(NAME): $(OBJ)
	$(AR) $(ARFLAGS) $@ $^

basic: $(NAME)

# Lib making based on SRC and B_SRC
bonus: $(NAME) $(B_OBJ)
	$(AR) $(ARFLAGS) $^


# 							COMPILING
# Header precompiling
$(C_HEADER): $(HEADER) | $(C_HEADER_DIR)
	@$(CC) $(CFLAGS) -o $@ $<

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
	@rm -rf $(MAIN_OBJ_DIR) $(C_HEADER_DIR)

# Full clean: same as 'clean', but removing NAME as well
fclean: clean
	@rm -rf $(NAME)

# Remake: full cleans and runs 'all' rule
re: fclean all
