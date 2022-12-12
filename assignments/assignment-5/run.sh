#!/bin/bash


g++ -m64 -Wall -fno-pie -no-pie quicksort.c -c -o quicksort.o -g
g++ -m64 -Wall -fno-pie -no-pie display.c -c -o display.o -g


nasm -f elf64 -g randfill.asm -o fill.o
nasm -f elf64 -g manager.asm -o manager.o

g++ -m64 -Wall -fno-pie -no-pie driver.cpp quicksort.o display.o manager.o fill.o -o output -g
