"use strict";

var point = require('./point');

var ApproxPiFinder = function(sampleSize) {
    if (!(this instanceof ApproxPiFinder)) {
        return new ApproxPiFinder(sampleSize);
    }

    var RADIUS = 1000.0,
        points = [],
        insideCircle = 0;

    for (var i = 0; i < sampleSize; i++) {
        points[i] = point.Point(Math.random() * RADIUS, Math.random() * RADIUS);
    }

    insideCircle = (function() {
        var sum = 0;
        points.forEach(function(point) {
            if (point.distance() < RADIUS) {
                sum += 1
            }
        });
        return sum;
    }());

    this.approxPi = (4.0 * insideCircle) / sampleSize;
    this.error = (this.approxPi - Math.PI) * 100.0 / Math.PI;
};

ApproxPiFinder.prototype = function() {
    var outputToConsole = function() {
        console.log("Approx pi : " + this.approxPi);
        console.log("Actual pi : " + Math.PI);
        console.log("Error         : " + this.error + "%");
    };

    return {
        outputToConsole: outputToConsole
    };
};

exports.ApproxPiFinder = ApproxPiFinder;
