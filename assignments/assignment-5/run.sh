#!/bin/bash

nasm -f elf64 -g manager.asm -o manager.o
nasm -f elf64 -g randfill.asm -o fill.o
gcc quicksort.c -c -o quicksort.o -g
gcc display.c -c -o display.o -g
g++ driver.cpp manager.o quicksort.o display.o fill.o -o output -g
