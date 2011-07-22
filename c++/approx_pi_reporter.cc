#include <iostream>
#include <fstream>
#include <iomanip>
#include <cmath>

#include <utils.h>
#include <approx_pi_reporter.h>

const int EstimatePi::ApproxPiReporter::REPEATS() const
{
    return 1000;
}

void EstimatePi::ApproxPiReporter::generate()
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

    if (std::abs(error) > std::abs(highest_error))
    {
        worst_pi = approx_pi;
        highest_error = error;
    }

    sum_of_pis += approx_pi;
}

void EstimatePi::ApproxPiReporter::repeatGenerates()
{
    lowest_error  = 100.0;
    highest_error = 0.0;
    sum_of_pis    = 0.0;

    for (int i = 0; i < REPEATS(); i++)
        generate();
}

void EstimatePi::ApproxPiReporter::outputToConsole()
{
    std::cout << std::endl << "For sample size of " << sample_size;
    std::cout << std::endl << "Best PI  : " << best_pi     << "(error = " << lowest_error   << "%)";
    std::cout << std::endl << "Worst PI : " << worst_pi    << "(error = " << highest_error  << "%)";
    std::cout << std::endl << "Avg. PI  : " << averagePi() << "(error = " << averageError() << "%)";
    std::cout << std::endl;
}

double EstimatePi::ApproxPiReporter::averagePi() const
{
    return sum_of_pis / REPEATS();
}

double EstimatePi::ApproxPiReporter::averageError() const
{
    return (averagePi() - actualPi()) * 100.0 / actualPi();
}

void EstimatePi::ApproxPiReporter::outputToFiles()
{
    writeToFile("../output/c++.average.csv", averageError());
    writeToFile("../output/c++.best.csv", lowest_error);
    writeToFile("../output/c++.worst.csv", highest_error);
}

void EstimatePi::ApproxPiReporter::writeToFile(const char file_name[], double value)
{
    std::ofstream f;
    f.open(file_name, std::ios::app);
    f << sample_size << ","
      << std::setiosflags(std::ios::fixed) << std::setprecision(4)
      << value << std::endl;
    f.close();
}

EstimatePi::ApproxPiReporter::ApproxPiReporter(int _sample_size)
{
    sample_size = _sample_size;
}

void EstimatePi::ApproxPiReporter::output()
{
    repeatGenerates();
    outputToConsole();
    outputToFiles();
}

