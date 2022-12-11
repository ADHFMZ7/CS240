#include <stdio.h>

// TODO: OPTIMIZE SMALL ARRAYS LATER


void display(int myarray[], unsigned long start, unsigned long count)
{
  if (count <= 30)
  {
    for (int i = 0; i < 3; i++)
    {
      printf("[");
      for (int i = 0; i <= count; i++)
      {
        printf("%i, ", myarray[i]);
      }
      printf("%i]\n", myarray[count-1]);
    }
  }

  else
  {
    printf("First 10 digits: ");
    for (int i = 0; i < 10; i++)
    {
        printf("%i ", myarray[i]);
    }
    printf("\n");


    printf("Middle 10 digits: ");
      for (int i = count/2-5; i < count/2 + 5; i++)
      {
        printf("%i ", myarray[i]);
      }
    printf("\n");

    printf("Last 10 digits: ");
      for (int i = count-10; i < count; i++)
      {
        printf("%i ", myarray[i]);
      }
      printf("\n");
  }
}
