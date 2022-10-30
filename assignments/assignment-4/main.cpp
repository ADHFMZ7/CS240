#include <stdio.h>

extern "C" float degtorad(float a);

int main()
{

  printf("%f\n", degtorad(380)/2.0);

}
