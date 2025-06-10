Pour compiler de l'assembleur avec du c il faut passer par des obj
d'abord on compile l'assembleur en objet
nasm -f elf64 name.asm
gcc main.c name.o -o name_programme