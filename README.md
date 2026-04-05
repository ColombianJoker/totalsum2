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

## **Python**:

```sh
╰→ time ./totalsum2.py
Python
3×suma(1000000000) = 63244053298881

real	6m10.351s
user	6m7.784s
sys	0m0.980s
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

## **Go** (plain):

```sh
╰→ time ./totalsum2-go
Go
3×suma(1000000000) = 63244053298881

real	0m1.888s
user	0m1.879s
sys	0m0.008s
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

## **Rust**:

```sh
╰→ time ./totalsum2-rs
Rust:
3×suma(1000000000) = 63244053298881

real	0m1.973s
user	0m1.961s
sys	0m0.006s
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
╰→ time sqlite3 < totalsum2-sqlite.sql
3×suma(1000000000) = 63244053298881|Status: Correct

real	2m48.724s
user	2m47.906s
sys	0m0.354s
```

---

**_Ramón Barrios Láscar, 2026_**
