package main

import (
	"fmt"
	"io"
	"math"
	"os"
)

const (
	repeats = 1000
)

type ApproxPiReporter struct {
	sampleSize   int
	lowestError  float64
	highestError float64

	bestPi   float64
	worstPi  float64
	sumOfPis float64
}

func newApproxPiReporter(sampleSize int) ApproxPiReporter {
	return ApproxPiReporter{
		sampleSize: sampleSize,
		sumOfPis:   0.0,
	}
}

func (reporter *ApproxPiReporter) generate() {
	finder := newApproxPiFinder(reporter.sampleSize)
	finder.evaluate()
	approxPi := finder.approxPi()
	error := finder.error()

	if math.Abs(error) <= math.Abs(reporter.lowestError) {
		reporter.bestPi = approxPi
		reporter.lowestError = error
	}

	if math.Abs(error) >= math.Abs(reporter.highestError) {
		reporter.worstPi = approxPi
		reporter.highestError = error
	}

	reporter.sumOfPis += approxPi
}

func (reporter *ApproxPiReporter) repeatGenerates() {
	reporter.lowestError = 100.0
	reporter.highestError = 0.0
	reporter.sumOfPis = 0.0

	for i := 0; i < repeats; i++ {
		reporter.generate()
	}
}

func (reporter *ApproxPiReporter) outputToConsole() {
	fmt.Println("\n")
	fmt.Printf("For sample size of %d\n", reporter.sampleSize)
	fmt.Printf("Best PI  : %f (error = %f%%)\n", reporter.bestPi, reporter.lowestError)
	fmt.Printf("Worst PI : %f (error = %f%%)\n", reporter.worstPi, reporter.highestError)
	fmt.Printf("Avg. PI  : %f (error = %f%%)\n", reporter.averagePi(), reporter.averageError())
}

func (reporter *ApproxPiReporter) averagePi() float64 {
	return reporter.sumOfPis / repeats
}

func (reporter *ApproxPiReporter) averageError() float64 {
	return (reporter.averagePi() - math.Pi) * 100.0 / math.Pi
}

func (reporter *ApproxPiReporter) outputToFiles() {
	reporter.writeToFile("../output/go.average.csv", reporter.averageError())
	reporter.writeToFile("../output/go.best.csv", reporter.lowestError)
	reporter.writeToFile("../output/go.worst.csv", reporter.highestError)
}

func (reporter *ApproxPiReporter) writeToFile(fileName string, value float64) {
	text := fmt.Sprintf("%d,%.4f\n", reporter.sampleSize, value)

	f, _ := os.OpenFile(fileName, os.O_APPEND|os.O_CREATE, 0666)
	io.WriteString(f, text)
	f.Close()
}

func (reporter ApproxPiReporter) output() {
	reporter.repeatGenerates()
	reporter.outputToConsole()
	reporter.outputToFiles()
}
