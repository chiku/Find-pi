#include <approx_pi_finder.h>

#ifndef __APPROX_PI_REPORTER_H__
#define __APPROX_PI_REPORTER_H__

namespace EstimatePi
{
    class ApproxPiReporter
    {
        int sample_size;
        double lowest_error;
        double highest_error;

        double best_pi;
        double worst_pi;
        double sum_of_pis;

    private:
        const int REPEATS() const;
        void generate();
        void repeatGenerates();
        void outputToConsole() const;
        double averagePi() const;
        double averageError() const;
        void outputToFiles() const;
        void writeToFile(const char file_name[], double value) const;

    public:
        ApproxPiReporter(int _sample_size);
        void output();
    };
}

#endif

