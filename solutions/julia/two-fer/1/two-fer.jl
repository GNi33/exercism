function twofer(name=""::String)
    name = name == "" ? "you" : name

    return "One for $(name), one for me."
end
