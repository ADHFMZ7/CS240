
nasm -f elf64 sum.asm -o sum.o

gcc test.c sum.o -o output 