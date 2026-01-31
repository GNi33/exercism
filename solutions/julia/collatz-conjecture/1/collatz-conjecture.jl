function collatz_steps(num::Integer)
    if num < 1
        throw(DomainError("Input must be a positive integer"))
    end

    steps = 0
    while num != 1
        if iseven(num)
            num = div(num, 2)
        else
            num = 3 * num + 1
        end
        steps += 1
    end

    steps
end
