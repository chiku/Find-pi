var Point = function(x, y) {
  var x = x,
      y = y;

  var distance = function() {
    return Math.sqrt(x * x + y * y);
  }

  return {
    distance: distance
  }
};

exports.Point = Point;

