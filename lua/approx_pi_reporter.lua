dofile('./approx_pi_finder.lua')

ApproxPiReporter = {
  REPEATS = 1000,

  new = function(self, obj)
    obj = obj or {}
    setmetatable(obj, self)
    self.__index = self
    return obj
  end,

  generate = function(self)
    local finder = ApproxPiFinder:new({sampleSize = self.sampleSize})
    finder:assignPoints()
    local approxPi = finder:approxPi()
    local error = finder:error()

    if (math.abs(error) <= math.abs(self.lowestError)) then
      self.bestPi = approxPi
      self.lowestError = error
    end
    if (math.abs(error) >= math.abs(self.highestError)) then
      self.worstPi = approxPi
      self.highestError = error
    end
    self.sumOfPis = self.sumOfPis + approxPi
  end,

  repeatGenerates = function(self)
    self.lowestError = 100.0
    self.highestError = 0.0;
    self.sumOfPis = 0.0;
    for i = 1, self.REPEATS do
      self:generate();
    end
    self.averagePi = self.sumOfPis / self.REPEATS;
    self.averageError = (self.averagePi - math.pi) * 100.0 / math.pi;
  end,

  output = function(self)
    self:repeatGenerates()
    self:outputToConsole()
    self:outputToFiles()
  end,

  outputToConsole = function(self)
    print("\n")
    print(string.format("For sample size of %d", self.sampleSize));
    print(string.format("Best PI  : %f (error = %f%%)", self.bestPi, self.lowestError));
    print(string.format("Worst PI : %f (error = %f%%)", self.worstPi, self.highestError));
    print(string.format("Avg. PI  : %f (error = %f%%)", self.averagePi, self.averageError));
  end,

  outputToFiles = function(self)
    self:writeToFile("../output/lua.average.csv", self.averageError);
    self:writeToFile("../output/lua.best.csv", self.lowestError);
    self:writeToFile("../output/lua.worst.csv", self.highestError);
  end,

  writeToFile = function(self, fileName, property)
    local file = io.open(fileName, "a")
    file:write(string.format("%d,%.4f\n", self.sampleSize, property))
    file:close()
  end
}

