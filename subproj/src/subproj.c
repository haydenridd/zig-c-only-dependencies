#include "subproj.h"

int subFunction()
{
#ifdef ENABLED_FLAG
    return 10;
#else
    return 9;
#endif
}