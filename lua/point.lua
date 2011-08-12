Point = {
  new = function(self, obj)
    obj = obj or {}
    setmetatable(obj, self)
    self.__index = self
    return obj
  end,

  distance = function(self)
    return math.sqrt(self.x * self.x + self.y * self.y)
  end
}

