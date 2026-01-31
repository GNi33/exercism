function score(x, y)
    distance = calc_distance_from_center(x, y)

    if distance <= 1
        return 10
    elseif distance <= 5
        return 5
    elseif distance <= 10
        return 1
    end

    return 0
end

calc_distance_from_center(x, y) = sqrt(x^2 + y^2)