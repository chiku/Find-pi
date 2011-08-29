#!/usr/bin/env ioke

use("approx_pi_reporter")

SAMPLE_SIZES = list(1, 10, 100, 1000, 10000)
SAMPLE_SIZES each(size,
  ApproxPiReporter mimic with(sampleSize: size) output
)

