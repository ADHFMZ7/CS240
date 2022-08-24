#include <iostream>

extern "C" 
{
extern int float_number();
int gvar // global variable
}


int main()
{
  std::cout << "Welcome to Floating Point Numbers by Ahmad Aldasouqi." << std::endl;

  two_floats()

  std::cout << "Program exited, thank you for using my program" << std::endl;
}
