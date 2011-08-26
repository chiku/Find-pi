Type Point
  Private:
    x As Double
    y As Double
  Public:
    Declare Constructor(x As Double, y As Double)
    Declare Function distance as Double
End Type

Constructor Point(x As Double, y As Double)
  This.x = x
  This.y = y
End Constructor


Function Point.distance As Double
  Return Sqr(x * x + y * y)
End Function

