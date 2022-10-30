#==================================
#   Double Doubles
#   Written by Ahmad Aldasouqi
#
#==================================
#
#  How to use:
#   1) navigate to the Accurate Cosine directory
#   2) run this command: './run.sh'
#
#==================================
#
# compiles/assembles source files to object files
nasm -f elf64 -o degtorad.o degtorad.asm
g++ -c -m64 -Wall -fno-pie -no-pie -o main.o main.cpp -std=c++17
#
#links files into a binary
g++ -g -Wall -no-pie main.o degtorad.o -o output 
#
# runs binaries
./output
#
# cleanup
rm *.o
