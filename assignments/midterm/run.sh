#///////////////////////////////////////
#// Ahmad Aldasouqi
#// ahmadaldasouqi@csu.fullerton.edu
#// October 13, 2022
#// Section TuTh 8-10am
#///////////////////////////////////////

nasm -f elf64 -l manager.lis -o manager.o manager.asm

nasm -f elf64 -l fill.lis -o fill.o fill.asm

nasm -f elf64 -l reverse.lis -o reverse.o reverse.asm

g++ -g -c -Wall -no-pie -m64 -std=c++17 -o display.o display.cpp


g++ -g -c -Wall -m64 -no-pie -o driver.o driver.cpp -std=c++17

g++ -g -m64 -no-pie -o output manager.o fill.o driver.o reverse.o display.o -std=c++17

./output

rm *.o *.lis