function all_15(ratings)::Bool
    return filter(r -> r ∉ (1, 5), ratings) |> isempty
end

function emphatics(customers)::Dict{String, Vector{Int}}
    return filter(c -> all_15(c[2]), customers) |> Dict
end

function tobinary(ratings)::Vector{Int}
    return map(r -> r == 5 ? 1 : 0, ratings)
end

function tobinarymatrix(ratings)
    bin_ratings = map(r -> tobinary(r)', ratings)

    return reduce(vcat, bin_ratings)
end
