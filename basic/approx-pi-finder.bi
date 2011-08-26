#include once "point.bi"

Type ApproxPiFinder
    Private:
      RADIUS As Const Double = 1000.0
      sampleSize As Integer
      points As Point Ptr

      Declare Sub assignPoints
      Declare Function totalPointsInsideCircle As Integer

    Public:
      Declare Constructor(sampleSize As Integer)
      Declare Destructor
      Declare Function approxPi As Double
      Declare Function error As Double
      Declare Sub evaluate
      Declare Sub outputToConsole
End Type

