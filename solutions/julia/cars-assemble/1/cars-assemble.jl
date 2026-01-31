function success_rate(speed)

    success = 0.0

    if 1 ≤ speed ≤ 4
        success = 100.0
    elseif 5 ≤ speed ≤ 8
        success = 90.0
    elseif speed == 9
        success = 80.0
    elseif speed == 10
        success = 77.0
    end
    
    success / 100
end

function production_rate_per_hour(speed)
    speed * 221 * (success_rate(speed))
end

function working_items_per_minute(speed)
    floor(Int, production_rate_per_hour(speed) / 60)
end
