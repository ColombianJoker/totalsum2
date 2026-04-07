#!/usr/bin/env uv run

import sys

import totalsum2_cy

# Main
block = 1000000000
times = 3
total = 0
expected = 63244053298881

print("Cython:")

for i in range(1, times + 1):
    total += totalsum2_cy.suma(block)

print(f"{times}×suma({block}) = {total}")

if total != expected:
    print(f"ERROR: wrong result! ({total})", file=sys.stderr)
