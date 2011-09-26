class Point
  def initialize(x:double, y:double)
    @x = x
    @y = y
  end

  def distance
    Math.sqrt(@x * @x + @y * @y)
  end
end

