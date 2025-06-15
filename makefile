NAME = first_step_ASM
LDFLAGS = -no-pie

SRCS_C = main.c
OBJS_C = $(SRCS_C:.c=.o)

SRCS_ASM = ft_strlen.asm ft_write.asm ft_read.asm ft_strcmp.asm ft_strcpy.asm ft_strdup.asm
OBJS_ASM = $(SRCS_ASM:.asm=.o)

OBJS = $(OBJS_ASM) $(OBJS_C)

all: $(NAME)

$(NAME): $(OBJS)
	gcc $(LDFLAGS) $(OBJS) -o $(NAME)

%.o : %.asm
	nasm -f elf64 $< -o $@

%.o : %.c
	gcc -c $< -o $@

clean:
	rm -fr *.o

fclean: clean
	rm -fr $(NAME)

re: fclean all