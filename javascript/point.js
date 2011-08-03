var Point = function(x, y) {
  var x = x;
  var y = y;

  var distance1 = function() {
    return Math.sqrt(x * x + y * y);
  }

  return {
    distance: distance1
  }
};

exports.Point = Point;

