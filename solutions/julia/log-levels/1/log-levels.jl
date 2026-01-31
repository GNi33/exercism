function message(msg)
    return last(split(msg, "]: ")) |> strip
end

function log_level(msg)
    return lowercase(replace(first(split(msg, ":")), "[" => "", "]" => ""))
end

function reformat(msg)
    return "$(message(msg)) ($(log_level(msg)))"
end
