import java.io.*;
import java.util.Formatter;

class ApproxPiReporter
{
    private static int REPEATS = 1000;

    private int sampleSize;
    private double lowestError;
    private double highestError;

    private double bestPi;
    private double worstPi;
    private double sumOfPis = 0.0;

    private void generate() {
        ApproxPiFinder finder = new ApproxPiFinder(sampleSize);
        finder.evaluate();
        double approxPi = finder.approxPi();
        double error = finder.error();

        if (Math.abs(error) < Math.abs(lowestError))
        {
            bestPi = approxPi;
            lowestError = error;
        }

        if (Math.abs(error) > Math.abs(highestError))
        {
            worstPi = approxPi;
            highestError = error;
        }

        sumOfPis += approxPi;
    }

    private void repeatGenerates() {
        lowestError = 100.0;
        highestError = 0.0;
        sumOfPis = 0.0;

        for (int i = 0; i < REPEATS; i++)
            generate();
    }

    private void outputToConsole() {
        System.out.println("\n");
        System.out.println("For sample size of " + sampleSize);
        System.out.println("Best PI  : " + bestPi + "(error = " + lowestError + "%)");
        System.out.println("Worst PI : " + worstPi + "(error = " + highestError + "%)");
        System.out.println("Avg. PI  : " + averagePi() + "(error = " + averageError() + "%)");
    }

    private double averagePi() {
        return sumOfPis / REPEATS;
    }
 
    private double averageError() {
        return (averagePi() - Utils.actualPi()) * 100.0 / Utils.actualPi();
    }

    private void outputToFiles() {
        writeToFile("../output/java.average.csv", averageError());
        writeToFile("../output/java.best.csv", lowestError);
        writeToFile("../output/java.worst.csv", highestError);
    }

    private void writeToFile(String fileName, double value) {
        try {
            FileWriter fstream = new FileWriter(fileName, true);
            Formatter format = new Formatter(fstream);
            format.format("%d,%.4f%n", sampleSize, value);
            format.flush();
            format.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public ApproxPiReporter(int sampleSize) {
        this.sampleSize = sampleSize;
    }

    public void output() {
        repeatGenerates();
        outputToConsole();
        outputToFiles();
    }
}

