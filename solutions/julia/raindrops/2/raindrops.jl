function raindrops(number::Int)::String
    result = ""

    number % 3 == 0 && (result *= "Pling")

    number % 5 == 0 && (result *= "Plang")

    number % 7 == 0 && (result *= "Plong")

    result == "" ? string(number) : result
end
