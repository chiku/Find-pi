#include <point.h>

#ifndef __APPROX_PI_FINDER_H__
#define __APPROX_PI_FINDER_H__

typedef struct ApproxPiFinder ApproxPiFinder;

struct ApproxPiFinder
{
  int sample_size;
  Point *points;
};


ApproxPiFinder ApproxPiFinder_Initialize(int sample_size);
void ApproxPiFinder_Destroy(ApproxPiFinder *self);

double ApproxPiFinder_ApproxPi(const ApproxPiFinder *self);
double ApproxPiFinder_Error(const ApproxPiFinder *self);
void ApproxPiFinder_Evaluate(ApproxPiFinder *self);
void ApproxPiFinder_OutputToConsole(const ApproxPiFinder *self);

#endif

