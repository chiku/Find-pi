dofile('./point.lua')

ApproxPiFinder = {
  RADIUS = 1000.0,

  new = function(self, obj)
    obj = obj or {}
    setmetatable(obj, self)
    self.__index = self
    return obj
  end,

  assignPoints = function(self)
    self.points = {}
    for i = 1, self.sampleSize do
      self.points[i] = Point:new({x = math.random() * self.RADIUS, y = math.random() * self.RADIUS})
    end
  end,

  insideCircle = function(self)
    local sum = 0
    for i,point in ipairs(self.points) do
      if (point:distance() < self.RADIUS) then
        sum = sum + 1
      end
    end
    return sum
  end,

  approxPi = function(self)
    return (4.0 * self:insideCircle()) / self.sampleSize
  end,

  error = function(self)
    return (self:approxPi() - math.pi) * 100.0 / math.pi
  end,

  outputToConsole = function(self)
    print(string.format("Approx pi : %f", self:approxPi()));
    print(string.format("Actual pi : %f", math.pi));
    print(string.format("Error     : %f%%", self:error()));
  end
}

