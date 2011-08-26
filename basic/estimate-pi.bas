#include once "approx-pi-reporter.bas"

Randomize

Dim SAMPLE_SIZE(6) As Integer => {1, 10, 100, 1000, 10000, 100000}

For i As Integer = 0 To UBound(SAMPLE_SIZE) - LBound(SAMPLE_SIZE) - 1
  Dim reporter As ApproxPiReporter = ApproxPiReporter(SAMPLE_SIZE(i))
  reporter.output
Next

