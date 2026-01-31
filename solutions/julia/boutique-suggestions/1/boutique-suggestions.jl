function clothingitem(categories, qualities)::Dict
    return [categories[i] => qualities[i] for i in eachindex(categories)] |> Dict
end

function get_combinations(tops, bottoms)::Matrix{Tuple}
    return [(top, bottom) for top in tops, bottom in bottoms]
end

function get_prices(combos)::Union{Vector{Int}, Matrix{Int}}
    return [combo[1]["price"] + combo[2]["price"] for combo in combos]
end

function filter_clashing(combos)::Vector{Tuple}
    return [combo for combo in combos if combo[1]["base_color"] != combo[2]["base_color"]]
end
