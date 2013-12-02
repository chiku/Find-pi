package main

import "math"

type Point struct {
	x float64
	y float64
}

func newPoint(X float64, Y float64) Point {
	return Point{x: X, y: Y}
}

func (point Point) distance() float64 {
	return math.Sqrt(point.x*point.x + point.y*point.y)
}
