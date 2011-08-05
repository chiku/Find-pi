#include <iostream>
#include <vector>
#include <cmath>
#include <utils.h>
#include <point.h>
#include <approx_pi_finder.h>

const double EstimatePi::ApproxPiFinder::RADIUS() const
{
    return 1000.0;
}

void EstimatePi::ApproxPiFinder::assignPoints()
{
    for(std::vector<Point>::iterator it = points.begin(); it != points.end(); ++it)
        *it = Point(randomTill(RADIUS()), randomTill(RADIUS()));
}

int EstimatePi::ApproxPiFinder::totalPointsInsideCircle() const
{
    int count = 0;
    for(std::vector<Point>::const_iterator it = points.begin(); it != points.end(); ++it)
        if (it->distance() < RADIUS())
            count++;
    return count;
}

EstimatePi::ApproxPiFinder::ApproxPiFinder(int _sample_size)
{
    sample_size = _sample_size;
    points = std::vector<Point>(sample_size);
}

double EstimatePi::ApproxPiFinder::approxPi() const
{
    return (4.0 * totalPointsInsideCircle()) / sample_size;
}

double EstimatePi::ApproxPiFinder::error() const
{
    return (approxPi() - actualPi()) * 100.0 / actualPi();
}

void EstimatePi::ApproxPiFinder::evaluate()
{
    assignPoints();
}

void EstimatePi::ApproxPiFinder::outputToConsole() const
{
    std::cout << std::endl;
    std::cout << "Approx pi  : " << approxPi() << std::endl;
    std::cout << "Actual pi  : " << actualPi() << std::endl;
    std::cout << "Error      : " << error() << "%" << std::endl;
}

