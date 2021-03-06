#include <cmath>

#include <point.h>

EstimatePi::Point::Point(double _x, double _y)
{
    x = _x;
    y = _y;
}

const double EstimatePi::Point::distance() const
{
    return std::sqrt(x * x + y * y);
}

