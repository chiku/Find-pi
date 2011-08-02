Point := Object clone do(
  withX := method(x,
    self x := x
    self
  )

  withY := method(y,
    self y := y
    self
  )

  distance := method(
    (x * x + y * y) sqrt
  )
)

