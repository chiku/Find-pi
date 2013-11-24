class EstimatePi
{
    static int SAMPLE_SIZES[] = {1, 10, 100, 1000, 10000, 100000};

    public static void main(String[] args) {
    for(int sampleSize : SAMPLE_SIZES)
        new ApproxPiReporter(sampleSize).output();
    }
}

