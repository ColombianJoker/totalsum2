use std::io::Write;

/// Returns the sum of integer (truncated) square roots of numbers up to n.
fn suma(n: i32) -> u64 {
    let mut t: u64 = 0;

    for i in 1..=n {
        // f64::from converts the integer to a float for the sqrt operation
        // The 'as u64' suffix truncates the result toward zero
        let s = (i as f64).sqrt() as u64;
        t += s;
    }
    t
}

fn main() {
    let block: i32 = 1_000_000_000;
    let times: i32 = 3;
    let mut total: u64 = 0;
    let expected: u64 = 63_244_053_298_881;

    println!("Rust:");

    for _ in 1..=times {
        total += suma(block);
    }

    println!("{}×suma({}) = {}", times, block, total);

    if total != expected {
        // Writing specifically to stderr
        writeln!(std::io::stderr(), "ERROR: wrong result! ({})", total)
            .expect("Could not write to stderr");
    }
}
