#==================================
#   Double Doubles
#   Written by Ahmad Aldasouqi
#
#==================================
#
#  How to use:
#   1) navigate to the double-double directory
#   2) run this command: './run.sh'
#
#==================================
#
# compiles/assembles source files to object files
nasm -f elf64 -o hypotenuse.o hypotenuse.asm
g++ -c -m64 -Wall -fno-pie -no-pie -o isfloat.o isfloat.cpp -std=c++17
g++ -c driver.cpp -std=c++17
#
#links files into a binary
g++ -g -Wall -no-pie driver.o isfloat.o hypotenuse.o  -o output 
#
# runs binaries
./output
#
# cleanup
rm hypotenuse.o driver.o isfloat.o output
