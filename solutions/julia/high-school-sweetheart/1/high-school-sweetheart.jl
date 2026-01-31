cleanupname(name::String) = (strip ∘ (s -> replace(s, "-" => " ")))(name)

firstletter(name::String) = (string ∘ first ∘ cleanupname)(name)

initial(name::String) = ((s -> s * ".") ∘ uppercase ∘ firstletter)(name)

couple(name1::String, name2::String) = "❤ $(initial(name1))  +  $(initial(name2)) ❤"
