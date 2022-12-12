#!/bin/bash

nasm -f elf64 -g randfill.asm -o fill.o
gcc quicksort.c -c -o quicksort.o -g
gcc test.c quicksort.o fill.o -o output -g
