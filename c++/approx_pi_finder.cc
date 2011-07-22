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

void EstimatePi::ApproxPiFinder::findDistances()
{
    for(std::vector<double>::size_type i = 0; i != distances.size(); i++)
        distances[i] = points[i].distance();
}

int EstimatePi::ApproxPiFinder::totalPointsInsideCircle() const
{
    int count = 0;
    for(std::vector<double>::const_iterator it = distances.begin(); it != distances.end(); ++it)
        if (*it < RADIUS())
            count++;
    return count;
}

EstimatePi::ApproxPiFinder::ApproxPiFinder(int _sample_size)
{
    sample_size = _sample_size;
    points = std::vector<Point>(sample_size);
    distances = std::vector<double>(sample_size);
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
    findDistances();
}

void EstimatePi::ApproxPiFinder::outputToConsole() const
{
    std::cout << std::endl;
    std::cout << "Approx pi  : " << approxPi() << std::endl;
    std::cout << "Actual pi  : " << actualPi() << std::endl;
    std::cout << "Error      : " << error() << "%" << std::endl;
}

