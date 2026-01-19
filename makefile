NAME_LIB = libasm.a
NAME_LIB_BONUS = libasm_bonus.a

# SRCS_C = main.c
OBJS_C = $(SRCS_C:.c=.o)

SRCS_ASM = ft_strlen.asm ft_write.asm ft_read.asm ft_strcmp.asm ft_strcpy.asm ft_strdup.asm
SRCS_ASM_BONUS = ft_atoi_base.asm ft_list_push_front.asm ft_list_size.asm ft_itoa_base.asm

OBJS_ALL = $(OBJS) $(OBJS_BONUS)

OBJDIR = obj
OBJS = $(addprefix $(OBJDIR)/, $(SRCS_ASM:.asm=.o) $(SRCS_C:.c=.o))
OBJS_BONUS = $(addprefix $(OBJDIR)/, $(SRCS_ASM_BONUS:.asm=.o))

ASM = nasm
ASMFLAGS = -f elf64
AR = ar
ARFLAGS = rcs
CC = gcc
CFLAGS = -Wall -Werror -Wextra

TEST = test_mandatory
TEST_BONUS = test_bonus

ECHO = echo

C_B = \033[0;30m
C_R = \033[1;31m
C_G = \033[1;32m
C_Y = \033[0;33m
C_BU = \033[0;34m
C_M = \033[0;35m
C_C = \033[0;36m
C_W = \033[0;37m
RESET = \033[0m

all: $(NAME_LIB)

$(NAME_LIB): $(OBJS)
	$(AR) $(ARFLAGS) $(NAME_LIB) $(OBJS)

bonus : $(NAME_LIB_BONUS)

$(NAME_LIB_BONUS) : $(OBJS_ALL)
	$(AR) $(ARFLAGS) $(NAME_LIB_BONUS) $(OBJS_ALL)

test : $(NAME_LIB)
	$(CC) $(CFLAGS) main.c -L. -lasm -o $(TEST)
	./$(TEST)

test_bonus : $(NAME_LIB_BONUS)
	$(CC) $(CFLAGS) main_bonus.c -L. -lasm_bonus -o $(TEST_BONUS)
	./$(TEST_BONUS)

$(OBJDIR)/%.o : %.asm
	@mkdir -p $(OBJDIR)
	nasm -f elf64 $< -o $@ && \
		$(ECHO) "$(C_G)[OK]$(RESET) Compiled $<" || \
		($(ECHO) "$(C_R)[KO]$(RESET) Failed $<" && exit 1)

clean:
	rm -fr $(OBJDIR)
	rm -fr *.o

fclean: clean
	rm -f $(NAME_LIB)
	rm -f $(NAME_LIB_BONUS)
	rm -f $(TEST)
	rm -f $(TEST_BONUS)

re: fclean all

.PHONY: all bonus clean fclean re