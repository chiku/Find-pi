doFile("ApproxPiFinder.io")

ApproxPiReporter := Object clone do(
  REPEATS := 1000

  withSampleSize := method(sampleSize,
    self sampleSize := sampleSize
    self
  )

  generate := method(
    finder   := ApproxPiFinder clone withSampleSize(sampleSize)
    finder evaluate
    approxPi := finder approxPi
    error    := finder error

    if(error abs <= lowestError abs,
      bestPi = approxPi
      lowestError = error
    )
    if(error abs >= highestError abs,
      worstPi = approxPi
      highestError = error
    )
    sumOfPis = sumOfPis + approxPi
  )

  repeatGenerates := method(
    self lowestError  := 100.0
    self highestError := 0.0
    self sumOfPis     := 0.0
    self bestPi       := nil
    self worstPi      := nil
    REPEATS repeat(
      generate
    )
  )

  output := method(
    repeatGenerates
    outputToConsole
    outputToFiles
  )

  outputToConsole := method(
    "\n" println
    "For sample size of #{sampleSize}" interpolate println
    "Best PI  : #{bestPi} (error = #{lowestError}%)" interpolate println
    "Worst PI : #{worstPi} (error = #{highestError}%)" interpolate println
    "Avg. PI  : #{averagePi} (error = #{averageError}%)" interpolate println
    File clone standardOutput flush
  )

  outputToFiles := method(
    writeToFile("../output/io.average.csv", averageError)
    writeToFile("../output/io.best.csv", lowestError)
    writeToFile("../output/io.worst.csv", highestError)
  )

  averagePi := method(
    sumOfPis / REPEATS
  )

  averageError := method(
    (averagePi - Number constants pi) * 100.0 / Number constants pi
  )

  writeToFile := method(fileName, property,
    file := File clone openForAppending(fileName)
    file write("#{sampleSize},#{property asString(0, 4)}\n" interpolate)
    file close
  )
)

