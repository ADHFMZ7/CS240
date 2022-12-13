#include <stdio.h>

extern "C" void display(double*, unsigned long);

void display(double* array, unsigned long count)
{

    for (int i = 0; i < count; i++){
        printf("%f\n", array[i]);
    }

}