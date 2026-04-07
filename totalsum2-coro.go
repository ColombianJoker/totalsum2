package main

import (
	"fmt"
	"math"
	"os"
	"sync"
)

func suma(n int) int64 {
	var t int64 = 0
	for i := 1; i <= n; i++ {
		s := int64(math.Sqrt(float64(i)))
		t += s
	}
	return t
}

func main() {
	block := 1_000_000_000
	times := 3
	var total int64 = 0
	expected := int64(63244053298881)

	fmt.Println("Go (Parallel Goroutines)")

	// Use a channel to collect results and a WaitGroup to synchronize
	resChan := make(chan int64, times)
	var wg sync.WaitGroup

	for i := 0; i < times; i++ {
		wg.Add(1)
		go func() {
			defer wg.Done()
			resChan <- suma(block)
		}()
	}

	// Close channel once all goroutines finish
	go func() {
		wg.Wait()
		close(resChan)
	}()

	for res := range resChan {
		total += res
	}

	fmt.Printf("%d×suma(%d) = %d\n", times, block, total)

	if total != expected {
		fmt.Fprintf(os.Stderr, "ERROR: wrong result! (%d)\n", total)
	}
}
