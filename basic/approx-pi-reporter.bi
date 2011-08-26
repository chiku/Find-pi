#include once "approx-pi-finder.bi"

Type ApproxPiReporter
  Private:
    REPEATS As Const Integer = 1000
    sampleSize As Integer
    lowestError As Double
    highestError  As Double

    bestPi As Double
    worstPi As Double
    sumOfPis As Double

    Declare Sub generate
    Declare Sub repeatGenerates
    Declare Sub outputToConsole
    Declare Function averagePi As Double

    Declare Function averageError As Double
    Declare Sub outputToFiles

    Declare Sub writeToFile(fileName As String, value As Double)

  Public:
    Declare Constructor(sampleSize As Integer)
    Declare Sub output
End Type

