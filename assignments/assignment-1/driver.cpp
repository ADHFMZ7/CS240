#include <stdio.h>

extern "C" double start();

int main()
{
  printf("%s\n", "Welcome to Floating Point Numbers by Ahmad Aldasouqi.");

  printf("The driver module received this float number %f and will keep it.\n", start());

  printf("%s\n", "Program exited, thank you for using my program");
}
