var point = require('./point')

var ApproxPiFinder = function(sampleSize) {
  var sampleSize = sampleSize;
  var RADIUS = 1000.0;

  var points = [];
  for (var i = 0; i < sampleSize; i++) {
    points[i] = point.Point(Math.random() * RADIUS, Math.random() * RADIUS);
  }

  var insideCircle = (function() {
    var sum = 0;
    points.forEach(function(point) {
      if (point.distance() < RADIUS) {
        sum = sum + 1;
      }
    });
    return sum;
  })();

  var approxPi = (4.0 * insideCircle) / sampleSize;

  var error = (approxPi - Math.PI) * 100.0 / Math.PI;

  outputToConsole = function() {
    console.log("Approx pi : " + approxPi);
    console.log("Actual pi : " + Math.PI);
    console.log("Error     : " + error + "%");
  };

  return {
    error: error,
    approxPi: approxPi,
    outputToConsole: outputToConsole
  };
};

exports.ApproxPiFinder = ApproxPiFinder;

