class ApproxPiFinder {
    private static double RADIUS = 1000.0;
    private int sampleSize;

    private ArrayList<Point> points;

    private void assignPoints() {
        (0..sampleSize).each {
            points.add(new Point(Utils.randomTill(RADIUS), Utils.randomTill(RADIUS)))
        }
    }

    private int totalPointsInsideCircle() {
        points.findAll {
            it.distance() < RADIUS
        }.size()
    }

    public ApproxPiFinder(int sampleSize) {
        this.sampleSize = sampleSize;
        this.points = new ArrayList<Point>(this.sampleSize)
    }

    public double approxPi() {
        (4.0 * totalPointsInsideCircle()) / sampleSize
    }

    public double error() {
        (approxPi() - Utils.actualPi()) * 100.0 / Utils.actualPi()
    }

    public void evaluate() {
        assignPoints()
    }

    public void outputToConsole() {
        println ""
        println "Approx pi  : ${approxPi()}"
        println "Actual pi  : ${Utils.actualPi()}"
        println "Error      : ${error()}%"
    }
}
