
# cython: boundscheck=False, wraparound=False, nonecheck=False
import math

def suma_cython(int n) -> int:
    cdef int i
    cdef long long t = 0

    for i in range(1, n + 1):
        t += math.floor(math.sqrt(i))
    return t

def suma_fast_cython(int n) -> int:
    """Optimized version using mathematical grouping"""
    cdef int k, max_k
    cdef long long total = 0

    max_k = int(math.sqrt(n))

    # Handle full ranges
    for k in range(1, max_k):
        total += k * (2 * k + 1)

    # Handle the last partial range
    cdef long long last_start = max_k * max_k
    cdef long long last_count = n - last_start + 1
    total += max_k * last_count

    return total
