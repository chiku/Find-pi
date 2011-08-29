PI = 3.1415926535897932384626433832795028841971693993751058209749445923078164062862089986

Number withDecimalsBeyondNDroppedAsText = method(n,
  nZeroes = "0" * n
  roundingOffKernel = (self asText + "." + nZeroes) split(".")
  integer = roundingOffKernel first
  decimal = (roundingOffKernel second + nZeroes) [0..(n-1)]
  "#{integer}.#{decimal}"
)

