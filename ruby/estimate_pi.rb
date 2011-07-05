#!/usr/bin/env ruby

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
    (approx_pi - Math::PI) * 100 / Math::PI
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

class ApproxPiReporter
  REPEATS = 1000

  attr_reader :sample_size, :best_pi, :worst_pi, :sum_of_pis
  attr_reader :lowest_error, :highest_error

  def initialize(sample_size)
    @sample_size = sample_size
  end

  def generate
    approx_pi, error           = analyze

    @best_pi,   @lowest_error  = approx_pi, error if error.abs < lowest_error.abs
    @worst_pi,  @highest_error = approx_pi, error if error.abs > highest_error.abs
    @sum_of_pis                = sum_of_pis + approx_pi
  end

  def repeat_generates
    @lowest_error  = 100.0
    @highest_error = 0.0
    @sum_of_pis    = 0.0
    1.upto(REPEATS) { generate }
  end

  def output
    repeat_generates
    output_to_console
    output_to_files
  end

  def output_to_console
    $stdout.puts "\nFor sample size of #{sample_size}"
    $stdout.puts "Best PI  : #{best_pi} (error = #{lowest_error}%)"
    $stdout.puts "Worst PI : #{worst_pi} (error = #{highest_error}%)"
    $stdout.puts "Avg. PI  : #{average_pi} (error = #{average_error}%)"
    $stdout.flush
  end

  def output_to_files
    write_to_file "ruby.average.csv", average_error
    write_to_file "ruby.best.csv", lowest_error
    write_to_file "ruby.worst.csv", highest_error
  end

  def average_pi
    sum_of_pis / REPEATS
  end

  def average_error
    (average_pi - Math::PI) * 100 / Math::PI
  end

  def analyze
    finder    = ApproxPiFinder.new(sample_size)
    approx_pi = finder.approx_pi
    error     = finder.error

    [approx_pi, error]
  end

  def write_to_file(file_name, property)
    File.open(file_name, "a+") do |f|
      f.puts "#{sample_size},#{'%.4f' % property}\n"
    end
  end
end

SAMPLE_SIZES = [1, 10, 100, 1_000, 10_000, 100_000]
SAMPLE_SIZES.each do |size|
  ApproxPiReporter.new(size).output
end
