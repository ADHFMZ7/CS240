#!/bin/bash

nasm -f elf64 -g randfill.asm -o fill.o

gcc test.c fill.o -o output -g
