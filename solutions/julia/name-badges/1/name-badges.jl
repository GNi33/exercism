print_name_badge(id::Missing, name::String, department::String)::String = "$name - $department"
print_name_badge(id::Missing, name::String, department::Nothing)::String = "$name - OWNER"
print_name_badge(id::Int, name::String, department::Nothing)::String = "[$id] - $name - OWNER"
print_name_badge(id::Int, name::String, department::String)::String = "[$id] - $name - $(uppercase(department))"

function salaries_no_id(ids, salaries)
    total = 0
    for (id, salary) in zip(ids, salaries)
        if ismissing(id)
            total += salary
        end
    end

    return total
end
