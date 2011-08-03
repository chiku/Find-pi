#!/usr/bin/env node

var approxPiReporter = require('./approx.pi.reporter');

var SAMPLE_SIZES = [1, 10, 100, 1000, 10000, 100000];
SAMPLE_SIZES.forEach(function(size) {
  approxPiReporter.ApproxPiReporter(size).output()
});

