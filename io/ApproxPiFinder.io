doFile("Point.io")

ApproxPiFinder := Object clone do(
  RADIUS := 1000.0

  init := method(
    self points := List clone
  )

  withSampleSize := method(sampleSize,
    self sampleSize := sampleSize
    self
  )

  assignPoints := method(
    sampleSize repeat(
      points append(
        Point clone withX(Random value(RADIUS)) withY(Random value(RADIUS))
      )
    )
  )

  insideCircle := method(
    self insideCircle = points map(point, point distance) select(distance, distance < RADIUS) size
  )

  approxPi := method(
    (4.0 * insideCircle) / sampleSize
  )

  error := method(
    (approxPi - Number constants pi) * 100.0 / Number constants pi
  )

  outputToConsole := method(
    "Approx pi : #{approxPi}" interpolate println
    "Actual pi : #{Number constants pi}" interpolate println
    "Error     : #{error} %" interpolate println
  )

  evaluate := method(
    assignPoints
  )
)

