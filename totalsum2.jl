#!/usr/bin/env julia -t auto
#

function suma(n::UInt64)::UInt64
    """
    Returns the sum of integer (truncated) square roots of numbers up-to n

    Args:
        n: an integer number
    """
    t = 0
    for i in 1:n
        t += floor(sqrt(i))
    end # for i
    return t
end # fn suma()

function main(times, block)
    for i in 1:times
        s_arr[i] = suma(block)
    end # for i
    return s_arr
end # fn main()

println("Julia:")
times = UInt64(3)
block = UInt64(1000000000)

s_arr = zeros(UInt64, times)
main(times, block)
println("$(times)×suma($(block)) = $(sum(s_arr))")
