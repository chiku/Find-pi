var Point = function(x, y) {
    if (!(this instanceof Point)) {
        return new Point(x, y);
    }

    this.x = x;
    this.y = y;
};

Point.prototype = (function() {
    var distance = function() {
        return Math.sqrt(this.x * this.x + this.y * this.y);
    };

    return {
        distance: distance
    };
}());

exports.Point = Point;
