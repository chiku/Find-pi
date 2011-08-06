#include <math.h>
#include <stdlib.h>

#include <utils.h>

const double Utils_ActualPi()
{
    return 4.0 * atan(1.0);
}

const double Utils_RandomTill(double limit)
{
    return ((double)rand()/(double)RAND_MAX) * limit;
}
