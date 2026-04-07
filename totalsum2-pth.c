#include <math.h>
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>

// Structure to pass arguments to and from threads
typedef struct {
  int n;
  long long result;
} ThreadData;

/**
 * Returns the sum of integer (truncated) square roots of numbers up to n.
 * [cite: 2]
 */
long long suma_logic(int n) {
  long long t = 0;
  // Iterating through the block [cite: 3]
  for (int i = 1; i <= n; i++) {
    long long s = (long long)sqrt(i);
    t += s; // [cite: 4]
  }
  return t;
}

// Thread entry point
void *suma_worker(void *arg) {
  ThreadData *data = (ThreadData *)arg;
  data->result = suma_logic(data->n);
  return NULL;
}

int main() {
  const int block = 1000000000;
  const int times = 3;                       // [cite: 5]
  const long long expected = 63244053298881; // [cite: 5]

  pthread_t threads[times];
  ThreadData thread_data[times];
  long long total = 0;

  printf("C (Pthreads):\n"); // [cite: 6]

  // Create threads to execute suma concurrently
  for (int i = 0; i < times; i++) {
    thread_data[i].n = block;
    if (pthread_create(&threads[i], NULL, suma_worker, &thread_data[i]) != 0) {
      perror("Failed to create thread");
      return 1;
    }
  }

  // Wait for all threads to finish and aggregate results
  for (int i = 0; i < times; i++) { // [cite: 7]
    pthread_join(threads[i], NULL);
    total += thread_data[i].result;
  }

  printf("%d×suma(%d) = %lld\n", times, block, total);

  // Validate the final result [cite: 8]
  if (total != expected) {
    fprintf(stderr, "ERROR: wrong result! (%lld)\n", total); // [cite: 9]
  }

  return 0;
}
