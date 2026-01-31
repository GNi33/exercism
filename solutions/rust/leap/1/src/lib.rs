pub fn is_leap_year(year: i32) -> bool {
    if is_evenly_divisible_by(&year, 4) == false {
        return false;
    } else {
        if is_evenly_divisible_by(&year, 400) == false {
            if is_evenly_divisible_by(&year, 100) {
                return false;
            }
        }
    }

    return true;
}

fn is_evenly_divisible_by(num: &i32, divisor: i32) -> bool {
    num % divisor == 0
}