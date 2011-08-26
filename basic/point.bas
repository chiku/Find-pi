#include once "point.bi"

Constructor Point(x As Double, y As Double)
  This.x = x
  This.y = y
End Constructor

Function Point.distance As Double
  Return Sqr(x * x + y * y)
End Function

