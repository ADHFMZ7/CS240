#include <stdio.h>

extern double sum(double* array, int count);

int main()
{
    double a[] = {10.0, 20.0, 30.0};
    int b = 3;

    double c = sum(a, b);
    printf("%f\n", c);

}