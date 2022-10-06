//////////////////////////////////////
//                                  //
//          Hypotenuse              //
//    written by Ahmad Aldasouqi    //
// ahmadaldasouqi@csu.fullerton.edu //
//          09-05-2022              //
//                                  //
//////////////////////////////////////

// This program will take two double precision
// floating point values to be interpretted as
// the sides of a right triangle and will return
// the hypotenuse(euclidan distance) sqrt(a^2 + b^2)

#include <stdio.h>

extern "C" double start();

int main()
{
  printf("%s\n", "Welcome to Hypotenuse by Ahmad Aldasouqi.");

  printf("The driver module received this float number %f and will keep it.\n", start());

  printf("%s\n", "Program exited, thank you for using my program");
}
