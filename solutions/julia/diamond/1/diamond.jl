function rows(letter::AbstractString)

    if length(letter) != 1 || !(letter[1] in 'A':'Z')
        throw(ArgumentError("Input must be a single uppercase letter A-Z"))
    end

    char = letter[1]
    numOfChars = Int(char) - Int('A') + 1

    if numOfChars == 1
        return ["A"]
    end

    diameter = 2 * numOfChars - 1
    result = Array{String}(undef, 0)

    for i in numOfChars:-1:1
        line = Vector{Char}(undef, diameter)

        fill!(line, ' ')

        charToPrint = Char(Int('A') + i - 1)

        line[numOfChars - (i - 1)] = charToPrint
        line[numOfChars + (i - 1)] = charToPrint

        if(i == numOfChars)
            push!(result, join(line))
        else
            pushfirst!(result, join(line))
            push!(result, join(line))
        end
    end

    return result
end
