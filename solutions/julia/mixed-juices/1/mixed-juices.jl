juice_times = Dict(
    "Pure Strawberry Joy" => 0.5,
    "Energizer" => 1.5,
    "Green Garden" => 1.5,
    "Tropical Island" => 3.0,
    "All or Nothing" => 5.0
)

function time_to_mix_juice(juice):Float8
    return get(juice_times, juice, 2.5)
end

function wedges_from_lime(size):Int
    if size == "small"
        return 6
    elseif size == "medium"
        return 8
    elseif size == "large"
        return 10
    else
        return 0
    end
end

function limes_to_cut(needed, limes)
   count = 0
   
   while needed > 0 && !isempty(limes)
        needed -= wedges_from_lime(popfirst!(limes))
        count += 1
   end

   return count
end

function order_times(orders)
    return [time_to_mix_juice(order) for order in orders]
end

function remaining_orders(time_left, orders)
    while time_left > 0 && !isempty(orders)
        time_left -= time_to_mix_juice(first(orders))
        popfirst!(orders)
    end

    return orders
end
