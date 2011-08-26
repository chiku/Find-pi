#ifndef __UTILS_BI__
#define __UTILS_BI__

Type Point
  Private:
    x As Double
    y As Double
  Public:
    Declare Constructor(x As Double, y As Double)
    Declare Function distance as Double
End Type

#endif

