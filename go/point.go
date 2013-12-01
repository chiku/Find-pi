package main

import "math"

type Point struct {
	x float64
	y float64
}

func NewPoint(X float64, Y float64) Point {
	return Point{x: X, y: Y}
}

func (point Point) Distance() float64 {
	return math.Sqrt(point.x*point.x + point.y*point.y)
}
