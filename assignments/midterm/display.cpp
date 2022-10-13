///////////////////////////////////////
// Ahmad Aldasouqi
// ahmadaldasouqi@csu.fullerton.edu
// October 13, 2022
// Section TuTh 8-10am
///////////////////////////////////////

#include <stdio.h>

extern "C" void Display(long arr[], int size);

void Display(long arr[], int size)
{
    for (int i = 0; i < size; i++)
    {
        printf("%ld\n", arr[i]);
    }
}




