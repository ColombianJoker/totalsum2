const std = @import("std");

/// Returns the sum of integer (truncated) square roots of numbers up to n. [cite: 2]
fn suma(n: i32) u64 {
    var t: u64 = 0;
    var i: i32 = 1;
    while (i <= n) : (i += 1) { // [cite: 3]
        const s: u64 = @intFromFloat(@sqrt(@as(f64, @floatFromInt(i))));
        t += s; // [cite: 4]
    }
    return t;
}

/// Thread wrapper to store the result in a specific memory location.
fn suma_thread(n: i32, result: *u64) void {
    result.* = suma(n);
}

pub fn main() !void {
    const block: i32 = 1_000_000_000;
    const times: usize = 3; // [cite: 5]
    const expected: u64 = 63_244_053_298_881; // [cite: 5]

    std.debug.print("Zig (Parallel Threads):\n", .{}); // [cite: 6]

    var threads: [times]std.Thread = undefined;
    var results: [times]u64 = undefined;

    // Spawn threads to execute suma concurrently
    for (0..times) |i| {
        threads[i] = try std.Thread.spawn(.{}, suma_thread, .{ block, &results[i] });
    }

    // Join threads and aggregate the final total
    var total: u64 = 0;
    for (0..times) |i| {
        threads[i].join();
        total += results[i];
    }

    std.debug.print("{d}×suma({d}) = {d}\n", .{ times, block, total }); // [cite: 8]

    if (total != expected) { // [cite: 9]
        std.debug.print("ERROR: wrong result! ({d})\n", .{total});
    }
}
