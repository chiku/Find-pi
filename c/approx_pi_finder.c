#include <stdio.h>
#include <stdlib.h>

#include <utils.h>
#include <point.h>
#include <approx_pi_finder.h>

const double ApproxPiFinder_RADIUS = 1000.0;

void ApproxPiFinder_AssignPoints(ApproxPiFinder *self)
{
  int i;
  for(i = 0; i < self->sample_size; i++)
    self->points[i] = Point_Initialize(Utils_RandomTill(ApproxPiFinder_RADIUS), Utils_RandomTill(ApproxPiFinder_RADIUS));
}

int ApproxPiFinder_TotalPointsInsideCircle(const ApproxPiFinder self)
{
  int count = 0;
  int i;
  for(i = 0; i < self.sample_size; i++)
    count = count + (Point_Distance(self.points[i]) < ApproxPiFinder_RADIUS ? 1 : 0);
  return count;
}

ApproxPiFinder ApproxPiFinder_Initialize(int sample_size)
{
  ApproxPiFinder self;
  self.sample_size = sample_size;
  self.points = (Point*)(malloc(sizeof(Point) * self.sample_size));
  return self;
}

void ApproxPiFinder_Destroy(ApproxPiFinder self)
{
  int i;
  for (i = 0; i < self.sample_size; i++)
    Point_Destroy(self.points[1]);

  free(self.points);
}

double ApproxPiFinder_ApproxPi(const ApproxPiFinder self)
{
  return (4.0 * ApproxPiFinder_TotalPointsInsideCircle(self)) / self.sample_size;
}

double ApproxPiFinder_Error(const ApproxPiFinder self)
{
    return (ApproxPiFinder_ApproxPi(self) - Utils_ActualPi()) * 100.0 / Utils_ActualPi();
}

void ApproxPiFinder_Evaluate(ApproxPiFinder self)
{
    ApproxPiFinder_AssignPoints(&self);
}

void ApproxPiFinder_OutputToConsole(const ApproxPiFinder self)
{
    printf("\n");
    printf("Approx pi  : %f\n", ApproxPiFinder_ApproxPi(self));
    printf("Actual pi  : %f\n", Utils_ActualPi());
    printf("Error      : %f%%\n", ApproxPiFinder_Error(self));
}

