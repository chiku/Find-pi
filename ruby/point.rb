class Point
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def distance
    @distance ||= Math.sqrt(x * x + y * y)
  end
end

