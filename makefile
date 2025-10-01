NAME = first_step_ASM
LDFLAGS = -no-pie

SRCS_C = main.c
OBJS_C = $(SRCS_C:.c=.o)

SRCS_ASM = ft_strlen.asm ft_write.asm ft_read.asm ft_strcmp.asm ft_strcpy.asm ft_strdup.asm
SRCS_ASM_BONUS = ft_atoi_base.asm

OBJS_ALL = $(OBJS) $(OBJS_BONUS)

OBJDIR = obj
OBJS = $(addprefix $(OBJDIR)/, $(SRCS_ASM:.asm=.o) $(SRCS_C:.c=.o))
OBJS_BONUS = $(addprefix $(OBJDIR)/, $(SRCS_ASM_BONUS:.asm=.o))

all: $(NAME)

$(NAME): $(OBJS)
	gcc $(LDFLAGS) $(OBJS) -o $(NAME)

bonus : $(OBJS_ALL)
	gcc $(LDFLAGS) $(OBJS_ALL) -o $(NAME)

$(OBJDIR)/%.o : %.asm
	mkdir -p $(OBJDIR)
	nasm -f elf64 $< -o $@

$(OBJDIR)/%.o : %.c
	mkdir -p $(OBJDIR)
	gcc -c $< -o $@

clean:
	rm -fr *.o

fclean: clean
	rm -fr $(OBJDIR)/$(NAME)

re: fclean all