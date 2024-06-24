#include <stdio.h>
#include "staticlib/staticlib.h"
#include "objlib.h"

int main()
{

    // objLibFunc() should return 10, indicating ENABLED_FLAG was used during its'
    printf("objLibFunc(): %d\n", objLibFunc());

    // However, this flag was not used for this compilation unit, and thus ENABLED_FLAG is inactive should display
#ifdef ENABLED_FLAG
    printf("ENABLED_FLAG is active\n");
#else
    printf("ENABLED_FLAG is inactive\n");
#endif

    // Static library usage
    printf("staticLibFunc: %d\n", staticLibFunc());
    return 0;
}