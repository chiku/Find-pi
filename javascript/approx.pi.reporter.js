var approxPiFinder = require('./approx.pi.finder'),
    sprintf        = require('./sprintf-0.7-beta1'),
    fs             = require('fs'),
    util           = require('util');

var ApproxPiReporter = function(sampleSize) {
  var sampleSize   = sampleSize,
      REPEATS      = 1000,
      lowestError  = undefined,
      highestError = undefined,
      sumOfPis     = undefined,
      bestPi       = undefined,
      worstPi      = undefined,
      averagePi    = undefined,
      averageError = undefined;

  var generate = function() {
    var finder = approxPiFinder.ApproxPiFinder(sampleSize);
    var approxPi = finder.approxPi,
        error    = finder.error;

    if (Math.abs(error) <= Math.abs(lowestError)) {
      bestPi = approxPi;
      lowestError = error;
    }
    if (Math.abs(error) >= Math.abs(highestError)) {
      worstPi = approxPi;
      highestError = error;
    }
    sumOfPis = sumOfPis + approxPi;
  };

  var repeatGenerates = function() {
    lowestError = 100.0;
    highestError = 0.0;
    sumOfPis = 0.0;
    for (var i = 0; i < REPEATS; i++) {
      generate();
    }
    averagePi = sumOfPis / REPEATS;
    averageError = (averagePi - Math.PI) * 100.0 / Math.PI;
  };

  var output = function() {
    repeatGenerates();
    outputToConsole();
    outputToFiles();
  };

  var outputToConsole = function() {
    console.log("\n")
    console.log("For sample size of " + sampleSize);
    console.log("Best PI  : " + bestPi + "(error = " + lowestError + "%)");
    console.log("Worst PI : " + worstPi + "(error = " + highestError + "%)");
    console.log("Avg. PI  : " + averagePi + "(error = " + averageError +"%)");
  };

  var outputToFiles = function() {
    writeToFile("../output/javascript.average.csv", averageError);
    writeToFile("../output/javascript.best.csv", lowestError);
    writeToFile("../output/javascript.worst.csv", highestError);
  };

  var writeToFile = function(fileName, property) {
    fs.open(fileName, "a+", function(err, fd) {
      fs.write(fd, sprintf.sprintf("%d,%.4f\n", sampleSize, property));
      //fs.write(fd, sampleSize + "," + property + "\n");
      fs.close(fd);
    });
  };

  return {
    output: output
  };
};

exports.ApproxPiReporter = ApproxPiReporter;

