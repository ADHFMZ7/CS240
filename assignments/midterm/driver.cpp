///////////////////////////////////////
// Ahmad Aldasouqi
// ahmadaldasouqi@csu.fullerton.edu
// October 13, 2022
// Section TuTh 8-10am
///////////////////////////////////////


#include <stdio.h>

extern "C" long* start();

int main()
{
    printf("%s\n", "Welcome to the Great Reverse by Ahmad.");

    long* result = start();
    printf("%s\n", "The driver function recieved and array whose first 3 numbers are: ");
    for (int i = 0; i < 3; i++)
    {
        printf("%ld\n", result[i]);
    }

    printf("%s\n", "Program exited, thank you for using my program");

    return 0;
}
