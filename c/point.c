#include <stdlib.h>
#include <math.h>

#include <point.h>

Point Point_Initialize(double x, double y)
{
  Point self;
  self.x = x;
  self.y = y;
  return self;
}

void Point_Destroy(Point *self)
{
}

const double Point_Distance(const Point *self)
{
  return sqrt(self->x * self->x + self->y * self->y);
}

