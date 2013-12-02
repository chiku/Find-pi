package main

func main() {
	sampleSizes := []int{1, 10, 100, 1000, 10000, 100000}

	for _, sampleSize := range sampleSizes {
		NewApproxPiReporter(sampleSize).output()
	}
}
