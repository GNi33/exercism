function transform(ch::Char)
    if isspace(ch) || isdigit(ch)
        return ""
    end

    if ch === '-'
        return "_"
    end

    if isuppercase(ch)
        return "-" * lowercase(string(ch))
    end

    if 'α' <= ch <= 'ω'  # Greek lowercase
        return "?"
    end

    return string(ch)
end

function clean(str)
    chars = collect(str)
    result = String[]

    for ch in chars
        transformed = transform(ch)
        push!(result, transformed)
    end

    return join(result, "")
end
