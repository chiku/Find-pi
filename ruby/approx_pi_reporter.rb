require  File.dirname(__FILE__) + '/approx_pi_finder'

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
    $stdout.puts "\n"
    $stdout.puts "For sample size of #{sample_size}"
    $stdout.puts "Best PI  : #{best_pi} (error = #{lowest_error}%)"
    $stdout.puts "Worst PI : #{worst_pi} (error = #{highest_error}%)"
    $stdout.puts "Avg. PI  : #{average_pi} (error = #{average_error}%)"
    $stdout.flush
  end

  def output_to_files
    write_to_file "../output/ruby.average.csv", average_error
    write_to_file "../output/ruby.best.csv", lowest_error
    write_to_file "../output/ruby.worst.csv", highest_error
  end

  def average_pi
    sum_of_pis / REPEATS
  end

  def average_error
    (average_pi - Math::PI) * 100.0 / Math::PI
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

