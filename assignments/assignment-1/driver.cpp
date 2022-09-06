//////////////////////////////////////
//                                  //
//        Double Doubles            //
//    written by Ahmad Aldasouqi    //
// ahmadaldasouqi@csu.fullerton.edu //
//          09-05-2022              //
//                                  //
//////////////////////////////////////

// This program will take two double precision
// floating point values as input and output
// the larger of the two. It will then print
// the smaller float.

#include <stdio.h>

extern "C" double start();

int main()
{
  printf("%s\n", "Welcome to Floating Point Numbers by Ahmad Aldasouqi.");

  printf("The driver module received this float number %f and will keep it.\n", start());

  printf("%s\n", "Program exited, thank you for using my program");
}
