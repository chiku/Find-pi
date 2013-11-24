class Point {
    double x
    double y

    Point(double x, double y) {
        this.x = x
        this.y = y
    }

    public double distance() {
        Math.sqrt(x * x + y * y)
    }
}
