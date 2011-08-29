Point = Origin mimic do(
  with = method(x:, y:,
    self x = x
    self y = y
    self
  )

  distance = method(
    (x * x + y * y) sqrt
  )
)

