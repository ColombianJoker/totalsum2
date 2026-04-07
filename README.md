# totalsum2

totalsum2: a program to compare simple arithmetic performance between languages

## **C** (plain):

```sh
╰→ time ./totalsum2-c
C (Standard)
3×suma(1000000000) = 63244053298881

real	0m0.968s
user	0m0.956s
sys	0m0.006s
```

### **C** (with POSIX threads):

```
╰→ cc -O3 -pthread totalsum2-pth.c -o totalsum2-c-pth -lm -Wno-gnu-folding-constant
╰→ time ./totalsum2-c-pth
C (Pthreads):
3×suma(1000000000) = 63244053298881

real	0m0.351s
user	0m1.022s
sys	0m0.007s
```

### **C** (with OpenMP):

```
╰→ time ./totalsum2-c-omp
C (OpenMP):
3×suma(1000000000) = 63244053298881

real	0m0.349s
user	0m0.996s
sys	0m0.010s
```

## **Fortran** (LLVM v19):

```
╰→ time ./totalsum2-fortran
 Fortran:
3×suma(1000000000) = 63244053298881

real	0m0.952s
user	0m0.944s
sys	0m0.005s
```

## **Go** (plain):

```sh
╰→ time ./totalsum2-go
Go
3×suma(1000000000) = 63244053298881

real	0m1.888s
user	0m1.879s
sys	0m0.008s
```

### **Go** (with coroutines):

```sh
╰→ time ./totalsum2-go-coro
Go (Parallel Goroutines)
3×suma(1000000000) = 63244053298881

real	0m0.686s
user	0m2.017s
sys	0m0.012s
```

## (Free) **Pascal**:

```sh
╰→ time ./totalsum2-pas
Pascal:
3×suma(1000000000) = 63244053298881

real	0m2.250s
user	0m2.238s
sys	0m0.008s
```

### (Free) **Pascal** (with threads):

```sh
╰→ time ./totalsum2-pas-th
Pascal (Threads):
3×suma(1000000000) = 63244053298881

real	0m0.743s
user	0m2.035s
sys	0m0.011s
```

## **Rust**:

```sh
╰→ time ./totalsum2-rs
Rust:
3×suma(1000000000) = 63244053298881

real	0m1.973s
user	0m1.961s
sys	0m0.006s
```

### **Rust** (with threads):

```sh
╰→ time ./totalsum2-rs-th
Rust (with threads):
3×suma(1000000000) = 63244053298881

real	0m0.688s
user	0m2.023s
sys	0m0.009s
```

## **Zig**:

```sh
╰→ time ./totalsum2-zig
Zig:
3×suma(1000000000) = 63244053298881

real	0m2.830s
user	0m2.812s
sys	0m0.010s
```

### **Zig** (parallel threads):

```sh
╰→ time ./totalsum2-zig-th
Zig (Parallel Threads):
3×suma(1000000000) = 63244053298881

real	0m1.012s
user	0m2.994s
sys	0m0.010s
```

## **Python**:

```sh
╰→ time ./totalsum2.py
Python
3×suma(1000000000) = 63244053298881

real	6m10.351s
user	6m7.784s
sys	0m0.980s
```

### **Cython** (loads `totalsum2_cy.pyx` after setup):

```sh
╰→ time ./totalsum2_cy_main.py
Cython:
3×suma(1000000000) = 63244053298881

real	0m1.170s
user	0m1.120s
sys	0m0.037s
```

### **Python** (parallel):

```sh
╰→ time ./totalsum2-ppe.py
Python (Parallel):
3×suma(1000000000) = 63244053298881

real	2m7.343s
user	6m13.136s
sys	0m0.555s
```

## **Julia** (plain):

```sh
╰→ time ./totalsum2.jl
Julia:
3×suma(1000000000) = 63244053298881

real	0m3.146s
user	0m3.565s
sys	0m1.331s
```

## **Lua**:

```sh
╰→ time ./totalsum2.lua
Lua:
3×suma(1000000000) = 63244053298881

real	2m29.771s
user	2m29.139s
sys	0m0.284s
```

## **TCL**:

```sh
╰→ time ./totalsum2.tcl
Tcl:
3×suma(1000000000) = 63244053298881

real	9m23.897s
user	9m21.249s
sys	0m1.332s
```

## **DuckDB SQL**:

```sh
╰→ time duckdb -f totalsum2-duckdb.sql
┌─────────────────────────────────────┬─────────────────┐
│               output                │   validation    │
│               varchar               │     varchar     │
├─────────────────────────────────────┼─────────────────┤
│ 3×suma(1000000000) = 63244053298881 │ Status: Correct │
└─────────────────────────────────────┴─────────────────┘

real	0m6.536s
user	0m6.493s
sys	0m0.029s
```

## **SQLite3 SQL**:

```sh
╰→ time sqlite3 -table < totalsum2-sqlite.sql
+-------------------------------------+-----------------+
|               output                |   validation    |
+-------------------------------------+-----------------+
| 3×suma(1000000000) = 63244053298881 | Status: Correct |
+-------------------------------------+-----------------+

real	2m48.446s
user	2m47.568s
sys	0m0.384s
```

## **AWK**:

```sh
╰→ time ./totalsum2.awk
awk:
3×suma(1000000000) = 63244053298881

real	4m52.347s
user	4m50.648s
sys	0m0.653s
```

---

**_Ramón Barrios Láscar, 2026_**
