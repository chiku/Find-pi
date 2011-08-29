use("point")

ApproxPiFinder = Origin mimic do(
  RADIUS = 1000

  initialize = method(
    self points = List mimic
  )

  with = method(sampleSize:,
    self sampleSize = sampleSize
    self
  )

  assignPoints = method(
    (0 ... sampleSize) each(_,
      points << (
        Point mimic with(x: System randomNumber() % RADIUS, y: System randomNumber() % RADIUS)
      )
    )
  )

  insideCircle = method(
    self insideCircle = points map(point, point distance) count(distance, distance < RADIUS)
  )

  approxPi = method(
    (4.0 * insideCircle()) / sampleSize
  )

  error = method(
    (approxPi - PI) * 100.0 / PI
  )

  outputToConsole = method(
    "Approx pi : #{approxPi}" println
    "Actual pi : #{3.14}" println
    "Error     : #{error} %" println
  )

  evaluate = method(
    assignPoints
  )
)

