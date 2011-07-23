#ifndef __POINT_H__
#define __POINT_H__

namespace EstimatePi
{
    class Point
    {
    public:
        double x;
        double y;

    public:
        Point();
        Point(double _x, double _y);
        const double distance() const;
    };
}

#endif

