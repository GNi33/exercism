function rotate(n::Int, str::String)::String
    lc_alphabet = 'a':'z'
    uc_alphabet = 'A':'Z'

    rotated = map(
        c ->
            if c in lc_alphabet
                lc_alphabet[(Int(c) + n - 97) % 26 + 1]
            elseif c in uc_alphabet
                uc_alphabet[(Int(c) + n - 65) % 26 + 1]
            else
                c
            end,
        str)

    return String(rotated)
end

function rotate(n::Int, c::Char)::Char
    return rotate(n, string(c))[1]
end

