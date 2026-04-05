#include <math.h>
#include <stdio.h>

/**
 * Returns the sum of integer (truncated) square roots of numbers up to n.
 * Using long long to prevent overflow for large values of n.
 */
long long suma(int n) {
  long long t = 0;

  for (int i = 1; i <= n; i++) {
    // sqrt returns double; casting to long long truncates/floors the value
    long long s = (long long)sqrt(i);
    t += s;
  }
  return t;
}

int main() {
  int block = 1000000000;
  int times = 3;
  long long total = 0;

  printf("C (Standard)\n");

  for (int i = 1; i <= times; i++) {
    total += suma(block);
  }

  // %lld is the format specifier for long long
  printf("%d×suma(%d) = %lld\n", times, block, total);

  return 0;
}
