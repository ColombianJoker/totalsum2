#!/usr/bin/emv julia -t auto
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
    for
