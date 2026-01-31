function get_aliquot_divisors(n::Int)
    return filter(x -> is_aliquot_divisor(x, n), 1:(n ÷ 2))
end

function is_aliquot_divisor(d::Int, n::Int)
    if(d <= 0)
        throw(ArgumentError("Divisor must be positive"))
    end

    return n % d == 0 && d < n
end

function isperfect(n::Int)
    if(n <= 0)
        throw(DomainError(n, "Input must be a natural number"))
    end

    return sum(get_aliquot_divisors(n)) == n
end

function isabundant(n::Int)
    if(n <= 0)
        throw(DomainError(n, "Input must be a natural number"))
    end

    return sum(get_aliquot_divisors(n)) > n
end

function isdeficient(n::Int)
    if(n <= 0)
        throw(DomainError(n, "Input must be a natural number"))
    end

    return sum(get_aliquot_divisors(n)) < n
end
