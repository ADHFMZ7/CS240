#include "display.c"
#include <stdlib.h>

#define TEST 100

int* make_array(int count)
{
  int* array = malloc(sizeof(int) * count);
  for (int i = 0; i < count; i++)
  {
    array[i] = i;
  }
  return array;
}


int main()
{
  int* array = make_array(TEST);

  display(array, 0, TEST);
}
