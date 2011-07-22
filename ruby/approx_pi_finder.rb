require File.dirname(__FILE__) + '/point'

class ApproxPiFinder
  RADIUS = 1000.0

  attr_reader :points, :sample_size

  def initialize(sample_size)
    @sample_size = sample_size
  end

  def distances
    @distances ||= points.map { |point| point.distance }
  end

  def points
    @points ||= 1.upto(sample_size).map { Point.new(rand * RADIUS, rand * RADIUS) }
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
end

