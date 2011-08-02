#!/usr/bin/env io

doFile("ApproxPiReporter.io")

SAMPLE_SIZES := list(1, 10, 100, 1000, 10000, 100000)
SAMPLE_SIZES map(size,
  ApproxPiReporter clone withSampleSize(size) output
)

