function bob(stimulus::String)::String

    stripped_stimulus = strip(stimulus)

    if isempty(stripped_stimulus)
        return "Fine. Be that way!"
    end

    if isyelling(stripped_stimulus)
        if isquestion(stripped_stimulus)
            return "Calm down, I know what I'm doing!"
        else
            return "Whoa, chill out!"
        end
    end

    if isquestion(stripped_stimulus)
        return "Sure."
    end

    return "Whatever."
end

isquestion(stimulus::AbstractString)::Bool = endswith(stimulus, '?')

function isyelling(stimulus::AbstractString)::Bool 
    uppercase(stimulus) == stimulus && any(isletter, stimulus)
end
