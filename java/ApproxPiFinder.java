import java.util.ArrayList;

class ApproxPiFinder
{
    private static double RADIUS = 1000.0;
    private int sampleSize;

    private ArrayList<Point> points;

    private void assignPoints() {
        for (int i = 0; i < sampleSize; i++)
            points.add(new Point(Utils.randomTill(RADIUS), Utils.randomTill(RADIUS)));
    }

    private int totalPointsInsideCircle() {
        int count = 0;
        for(Point point : points)
            if (point.distance() < RADIUS)
                count++;
        return count;
    }

    public ApproxPiFinder(int sampleSize) {
        this.sampleSize = sampleSize;
        this.points = new ArrayList<Point>(this.sampleSize);
    }

    public double approxPi() {
        return (4.0 * totalPointsInsideCircle()) / sampleSize;
    }

    public double error() {
        return (approxPi() - Utils.actualPi()) * 100.0 / Utils.actualPi();
    }

    public void evaluate() {
        assignPoints();
    }

    public void outputToConsole() {
        System.out.println("");
        System.out.println("Approx pi  : " + approxPi());
        System.out.println("Actual pi  : " + Utils.actualPi());
        System.out.println("Error      : " + error() + "%");
    }
}

