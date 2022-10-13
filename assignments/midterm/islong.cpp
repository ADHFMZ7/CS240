#include <string>

extern "C" int islong(char arr[], int len);

int islong(char arr[])
{
    int i = 0;
    bool result = true;
    while (!(arr[i] == '\0')){
        if (!(std::isdigit(arr[i]))){
            return -1;
        }
        i++;
    }
    return 1;
}