get_coordinate(line::Tuple{String, String})::String = line[2]

convert_coordinate(coordinate::String)::Tuple{Char, Char} = Tuple(coordinate)

compare_records(
    azara_record::Tuple{String, String},
    rui_record::Tuple{String, Tuple{Char, Char}, String}
)::Bool = convert_coordinate(azara_record[2]) == rui_record[2]

function create_record(
    azara_record::Tuple{String, String},
    rui_record::Tuple{String, Tuple{Char, Char}, String}
)::Tuple

    if(!compare_records(azara_record, rui_record))
        return ()
    end

    return (azara_record[2], rui_record[1], rui_record[3], azara_record[1])
end
