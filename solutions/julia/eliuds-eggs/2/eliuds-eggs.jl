# Simple and naive solution to first build the binary representation of a number
# and then count the number of 1s in that representation
function eggcount_step_by_step(number::Integer)
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

# More efficient solution using bitwise operations
function eggcount_binary_op(number::Integer)

    if number < 0
        throw(DomainError("Input must be a positive integer"))
    end

    if number == 0
        return 0
    end

    bitNum = number
    ct = 0

    while bitNum > 0
        # Compare the least significant bit with 1 -> 110011 & 000001 = 000001
        ct += bitNum & 1

        # Right shift the bits by 1 -> 110011 >> 1 = 011001
        bitNum >>= 1
    end

    ct
end

eggcount(number::Integer) = eggcount_binary_op(number)
