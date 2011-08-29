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

PI = 3.1415926535897932384626433832795028841971693993751058209749445923078164062862089986
