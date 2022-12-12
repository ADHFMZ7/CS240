#include "display.c"
#include <stdlib.h>

#define TEST 100

extern fill(int count, double* array);

int* make_array(int count)
{
  int* array = malloc(sizeof(int) * count);

  fill(count, array);

  return array;
}


int main()
{
  int* array = make_array(TEST);

  display(array, 0, TEST);
}
