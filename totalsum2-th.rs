use std::io::Write;
use std::thread;

fn suma(n: i32) -> u64 {
    let mut t: u64 = 0;
    for i in 1..=n {
        let s = (i as f64).sqrt() as u64;
        t += s;
    }
    t
}

fn main() {
    let block: i32 = 1_000_000_000;
    let times = 3;
    let expected: u64 = 63_244_053_298_881;

    println!("Rust (with threads):");

    let mut handles = vec![];

    for _ in 0..times {
        let handle = thread::spawn(move || suma(block));
        handles.push(handle);
    }

    let total: u64 = handles.into_iter().map(|h| h.join().unwrap()).sum();

    println!("{}×suma({}) = {}", times, block, total);

    if total != expected {
        writeln!(std::io::stderr(), "ERROR: wrong result! ({})", total).ok();
    }
}
