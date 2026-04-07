# cython: language_level=3
from libc.math cimport sqrt

def suma(int n):
    """
    Returns the sum of integer (truncated) square roots of numbers up-to n.
    Calculated using C types for performance.
    """
    cdef unsigned long long t = 0
    cdef int i
    cdef unsigned long long s

    for i in range(1, n + 1):
        # Using the C sqrt function directly
        s = <unsigned long long>sqrt(<double>i)
        t += s
    return t
