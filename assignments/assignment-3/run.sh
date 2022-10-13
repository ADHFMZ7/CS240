# compiles/assembles source files to object files
nasm -f elf64 -o manager.o manager.asm
nasm -f elf64 -o fill.o fill.asm
g++ -g -c driver.cpp -std=c++17
#
#links files into a binary
g++ -g -Wall -no-pie driver.o manager.o fill.o -o output 
#
# runs binaries
./output
#
# cleanup
rm manager.o driver.o
