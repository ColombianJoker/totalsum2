const std = @import("std");

/// Returns the sum of integer (truncated) square roots of numbers up to n.
fn suma(n: i32) u64 {
    var t: u64 = 0;
    var i: i32 = 1;

    while (i <= n) : (i += 1) {
        // @floatFromInt converts i32 to f64
        // @intFromFloat truncates the f64 back to u64
        const s: u64 = @intFromFloat(@sqrt(@as(f64, @floatFromInt(i))));
        t += s;
    }
    return t;
}

pub fn main() !void {
    const block: i32 = 1_000_000_000;
    const times: i32 = 3;
    var total: u64 = 0;
    const expected: u64 = 63_244_053_298_881;

    // std.debug.print works across versions and writes to stderr
    std.debug.print("Zig:\n", .{});

    var j: i32 = 0;
    while (j < times) : (j += 1) {
        total += suma(block);
    }

    std.debug.print("{d}×suma({d}) = {d}\n", .{ times, block, total });

    if (total != expected) {
        std.debug.print("ERROR: wrong result! ({d})\n", .{total});
    }
}
