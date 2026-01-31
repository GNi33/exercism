const treasure_coords::Dict{String, String} = Dict(
    "Amethyst Octopus" => "1F",
    "Angry Monkey Figurine" => "5B",
    "Antique Glass Fishnet Float" => "3D",
    "Brass Spyglass" => "4B",
    "Carved Wooden Elephant" => "8C",
    "Crystal Crab" => "6A",
    "Glass Starfish" => "6D",
    "Model Ship in Large Bottle" => "8A",
    "Pirate Flag" => "7F",
    "Robot Parrot" => "1C",
    "Scrimshaw Whale's Tooth" => "2A",
    "Silver Seahorse" => "4E",
    "Vintage Pirate Hat" => "7E",
)

get_coordinate(treasure_name::String)::String = treasure_coords[treasure_name]
get_coordinate(line::Tuple{String, String})::String = get_coordinate(line[1])

convert_coordinate(coordinate::String)::Tuple{Char, Char} = Tuple(coordinate)

compare_records(
    azara_record::Tuple{String, String},
    rui_record::Tuple{String, Tuple{Char, Char}, String}
)::Bool = Tuple(azara_record[2]) == rui_record[2]

function create_record(
    azara_record::Tuple{String, String},
    rui_record::Tuple{String, Tuple{Char, Char}, String}
)::Tuple

    if(!compare_records(azara_record, rui_record))
        return ()
    end

    return (azara_record[2], rui_record[1], rui_record[3], azara_record[1])
end
