#include <stdlib.h>
#include <time.h>

#include <approx_pi_reporter.h>

int main()
{
  srand((unsigned)time(NULL));

  int SAMPLE_SIZES[] = {1, 10, 100, 1000, 10000, 100000};
  int i;
  for(i = 0; i < sizeof(SAMPLE_SIZES)/sizeof(int); i++)
  {
    ApproxPiReporter reporter = ApproxPiReporter_Initialize(SAMPLE_SIZES[i]);
    ApproxPiReporter_Output(reporter);
    ApproxPiReporter_Destroy(reporter);
  }
}

