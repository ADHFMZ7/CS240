#include "display.c"
#include <stdlib.h>

#define TEST 10

extern void fill(int count, double* array);

double* make_array(int count)
{
  double* array = malloc(sizeof(double) * count);

  fill(count, array);

  return array;
}


int main()
{
  double* array = make_array(TEST);

  display(array, 0, TEST);
}
