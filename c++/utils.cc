#include <cmath>
#include <cstdlib>

#include <utils.h>

const double EstimatePi::actualPi()
{
    return 4.0 * std::atan(1.0);
}

const double EstimatePi::randomTill(double limit)
{
    return ((double)std::rand()/(double)RAND_MAX) * limit;
}
