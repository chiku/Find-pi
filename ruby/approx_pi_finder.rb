class ApproxPiFinder
  RADIUS = 1000.0

  attr_reader :distances, :approx_pi, :sample_size

  def initialize(sample_size)
    @sample_size = sample_size
  end

  def distances
    @distances ||= xs.zip(ys).map { |x, y| Math.sqrt(x * x + y * y) }
  end

  def xs
    @xs ||= random_numbers
  end

  def ys
    @ys ||= random_numbers
  end

  def inside_circle
    distances.count {|d| d < RADIUS}
  end

  def approx_pi
    @approx_pi ||= (4.0 * inside_circle) / sample_size
  end

  def error
    (approx_pi - Math::PI) * 100.0 / Math::PI
  end

  def output_to_console
    $stdout.puts "Approx pi : #{approx_pi}"
    $stdout.puts "Actual pi : #{Math::PI}"
    $stdout.puts "Error     : #{error}%"
  end

  private

  def random_numbers
    1.upto(sample_size).map { rand * RADIUS }
  end
end

