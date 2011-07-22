import math

class Point:
  def __init__(self, x, y):
    self.x = x
    self.y = y

  def distance(self):
    return math.sqrt(self.x * self.x + self.y * self.y)

