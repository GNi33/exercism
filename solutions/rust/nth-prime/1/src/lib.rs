pub fn nth(n: usize) -> Result<u32, u32> {

    if n < 1 {
        return Err(0);
    }

    let prime_seq: Vec<u32> = primes_up_to(n);
    let result: u32 = prime_seq[n - 1];

    Ok(result)
}

/// Very straight forward "brute-force" prime sequence generator
pub fn primes_up_to(len: usize) -> Vec<u32> {
    let mut vec: Vec<u32> = Vec::new();

    if len < 1 {
        return vec;
    }

    vec.push(2);

    let mut i: u32 = 3;

    while vec.len() < len {
        if is_prim(i) {
            vec.push(i);
        }

        i += 1;
    }

    return vec;
}

fn is_prim(x: u32) -> bool {
    for i in 2..x {
        if x % i == 0 {
            return false;
        }
    }
    true
}