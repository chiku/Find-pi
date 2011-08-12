#!/usr/bin/env luajit2

dofile('./approx_pi_reporter.lua');

math.randomseed(os.time())

local SAMPLE_SIZES = {1, 10, 100, 1000, 10000, 100000};
for i,size in ipairs(SAMPLE_SIZES) do
  ApproxPiReporter:new({sampleSize = size}):output()
end

