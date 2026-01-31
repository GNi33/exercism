function clothingitem(categories, qualities)::Dict
    return [categories[i] => qualities[i] for i in eachindex(categories)] |> Dict
end

function get_combinations(tops, bottoms)::Matrix{Tuple}
    return [(top, bottom) for top in tops, bottom in bottoms]
end

function get_prices(combos)::Union{Vector{Int}, Matrix{Int}}
    return [top["price"] + bottom["price"] for (top,bottom) in combos]
end

function filter_clashing(combos)::Vector{Tuple}
    return [(top, bottom) for (top, bottom) in combos if top["base_color"] != bottom["base_color"]]
end
