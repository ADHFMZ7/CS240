#==================================
#       Accurate Cosines
#   Written by Ahmad Aldasouqi
#         10-30-2022
#==================================
#
#  How to use:
#   1) navigate to the Accurate Cosine directory
#   2) run this command: './run.sh'
#
#==================================
#
# compiles/assembles source files to object files
nasm -f elf64 -o start.o start.asm
nasm -f elf64 -o cos.o cos.asm
nasm -f elf64 -o degtorad.o degtorad.asm
nasm -f elf64 -o ftoa.o ftoa.asm
nasm -f elf64 -o ltoa.o ltoa.asm
nasm -f elf64 -o atof.o atof.asm
nasm -f elf64 -o scan.o scan.asm
nasm -f elf64 -o strlen.o strlen.asm
#
#links files into a binary
g++ -nostdlib -g -Wall -no-pie start.o degtorad.o atof.o cos.o ltoa.o strlen.o scan.o ftoa.o -o output 
#
# runs binaries
./output
#
# cleanup
rm *.o
