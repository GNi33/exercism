function is_valid_command(msg::String)::Bool
    m = match(r"(^chatbot)"i, msg)
    return m !== nothing
end

function remove_emoji(msg::String)::String
    return replace(msg, r"emoji\d+" => "")
end

function check_phone_number(number::String)::String
    m = match(r"^\(\+\d{2}\) \d{3}-\d{3}-\d{3}$", number)
    if m !== nothing
        return "Thanks! You can now download me to your phone."
    else
        return "Oops, it seems like I can't reach out to $number"
    end

end

function getURL(msg::String)::Vector{String}
    urls = collect(m.match for m in eachmatch(r"\b\w+\.(com|so)\b", msg))
    return urls
end

function nice_to_meet_you(str::String)::String
    parts = match(r"^(\w+), (\w+)$", str).captures

    if length(parts) == 2
        return "Nice to meet you, $(parts[2]) $(parts[1])"
    end

    return "Invalid format"
end
