today(birds_per_day)::Int = birds_per_day[end]

function increment_todays_count(birds_per_day)::Vector{Int}
    birds_per_day[end] += 1
    return birds_per_day
end

function has_day_without_birds(birds_per_day)::Bool
    return !isempty(birds_per_day[iszero.(birds_per_day)])
end

function count_for_first_days(birds_per_day, num_days)::Int
    return sum(birds_per_day[1:num_days])
end

function busy_days(birds_per_day)::Int
    return birds_per_day[birds_per_day .>= 5] |> length
end

function average_per_day(week1, week2)::Vector{Float64}
    return [(week1[i] + week2[i]) / 2 for i in 1:7]
end
