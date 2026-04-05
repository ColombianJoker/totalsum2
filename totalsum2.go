package main

import (
	"fmt"
	"math"
	"os"
)

// suma returns the sum of integer (truncated) square roots of numbers up to n.
// Using int64 to handle large accumulations, similar to 'long long' in C.
func suma(n int) int64 {
	var t int64 = 0

	for i := 1; i <= n; i++ {
		// math.Sqrt takes and returns float64; we cast to int64 to truncate
		s := int64(math.Sqrt(float64(i)))
		t += s
	}
	return t
}

func main() {
	block := 1_000_000_000
	times := 3
	var total int64 = 0

	fmt.Println("Go")

	for i := 1; i <= times; i++ {
		total += suma(block)
	}

	fmt.Printf("%d×suma(%d) = %d\n", times, block, total)

	if total != 63244053298881 {
		fmt.Fprintf(os.Stderr, "ERROR: wrong result! (%d)", total)
	}
}
