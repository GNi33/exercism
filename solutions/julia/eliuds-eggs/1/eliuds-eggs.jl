function eggcount(number::Integer)
    if number < 0
        throw(DomainError("Input must be a positive integer"))
    end

    if number == 0
        return 0
    end

    numOfBits = floor(Int64, log2(number)) + 1

    bits = Vector{UInt8}(undef, numOfBits)

    step = 1
    while number > 0
        rem = number % 2
        bits[step] = UInt8(rem)

        number = floor(Int64, number / 2)
        step += 1
    end

    return length(filter(x -> x == 1, bits))
end
