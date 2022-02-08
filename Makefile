# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bmugnol- <bmugnol-@student.42sp.org.br>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/09/27 17:20:49 by bmugnol-          #+#    #+#              #
#    Updated: 2022/02/08 18:48:06 by bmugnol-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


# -----------------------LIBRARY---------------------------------------------- #

# Generated static library name
NAME	:=	libft.a
B_NAME	:= 	libftbonus.a
P_NAME	:=	libftprintf.a

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
HEADER		:=	./inc/libft.h
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
SRC_FILE	+=	get_next_line.c	ft_null_free.c	ft_free_matrix.c
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
B_SRC_FILE	:=	ft_lstnew.c	ft_lstsize.c	ft_lstlast.c
B_SRC_FILE	+=	ft_lstadd_front.c	ft_lstadd_back.c	ft_lstdelone.c
B_SRC_FILE	+=	ft_lstclear.c	ft_lstiter.c	ft_lstmap.c
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

# -----------------------PRINTF----------------------------------------------- #

P_HEADER_FILE	:=	ft_printf.h
P_HEADER_DIR	:=	./inc
P_HEADER		:=	./inc/ft_printf.h

P_C_HEADER_FILE	:=	$(P_HEADER_FILE:.h=.h.gch)
P_C_HEADER_DIR	:=	./pre
P_C_HEADER		:=	$(addprefix $(P_C_HEADER_DIR)/, $(P_C_HEADER_FILE))
P_C_INCLUDE		:=	$(addprefix -I, $(P_C_HEADER_DIR))

P_SRC_FILE	:=	ft_printf.c
P_SRC_DIR	:=	$(MAIN_SRC_DIR)/ft_printf
P_SRC		:=	$(addprefix $(P_SRC_DIR)/, $(P_SRC_FILE))

P_OBJ_FILE	:=	$(P_SRC_FILE:.c=.o)
P_OBJ_DIR	:=	$(MAIN_OBJ_DIR)/ft_printf
P_OBJ		:=	$(addprefix $(P_OBJ_DIR)/, $(P_OBJ_FILE))

# ---------------------------------------------------------------------------- #
# -----------------------RULES------------------------------------------------ #
# ---------------------------------------------------------------------------- #

.PHONY: all basic bonus printf norm clean fclean re


# Creates the target NAME
all: $(NAME) $(B_NAME) $(P_NAME)


# 							LIBRARY MAKING
# Lib making based on SRC
$(NAME): $(OBJ)
	$(AR) $(ARFLAGS) $@ $^

basic: $(NAME)

# Lib making based on SRC and B_SRC
$(B_NAME): $(OBJ) $(B_OBJ)
	$(AR) $(ARFLAGS) $@ $^

bonus: $(B_NAME)

# Lib making based on SRC, B_SRC and P_SRC
$(P_NAME): $(OBJ) $(B_OBJ) $(P_OBJ)
	$(AR) $(ARFLAGS) $@ $^

printf: $(P_NAME)


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

# Compiling P_SRC into P_OBJ
$(P_OBJ): $(P_OBJ_DIR)/%.o: $(P_SRC_DIR)/%.c $(P_SRC) $(C_HEADER) $(P_C_HEADER) | $(P_OBJ_DIR)
	@$(CC) $(CFLAGS) $(C_INCLUDE) $(P_C_INCLUDE) -o $@ -c $<

# Separate header precompiling for printf rule
$(P_C_HEADER): $(P_HEADER) | $(P_C_HEADER_DIR)
	@$(CC) $(CFLAGS) -o $@ $<


# 							DIRECTORY MAKING
# Dir making
$(OBJ_DIR) $(B_OBJ_DIR) $(P_OBJ_DIR) $(C_HEADER_DIR):
	@mkdir -p $@


#							Q.O.L. RULES
# Norm: checks code for norm errors
norm:
	norminette $(SRC) $(B_SRC) $(B_SRC) $(HEADER) $(P_HEADER)

# Clean: removes objects' and precompiled headers' directories
clean:
	@rm -rf $(MAIN_OBJ_DIR) $(C_HEADER_DIR)

# Full clean: same as 'clean', but removing the generated libraries as well
fclean: clean
	@rm -rf $(NAME) $(B_NAME) $(P_NAME)

# Remake: full cleans and runs 'all' rule
re: fclean all
