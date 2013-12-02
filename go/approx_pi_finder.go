package main

import (
	"fmt"
	"math"
	"math/rand"
)

const (
	radius = 1000.0
)

func randomTill(limit float64) float64 {
	return rand.Float64() * limit
}

type ApproxPiFinder struct {
	sampleSize int
	points     []Point
}

func newApproxPiFinder(sampleSize int) ApproxPiFinder {
	return ApproxPiFinder{
		sampleSize: sampleSize,
		points:     make([]Point, sampleSize),
	}
}

func (finder *ApproxPiFinder) assignPoints() {
	for i := 0; i < finder.sampleSize; i++ {
		x := randomTill(radius)
		y := randomTill(radius)
		finder.points[i] = newPoint(x, y)
	}
}

func (finder *ApproxPiFinder) totalPointsInsideCircle() int {
	count := 0
	for _, point := range finder.points {
		if point.distance() < radius {
			count++
		}
	}
	return count
}

func (finder *ApproxPiFinder) approxPi() float64 {
	return 4.0 * float64(finder.totalPointsInsideCircle()) / float64(finder.sampleSize)
}

func (finder *ApproxPiFinder) error() float64 {
	return (finder.approxPi() - math.Pi) * 100.0 / math.Pi
}

func (finder *ApproxPiFinder) evaluate() {
	finder.assignPoints()
}

func (finder *ApproxPiFinder) outputToConsole() {
	fmt.Println()
	fmt.Printf("Approx pi  : %f\n", finder.approxPi())
	fmt.Printf("Actual pi  : %f\n", math.Pi)
	fmt.Printf("Error      : %f%%\n", finder.error())
}
