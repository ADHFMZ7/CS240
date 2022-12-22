//  Ahmad Aldasouqi
//  CPSC240-7
//  Final Program Test
//  ahmadaldasouqi@csu.fullerton.edu

#include <stdio.h>

extern "C" double supervisor();

int main()
{
    printf("Welcome to Arithmetic Mean by Ahmad Aldasouqi\n");
    printf("This program will compute the arithmetic mean of your numbers\n");

    printf("The main function recieved the number %f and will keep it for a while\n", supervisor());
    printf("Enjoy your winter break!\n");

}