#include <vector>

#include <point.h>

#ifndef __APPROX_PI_FINDER_H__
#define __APPROX_PI_FINDER_H__

namespace EstimatePi
{
    class ApproxPiFinder
    {
        int sample_size;

        std::vector<Point> points;

    private:
        const double RADIUS() const;
        void assignPoints();
        int totalPointsInsideCircle() const;

    public:
        ApproxPiFinder(int _sample_size);
        double approxPi() const;
        double error() const;
        void evaluate();
        void outputToConsole() const;
    };
}

#endif

