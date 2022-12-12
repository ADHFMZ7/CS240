
nasm -f elf64 -l randfill.lis -o randfill.o randfill.asm
nasm -f elf64 -l sum.lis -o sum.o sum.asm
nasm -f elf64 -l display.lis -o display.o display.asm
nasm -f elf64 -l supervisor.lis -o supervisor.o supervisor.asm

#g++ -c -Wall -m64 -no-pie -o driver.o driver.cpp -std=c++17
g++ -m64 -no-pie -o output driver.cpp supervisor.o randfill.o sum.o display.o -std=c++17

