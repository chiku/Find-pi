#include once "point.bas"
#include once "utils.bas"

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

Constructor ApproxPiFinder(sampleSize As Integer)
  This.sampleSize = sampleSize
  points = CAllocate(This.sampleSize, SizeOf(Point))
End Constructor

Destructor ApproxPiFinder
  DeAllocate(points)
End Destructor

Sub ApproxPiFinder.assignPoints
  For i As Integer = 0 To sampleSize - 1
    points[i] = Point(Rnd * RADIUS, Rnd * RADIUS)
  Next
End Sub

Function ApproxPiFinder.totalPointsInsideCircle As Integer
  Dim count As Integer = 0
  For i As Integer = 0 To sampleSize - 1
    If points[i].distance < RADIUS Then
      count = count + 1
    End If
  Next
  Return count
End Function

Function ApproxPiFinder.approxPi As Double
  Return (4.0 * totalPointsInsideCircle) / sampleSize
End Function

Function ApproxPiFinder.error As Double
  Return (approxPi - pi) * 100.0 / pi
End Function

Sub ApproxPiFinder.evaluate
  assignPoints
End Sub

Sub ApproxPiFinder.outputToConsole
  Print ""
  Print "Approx pi  : "; approxPi
  Print "Actual pi  : "; pi
  Print "Error      : "; error; "%"
End Sub

