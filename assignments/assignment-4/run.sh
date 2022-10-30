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
nasm -f elf64 -o cos.o cos.o
nasm -f elf64 -o degtorad.o degtorad.asm
nasm -f elf64 -o ftoa.o ftoa.asm
nasm -f elf64 -o stof.o stof.asm
nasm -f elf64 -o degtorad.o degtorad.asm
#
#links files into a binary
g++ -g -Wall -no-pie start.o degtorad.o ftoa.o stof.o -o output 
#
# runs binaries
./output
#
# cleanup
rm *.o *.lis
