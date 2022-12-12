#!/bin/bash

nasm -f elf64 randfill.asm -o fill.o

gcc test.c fill.o -o output
