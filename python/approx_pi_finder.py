import random
import math

class ApproxPiFinder:
  RADIUS = 1000.0

  def __init__(self, sample_size):
    self.sample_size = sample_size
    self.cached_inside_circle = None

  def distances(self):
    return [math.sqrt(x*x + y*y) for x,y in zip(self.xs(), self.ys())]

  def xs(self):
    return self.random_numbers()

  def ys(self):
    return self.random_numbers()

  def inside_circle(self):
    if self.cached_inside_circle != None: return self.cached_inside_circle
    self.cached_inside_circle = sum(1 for d in self.distances() if d < self.RADIUS)
    return self.cached_inside_circle

  def approx_pi(self):
    return (4.0 * self.inside_circle()) / self.sample_size

  def error(self):
    return (self.approx_pi() - math.pi) * 100.0 / math.pi

  def output_to_console(self):
    print("Approx pi : ", self.approx_pi())
    print("Actual pi : ", math.pi)
    print("Error     : ", self.error(), "%")

  def random_numbers(self):
    return [random.uniform(0.0, self.RADIUS) for i in range(self.sample_size)]

