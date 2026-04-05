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

````sh
╰→ time ./totalsum2-go
Go
3×suma(1000000000) = 63244053298881

real	0m1.888s
user	0m1.879s
sys	0m0.008s
```

---

_Ramón Barrios Láscar_, 2026
````
