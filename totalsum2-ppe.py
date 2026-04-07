#!/usr/bin/env python3
#
import math
import sys
from concurrent.futures import ProcessPoolExecutor


def suma(n: int) -> int:
    t: int = 0
    for i in range(1, n + 1):
        s = math.floor(math.sqrt(i))
        t += s
    return t


if __name__ == "__main__":
    block = 1_000_000_000
    times = 3
    expected = 63244053298881

    print("Python (Parallel):")
    with ProcessPoolExecutor() as executor:
        # Map the function across multiple processes
        results = list(executor.map(suma, [block] * times))
        total = sum(results)

    print(f"{times}×suma({block}) = {total}")
    if total != expected:
        print(f"ERROR: wrong result! ({total})", file=sys.stderr)
