# compiles/assembles source files to object files
nasm -f elf64 -o two_floats.o two_floats.asm
nasm -f elf64 -o isfloat.o isfloat.asm
g++ -c driver.cpp 

#links files into a binary
g++ -g -Wall -no-pie driver.o isfloat.o two_floats.o  -o output 

# runs binaries
./output

# cleanup
rm two_floats.o driver.o isfloat.o output
