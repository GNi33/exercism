pub fn raindrops(n: usize) -> String {
    let factors = factor(n);
    let mut solve_str: String = String::new();

    if factors.iter().any(|&x| x.eq(&3)) {
        solve_str.push_str("Pling");
    }

    if factors.iter().any(|&x| x.eq(&5)) {
        solve_str.push_str("Plang");
    }

    if factors.iter().any(|&x| x.eq(&7)) {
        solve_str.push_str("Plong");
    }

    if !solve_str.is_empty() {
        return solve_str;
    }

    let temp: i32 = n as i32;
    return temp.to_string();
}

fn factor(num: usize) -> Vec<usize> {
    let mut factors: Vec<usize> = Vec::new();

    for i in 1..((num as f32).sqrt() as usize + 1) {
        if num % i == 0 && i <= 7 {
            factors.push(i);

            if num / i <= 7 {
                factors.push(num / i);
            }
        }
    }

    factors.dedup();
    factors.sort();

    factors
}