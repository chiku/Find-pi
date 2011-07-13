#include <iostream>
#include <fstream>
#include <iomanip>
#include <vector>
#include <cmath>
#include <cstdlib>
#include <ctime>

#ifndef __APPROX_PI_FINDER_H__
#define __APPROX_PI_FINDER_H__

namespace EstimatePi
{
    class ApproxPiFinder
    {
        double approx_pi;
        int sample_size;

        std::vector<double> xs;
        std::vector<double> ys;
        std::vector<double> distances;

    private:
        const double RADIUS() const;
        void assignXs();
        void assignYs();
        void findDistances();
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

