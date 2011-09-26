class ApproxPiFinder
  def initialize(sample_size:fixnum)
    @sample_size = sample_size
    @RADIUS = 1000.0
  end

  def foo(i:int)
    i.upto(3) {|x| puts x }
  end

  def evaluate_points:void
    @points = Point[@sample_size]
    0.upto(@sample_size - 1) {|i| @points[i] = Point.new(Math.random * @RADIUS, Math.random * @RADIUS) }
  end

  def inside_circle
    count = 0
    @points.each {|point| count += point.distance < @RADIUS ? 1 : 0}
    count
  end

  def approx_pi
    (4.0 * inside_circle) / @sample_size
  end

  def error
    (approx_pi - Math.PI) * 100.0 / Math.PI
  end

  def output_to_console
    puts "Approx pi : #{approx_pi}"
    puts "Actual pi : #{Math.PI}"
    puts "Error     : #{error}%"
  end
end

