#include <string>

extern "C" int islong(char arr[]);

int islong(char arr[])
{
    int i = 0;
    while (!(arr[i] == '\0')){
        if (!(std::isdigit(arr[i]))){
            return -1;
        }
        i++;
    }
    return 1;
}