#include <stdio.h>

extern void display(double* a, int b);

int main()
{
    double a[] = {10.0, 20.0, 30.0, 40};
    int b = 4;

    display(a, b);
}