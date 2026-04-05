#!/usr/bin/tclsh

# Returns the sum of integer (truncated) square roots of numbers up-to n
proc suma {n} {
    set t 0
    # The loop runs from 1 to n
    for {set i 1} {$i <= $n} {incr i} {
        # sqrt returns a double; int() truncates/floors the value
        set s [expr {int(sqrt($i))}]
        set t [expr {$t + $s}]
    }
    return $t
}

# Main
set block 1000000000
set times 3
set total 0
set expected 63244053298881

puts "Tcl:"

for {set i 1} {$i <= $times} {incr i} {
    set total [expr {$total + [suma $block]}]
}

puts "$times×suma($block) = $total"

if {$total != $expected} {
    # Writing to stderr in Tcl
    puts stderr "ERROR: wrong result! ($total)"
}
