import java.io.*;
import java.text.DecimalFormat;

class ApproxPiReporter
  def initialize(sample_size:fixnum)
    @sample_size = sample_size
    @REPEATS = 1000
  end

  def generate
    finder = ApproxPiFinder.new(@sample_size)
    finder.evaluate_points
    approx_pi = finder.approx_pi
    error = finder.error

    if Math.abs(error) <= Math.abs(@lowest_error)
      @best_pi = approx_pi
      @lowest_error  = error
    end

    if Math.abs(error) >= Math.abs(@highest_error)
      @worst_pi = approx_pi
      @highest_error = error
    end

    @sum_of_pis = @sum_of_pis + approx_pi
  end

  def repeat_generates
    @lowest_error  = 100.0
    @highest_error = 0.0
    @sum_of_pis    = 0.0
    1.upto(@REPEATS) { |x| generate }
  end

  def output
    repeat_generates
    output_to_console
    output_to_files
  end

  def output_to_console
    puts "\n"
    puts "For sample size of #{@sample_size}"
    puts "Best PI  : #{@best_pi} (error = #{@lowest_error}%)"
    puts "Worst PI : #{@worst_pi} (error = #{@highest_error}%)"
    puts "Avg. PI  : #{average_pi} (error = #{average_error}%)"
  end

  def output_to_files
    write_to_file "../output/mirah.average.csv", average_error
    write_to_file "../output/mirah.best.csv", @lowest_error
    write_to_file "../output/mirah.worst.csv", @highest_error
  end

  def average_pi
    @sum_of_pis / @REPEATS
  end

  def average_error
    (average_pi - Math.PI) * 100.0 / Math.PI
  end

  def write_to_file(file_name:string, property:double)
    fstream = FileWriter.new(file_name, true)
    formatter = DecimalFormat.new("#0.0000")
    out = BufferedWriter.new(fstream)
    out.write("#{@sample_size},#{formatter.format(property)}\n")
    out.close()
  end
end

