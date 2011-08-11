#include <approx_pi_finder.h>

#ifndef __APPROX_PI_REPORTER_H__
#define __APPROX_PI_REPORTER_H__

typedef struct ApproxPiReporter ApproxPiReporter;

struct ApproxPiReporter
{
  int sample_size;
  double lowest_error;
  double highest_error;
  double average_error;

  double best_pi;
  double worst_pi;
  double average_pi;
  double sum_of_pis;
};

ApproxPiReporter ApproxPiReporter_Initialize(int sample_size);
void ApproxPiReporter_Destroy(ApproxPiReporter *self);

void ApproxPiReporter_Output(ApproxPiReporter *self);

#endif

