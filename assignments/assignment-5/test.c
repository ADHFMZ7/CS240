#include "display.c"
#include <stdlib.h>

#define TEST 100

extern void fill(int count, double* array);

double* make_array(int count)
{
  double* array = malloc(sizeof(double) * count);

  fill(count, array);

  return array;
}


int main()
{
  int* array = make_array(TEST);

  display(array, 0, TEST);
}
