#include <stdio.h>
#include <math.h>

#include <utils.h>
#include <approx_pi_reporter.h>


const int ApproxPiReporter_REPEATS = 1000;

void ApproxPiReporter_Generate(ApproxPiReporter *self)
{
  ApproxPiFinder finder = ApproxPiFinder_Initialize(self->sample_size);
  ApproxPiFinder_Evaluate(&finder);
  double approx_pi = ApproxPiFinder_ApproxPi(&finder);
  double error = ApproxPiFinder_Error(&finder);
  ApproxPiFinder_Destroy(&finder);

  if (fabs(error) <= fabs(self->lowest_error))
  {
    self->best_pi = approx_pi;
    self->lowest_error = error;
  }

  if (fabs(error) >= fabs(self->highest_error))
  {
    self->worst_pi = approx_pi;
    self->highest_error = error;
  }

  self->sum_of_pis += approx_pi;
}

void ApproxPiReporter_FindAverageError(ApproxPiReporter *self)
{
  self->average_pi = self->sum_of_pis / ApproxPiReporter_REPEATS;
  self->average_error = (self->average_pi - Utils_ActualPi()) * 100.0 / Utils_ActualPi();
}

void ApproxPiReporter_RepeatGenerates(ApproxPiReporter *self)
{
  self->lowest_error  = 100.0;
  self->highest_error = 0.0;
  self->sum_of_pis  = 0.0;

  int i;
  for (i = 0; i < ApproxPiReporter_REPEATS; i++)
    ApproxPiReporter_Generate(self);

  ApproxPiReporter_FindAverageError(self);
}

void ApproxPiReporter_OutputToConsole(const ApproxPiReporter *self)
{
  printf("\n For sample size of %d", self->sample_size);
  printf("\n Best PI  : %f (error = %f%%)", self->best_pi, self->lowest_error);
  printf("\n Worst PI : %f (error = %f%%)", self->worst_pi, self->highest_error);
  printf("\n Avg. PI  : %f (error = %f%%)", self->average_pi, self->average_error);
  printf("\n");
}

void ApproxPiReporter_WriteToFile(const ApproxPiReporter *self, const char file_name[], double value)
{
  FILE *fp = fopen(file_name, "a+");
  fprintf(fp, "%d,%.4f\n", self->sample_size, value);
  fclose(fp);
}

void ApproxPiReporter_OutputToFiles(const ApproxPiReporter *self)
{
  ApproxPiReporter_WriteToFile(self, "../output/c.average.csv", self->average_error);
  ApproxPiReporter_WriteToFile(self, "../output/c.best.csv", self->lowest_error);
  ApproxPiReporter_WriteToFile(self, "../output/c.worst.csv", self->highest_error);
}

ApproxPiReporter ApproxPiReporter_Initialize(int sample_size)
{
  ApproxPiReporter self;
  self.sample_size = sample_size;
  return self;
}

void ApproxPiReporter_Destroy(ApproxPiReporter *self)
{
}

void ApproxPiReporter_Output(ApproxPiReporter *self)
{
  ApproxPiReporter_RepeatGenerates(self);
  ApproxPiReporter_OutputToConsole(self);
  ApproxPiReporter_OutputToFiles(self);
}

