import math
import sys

import approx_pi_finder

class ApproxPiReporter:
  REPEATS = 1000

  def __init__(self, sample_size):
    self.sample_size = sample_size

  def generate(self):
    approx_pi, error = self.analyze()
    if math.fabs(error) < math.fabs(self.lowest_error):  self.best_pi,   self.lowest_error  = approx_pi, error
    if math.fabs(error) > math.fabs(self.highest_error): self.worst_pi,  self.highest_error = approx_pi, error
    self.sum_of_pis = self.sum_of_pis + approx_pi

  def repeat_generates(self):
    self.lowest_error  = 100.0
    self.highest_error = 0.0
    self.sum_of_pis    = 0.0
    for _ in range(self.REPEATS):
      self.generate()

  def output(self):
    self.repeat_generates()
    self.output_to_console()
    self.output_to_files()

  def output_to_console(self):
    print("\n")
    print("For sample size of {0}".format(self.sample_size))
    print("Best PI  : {0} (error = {1}%)".format(self.best_pi, self.lowest_error))
    print("Worst PI : {0} (error = {1}%)".format(self.worst_pi, self.highest_error))
    print("Avg. PI  : {0} (error = {1}%)".format(self.average_pi(), self.average_error()))
    sys.stdout.flush()

  def output_to_files(self):
    self.write_to_file("../output/python.average.csv", self.average_error())
    self.write_to_file("../output/python.best.csv", self.lowest_error)
    self.write_to_file("../output/python.worst.csv", self.highest_error)

  def average_pi(self):
    return self.sum_of_pis / self.REPEATS

  def average_error(self):
    return (self.average_pi() - math.pi) * 100.0 / math.pi

  def analyze(self):
    finder    = approx_pi_finder.ApproxPiFinder(self.sample_size)
    approx_pi = finder.approx_pi()
    error     = finder.error()
    return [approx_pi, error]

  def write_to_file(self, file_name, property):
    with open(file_name, mode='a+', encoding='utf-8') as file:
      file.write("{0},{1:.4f}\n".format(self.sample_size, property))

