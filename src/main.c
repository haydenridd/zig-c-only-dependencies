#include <stdio.h>

#include "subproj.h" // Fails to compile, can't find this header
// extern int subFunction(); // Works fine as the object file containing this code is included
int main()
{
    printf("subprojFunction(): %d\n", subFunction());
#ifdef ENABLED_FLAG
    printf("ENABLED_FLAG is active\n");
#else
    printf("ENABLED_FLAG is inactive\n");
#endif
    return 0;
}