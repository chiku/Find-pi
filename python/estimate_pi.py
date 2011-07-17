#!/usr/bin/env python

import approx_pi_reporter

SAMPLE_SIZES = [1, 10, 100, 1000, 10000, 100000]

for size in SAMPLE_SIZES:
  approx_pi_reporter.ApproxPiReporter(size).output()

