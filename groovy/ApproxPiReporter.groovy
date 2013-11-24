class ApproxPiReporter {
    private static int REPEATS = 1000

    private int sampleSize
    private double lowestError
    private double highestError

    private double bestPi
    private double worstPi
    private double sumOfPis = 0.0

    private void generate() {
        ApproxPiFinder finder = new ApproxPiFinder(sampleSize)
        finder.evaluate()
        double approxPi = finder.approxPi()
        double error = finder.error()

        if (Math.abs(error) <= Math.abs(lowestError)) {
            bestPi = approxPi
            lowestError = error
        }

        if (Math.abs(error) >= Math.abs(highestError)) {
            worstPi = approxPi
            highestError = error
        }

        sumOfPis += approxPi
    }

    private void repeatGenerates() {
        lowestError = 100.0
        highestError = 0.0
        sumOfPis = 0.0

        for (int i = 0; i < REPEATS; i++)
            generate()
    }

    private void outputToConsole() {
        println ""
        println "For sample size of ${sampleSize}"
        println "Best PI  : ${bestPi} (error = ${lowestError}%)"
        println "Best PI  : ${worstPi} (error = ${highestError}%)"
        println "Best PI  : ${averagePi()} (error = ${averagePi()}%)"
    }

    private double averagePi() {
        sumOfPis / REPEATS
    }
 
    private double averageError() {
        (averagePi() - Utils.actualPi()) * 100.0 / Utils.actualPi()
    }

    private void outputToFiles() {
        writeToFile("../output/java.average.csv", averageError())
        writeToFile("../output/java.best.csv", lowestError)
        writeToFile("../output/java.worst.csv", highestError)
    }

    private void writeToFile(String fileName, double value) {
        try {
            FileWriter fstream = new FileWriter(fileName, true)
            Formatter format = new Formatter(fstream)
            format.format("%d,%.4f%n", sampleSize, value)
            format.flush()
            format.close()
        } catch (Exception e) {
            System.out.println(e.getMessage())
        }
    }

    public ApproxPiReporter(int sampleSize) {
        this.sampleSize = sampleSize
    }

    public void output() {
        repeatGenerates()
        outputToConsole()
        outputToFiles()
    }
}
