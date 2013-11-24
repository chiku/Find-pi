class EstimatePi {
    static def SAMPLE_SIZES = [1, 10, 100, 1000, 10000, 100000]

    public static void main(String[] args) {
        SAMPLE_SIZES.each {
            new ApproxPiReporter(it).output()
        }
    }
}
