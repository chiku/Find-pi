use("approx_pi_finder")

ApproxPiReporter = Origin mimic do(
  REPEATS = 1000

  with = method(sampleSize:,
    self sampleSize = sampleSize
    self
  )

  generate = method(
    finder   = ApproxPiFinder mimic with(sampleSize: sampleSize)
    finder evaluate
    approxPi = finder approxPi
    error    = finder error

    if(error abs <= lowestError abs,
      self bestPi = approxPi
      self lowestError = error
    )
    if(error abs >= highestError abs,
      self worstPi = approxPi
      self highestError = error
    )
    self sumOfPis = sumOfPis + approxPi
  )

  repeatGenerates = method(
    self lowestError  = 100.0
    self highestError = 0.0
    self sumOfPis     = 0.0
    self bestPi       = nil
    self worstPi      = nil
    (0 ... REPEATS) each(_,
      generate
    )
  )

  output = method(
    repeatGenerates
    outputToConsole
    outputToFiles
  )

  outputToConsole = method(
    "\n" println
    "For sample size of #{sampleSize}" println
    "Best PI  : #{bestPi} (error = #{lowestError}%)" println
    "Worst PI : #{worstPi} (error = #{highestError}%)" println
    "Avg. PI  : #{averagePi} (error = #{averageError}%)" println
  )

  outputToFiles = method(
    writeToFile("../output/ioke.average.csv", averageError)
    writeToFile("../output/ioke.best.csv", lowestError)
    writeToFile("../output/ioke.worst.csv", highestError)
  )

  averagePi = method(
    sumOfPis / REPEATS
  )

  averageError = method(
    (averagePi - PI) * 100.0 / PI
  )

  writeToFile = method(fileName, property,
    FileSystem withOpenFile(fileName,
      roundingOffKernel = (property asText + ".0000") split(".")
      integer = roundingOffKernel first
      decimal = (roundingOffKernel second + "0000") [0..3]
      fn(f,
        f println("#{sampleSize},#{integer}.#{decimal}")
      )
    )
  )
)

