#include <math.h>
#include <omp.h>
#include <stdio.h>

/**
 * Returns the sum of integer (truncated) square roots of numbers up to n.
 * [cite: 2]
 */
long long suma(int n) {
  long long t = 0;
  for (int i = 1; i <= n; i++) {
    long long s = (long long)sqrt(i);
    t += s;
  }
  return t;
}

int main() {
  int block = 1000000000;
  int times = 3;
  long long total = 0;
  long long expected = 63244053298881;

  printf("C (OpenMP):\n");

// Parallelize the loop. The 'reduction' clause ensures 'total'
// is combined correctly from all threads.
#pragma omp parallel for reduction(+ : total)
  for (int i = 0; i < times; i++) {
    total += suma(block);
  }

  printf("%d×suma(%d) = %lld\n", times, block, total);

  if (total != expected) {
    fprintf(stderr, "ERROR: wrong result! (%lld)\n", total);
  }

  return 0;
}
