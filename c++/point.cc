#include <cmath>

#include <point.h>

EstimatePi::Point::Point(double _x, double _y)
{
    x = _x;
    y = _y;
}

EstimatePi::Point::Point()
{
}

const double EstimatePi::Point::distance()
{
    return std::sqrt(x * x + y * y);
}

