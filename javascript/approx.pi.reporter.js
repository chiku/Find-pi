var approxPiFinder = require('./approx.pi.finder'),
    sprintf        = require('./sprintf-0.7-beta1'),
    fs             = require('fs'),
    util           = require('util');

var ApproxPiReporter = function(sampleSize) {
    if (!(this instanceof ApproxPiReporter)) {
        return new ApproxPiReporter(sampleSize);
    }

    this.sampleSize   = sampleSize;

    this.lowestError  = undefined;
    this.highestError = undefined;
    this.averageError = undefined;

    this.sumOfPis     = undefined;
    this.bestPi       = undefined;
    this.worstPi      = undefined;
    this.averagePi    = undefined;
};

ApproxPiReporter.prototype = (function() {
  var REPEATS = 1000,

      generate = function() {
          var finder = approxPiFinder.ApproxPiFinder(this.sampleSize),
              approxPi = finder.approxPi,
              error = finder.error;

            if (Math.abs(error) <= Math.abs(this.lowestError)) {
                this.bestPi = approxPi;
                this.lowestError = error;
            }
            if (Math.abs(error) >= Math.abs(this.highestError)) {
                this.worstPi = approxPi;
                this.highestError = error;
            }
            this.sumOfPis += approxPi;
        },

        repeatGenerates = function() {
            var i;
            this.lowestError = 100.0;
            this.highestError = 0.0;
            this.sumOfPis = 0.0;

            for (i = 0; i < REPEATS; i+=1) {
                generate.call(this);
            }

            this.averagePi = this.sumOfPis / REPEATS;
            this.averageError = (this.averagePi - Math.PI) * 100.0 / Math.PI;
        },

        output = function() {
            repeatGenerates.call(this);
            outputToConsole.call(this);
            outputToFiles.call(this);
        },

        outputToConsole = function() {
            console.log("\n");
            console.log("For sample size of " + this.sampleSize);
            console.log("Best PI  : " + this.bestPi + " (error = " + this.lowestError + "%)");
            console.log("Worst PI : " + this.worstPi + " (error = " + this.highestError + "%)");
            console.log("Avg. PI  : " + this.averagePi + " (error = " + this.averageError +"%)");
        },

        outputToFiles = function() {
            writeToFile.call(this, "../output/javascript.average.csv", this.averageError);
            writeToFile.call(this, "../output/javascript.best.csv", this.lowestError);
            writeToFile.call(this, "../output/javascript.worst.csv", this.highestError);
        },

        writeToFile = function(fileName, property) {
            var sampleSize = this.sampleSize;
            fs.open(fileName, "a+", function(err, fd) {
                fs.write(fd, sprintf.sprintf("%d,%.4f\n", sampleSize, property));
            });
        };

    return {
        output: output
    };
}());

exports.ApproxPiReporter = ApproxPiReporter;

