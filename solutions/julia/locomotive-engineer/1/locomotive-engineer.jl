get_vector_of_wagons(args...) = [arg for arg in args]

function fix_vector_of_wagons(each_wagons_id, missing_wagons)
    first, second, one, rest... = each_wagons_id
    return vcat([one], missing_wagons, [rest...], [first, second])
end

function add_missing_stops(
    route,
    stops::Pair{String, String}...
)
    stops_list = [s for (_, s) in stops]
    return merge(route, Dict("stops" => stops_list))
end

function extend_route_information(route; more_route_information...)
    return merge(route, Dict{Symbol, Any}(more_route_information))
end
