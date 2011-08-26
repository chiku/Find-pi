#include "string.bi"

#include once "approx-pi-finder.bas"
#include once "utils.bas"

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

Constructor ApproxPiReporter(sampleSize As Integer)
  this.sampleSize = sampleSize
End Constructor

Sub ApproxPiReporter.generate
  Dim finder As ApproxPiFinder = ApproxPiFinder(sampleSize)
  finder.evaluate
  Dim currentApproxPi As Double = finder.approxPi
  Dim currentError As Double = finder.error

  If Abs(currentError) <= abs(lowestError) Then
    bestPi = currentApproxPi
    lowestError = currentError
  End If

  If Abs(currentError) >= Abs(highestError) Then
    worstPi = currentApproxPi
    highestError = currentError
  End If

  sumOfPis = sumOfPis + currentApproxPi
End Sub

Sub ApproxPiReporter.repeatGenerates
  lowestError = 100.0
  highestError = 0.0
  sumOfPis = 0.0

  For i As Integer = 1 To REPEATS
    generate
  Next
End Sub

Sub ApproxPiReporter.outputToConsole
  Print ""
  Print ""
  Print "For sample size of "; sampleSize
  Print "Best PI  : "; bestPi; " (error = "; lowestError; "%)"
  Print "Worst PI : "; worstPi; " (error = "; highestError; "%)"
  Print "Avg. PI  : "; averagePi; " (error = "; averageError; "%)"
End Sub

Function ApproxPiReporter.averagePi As Double
  Return sumOfPis / REPEATS
End Function

Function ApproxPiReporter.averageError As Double
  Return (averagePi - pi) * 100.0 / pi
End Function

Sub ApproxPiReporter.outputToFiles
  writeToFile("../output/basic.average.csv", averageError)
  writeToFile("../output/basic.best.csv", lowestError)
  writeToFile("../output/basic.worst.csv", highestError)
End Sub

Sub ApproxPiReporter.writeToFile(fileName As String, value As Double)
  Dim As Integer file = Freefile
  Open fileName For Append As #file
  Print #file, (sampleSize & "," & Format(value, "#0.0000"))
  Close #file
End Sub

Sub ApproxPiReporter.output
  repeatGenerates
  outputToConsole
  outputToFiles
End Sub

