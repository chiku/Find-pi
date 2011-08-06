#ifndef __POINT_H__
#define __POINT_H__

typedef struct Point Point;

struct Point
{
  double x;
  double y;
};

Point Point_Initialize(double x, double y);
void Point_Destroy(Point self);

const double Point_Distance(const Point self);

#endif

