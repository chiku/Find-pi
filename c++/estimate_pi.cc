#include <cstdlib>
#include <ctime>

#include <approx_pi_reporter.h>

int main()
{
    std::srand(std::time(0));

    int SAMPLE_SIZES[] = {1, 10, 100, 1000, 10000, 100000};
    for(int i=0; i < sizeof(SAMPLE_SIZES)/sizeof(int); i++)
        EstimatePi::ApproxPiReporter(SAMPLE_SIZES[i]).output();
}

