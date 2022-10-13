///////////////////////////////////////
// Ahmad Aldasouqi
// ahmadaldasouqi@csu.fullerton.edu
// October 13, 2022
// Section TuTh 8-10am
///////////////////////////////////////

#include <stdio.h>

extern "C" void display(long arr[], int size);

// Prints every number in the array
void display(long* arr, int size)
{
    for (int i = 0; i < size; i++)
    {
        printf("%ld\n", arr[i]);
    }
}




