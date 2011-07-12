#include <iostream>
#include <fstream>
#include <iomanip>
#include <vector>
#include <cmath>
#include <cstdlib>
#include <ctime>


double actualPi()
{
    return 4.0 * std::atan(1.0);
}

class ApproxPiFinder
{
    double approx_pi;
    int sample_size;

    std::vector<double> xs;
    std::vector<double> ys;
    std::vector<double> distances;

private:
    const double RADIUS() const
    {
        return 1000.0;
    }

    void assignXs()
    {
        for(std::vector<double>::iterator it = xs.begin(); it != xs.end(); ++it)
            *it = ((double)std::rand()/(double)RAND_MAX) * RADIUS();
    }

    void assignYs()
    {
        for(std::vector<double>::iterator it = ys.begin(); it != ys.end(); ++it)
            *it = ((double)std::rand()/(double)RAND_MAX) * RADIUS();
    }

    void findDistances()
    {
        for(std::vector<double>::size_type i = 0; i != distances.size(); i++)
            distances[i] = std::sqrt(xs[i] * xs[i] + ys[i] * ys[i]);
    }

    int totalPointsInsideCircle() const
    {
        int count = 0;
        for(std::vector<double>::const_iterator it = distances.begin(); it != distances.end(); ++it)
            if (*it < RADIUS())
                count++;
        return count;
    }

public:
    ApproxPiFinder(int _sample_size)
    {
        sample_size = _sample_size;
        xs = std::vector<double>(sample_size);
        ys = std::vector<double>(sample_size);
        distances = std::vector<double>(sample_size);
    }

    double approxPi() const
    {
        return (4.0 * totalPointsInsideCircle()) / sample_size;
    }

    double error() const
    {
        return (approxPi() - actualPi()) * 100.0 / actualPi();
    }

    void evaluate()
    {
        assignXs();
        assignYs();
        findDistances();
    }

    void outputToConsole() const
    {
        std::cout << std::endl;
        std::cout << "Approx pi  : " << approxPi() << std::endl;
        std::cout << "Actual pi  : " << actualPi() << std::endl;
        std::cout << "Error      : " << error() << "%" << std::endl;
    }

};


class ApproxPiReporter
{
    int sample_size;
    double lowest_error;
    double highest_error;

    double best_pi;
    double worst_pi;
    double sum_of_pis;

private:
    const int REPEATS() const
    {
        return 10;
    }

    void generate()
    {
        ApproxPiFinder finder(sample_size);
        finder.evaluate();
        double approx_pi = finder.approxPi();
        double error     = finder.error();

        if (std::abs(error) < std::abs(lowest_error))
        {
            best_pi = approx_pi;
            lowest_error = error;
        }

        if (std::abs(error) > std::abs(lowest_error))
        {
            worst_pi = approx_pi;
            highest_error = error;
        }

        sum_of_pis += approx_pi;
    }

    void repeatGenerates()
    {
        lowest_error  = 100.0;
        highest_error = 0.0;
        sum_of_pis    = 0.0;

        for (int i = 0; i < REPEATS(); i++)
            generate();
    }

    void outputToConsole()
    {
        std::cout << std::endl << "For sample size of " << sample_size;
        std::cout << std::endl << "Best PI  : " << best_pi     << "(error = " << lowest_error   << "%)";
        std::cout << std::endl << "Worst PI : " << worst_pi    << "(error = " << highest_error  << "%)";
        std::cout << std::endl << "Avg. PI  : " << averagePi() << "(error = " << averageError() << "%)";
        std::cout << std::endl;
    }

    double averagePi() const
    {
        return sum_of_pis / REPEATS();
    }

    double averageError() const
    {
        return (averagePi() - actualPi()) * 100.0 / actualPi();
    }

    void outputToFiles()
    {
        writeToFile("c++.average.csv", averageError());
        writeToFile("c++.best.csv", lowest_error);
        writeToFile("c++.worst.csv", highest_error);
    }

    void writeToFile(const char file_name[], double value)
    {
        std::ofstream f;
        f.open(file_name, std::ios::app);
        f << sample_size << ","
          << std::setiosflags(std::ios::fixed) << std::setprecision(4)
          << value << std::endl;
        f.close();
    }

public:
    ApproxPiReporter(int _sample_size)
    {
        sample_size = _sample_size;
    }

    void output()
    {
        repeatGenerates();
        outputToConsole();
        outputToFiles();
    }
};

int main()
{
    std::srand(std::time(0));

    int SAMPLE_SIZES[] = {1, 10, 100, 1000, 10000, 100000};
    for(int i=0; i < sizeof(SAMPLE_SIZES)/sizeof(int); i++)
        ApproxPiReporter(SAMPLE_SIZES[i]).output();
}

