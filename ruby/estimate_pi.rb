#!/usr/bin/env ruby

require  File.dirname(__FILE__) + '/approx_pi_reporter'

SAMPLE_SIZES = [1, 10, 100, 1_000, 10_000, 100_000]
SAMPLE_SIZES.each do |size|
  ApproxPiReporter.new(size).output
end

