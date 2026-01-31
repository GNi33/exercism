function rotate(n::Int, c::AbstractChar)::Char

    if !isletter(c)
        return c
    end

    base = islowercase(c) ? 'a' : 'A'

    return ((c - base + n) % 26) + base
end

rotate(n::Int, str::String)::String = string(map(c -> rotate(n, c), str))

for i in 0:26
    @eval macro $(Symbol(:R, i, :_str))(str::String)
        rotate($i, str)
    end
end
