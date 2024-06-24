#include "objlib.h"

int objLibFunc()
{
#ifdef ENABLED_FLAG
    return 10;
#else
    return 9;
#endif
}