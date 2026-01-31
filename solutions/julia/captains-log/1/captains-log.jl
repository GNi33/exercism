using Random

random_planet() = rand(['D', 'H', 'J', 'K', 'L', 'M', 'N', 'R', 'T', 'Y'])

random_ship_registry_number() = "NCC-" * string(rand(1000:9999))

random_stardate() = rand() * 1000 + 41000

random_stardate_v2() = rand(41000.0:0.1:42000.0)

function pick_starships(starships::Vector{String}, number_needed::Int)
    randperm = Random.randperm(length(starships))
    return starships[randperm[1:number_needed]]
end
