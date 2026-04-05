#!/usr/bin/awk -f

# Returns the sum of integer (truncated) square roots of numbers up to n
function suma(n,    i, t, s) {
    t = 0
    for (i = 1; i <= n; i++) {
        # int() in awk performs truncation toward zero
        s = int(sqrt(i))
        t += s
    }
    return t
}

BEGIN {
    block = 1000000000
    times = 3
    total = 0
    expected = 63244053298881

    print "awk:"

    for (j = 1; j <= times; j++) {
        total += suma(block)
    }

    # Using printf for clean formatting of the large total
    printf("%d×suma(%d) = %.0f\n", times, block, total)

    if (total != expected) {
        printf("ERROR: wrong result! (%.0f)\n", total) > "/dev/stderr"
    }
}
