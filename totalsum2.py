#!/usr/bin/env python3
#
import math


def suma(n: int) -> int:
    """
    Returns the sum of integer (truncated) square roots of numbers up-to n

    Args:
        n: an integer number
    """
    t: int = 0

    for i in range(1, n + 1):
        s = math.floor(math.sqrt(i))
        t += s
    return t


# Main
block: int = 1_000_000_000
times: int = 3
total: int = 0

print(f"Python")
for i in range(1, times + 1):
    total = total + suma(block)
print(f"{times}×suma({block}) = {total}")
