function create_inventory(items::Vector{String})
    inventory = Dict{String, Int}()
    for item in items
        inventory[item] = get(inventory, item, 0) + 1
    end
    return inventory
end

function add_items(inventory, items)
    for item in items
        inventory[item] = get(inventory, item, 0) + 1
    end
    return inventory
end

function decrement_items(inventory, items)

    for item in items
        if(!haskey(inventory, item) || inventory[item] == 0)
            continue
        end

        inventory[item] = get(inventory, item, 0) - 1
    end
    return inventory
end

function remove_item(inventory, item)
    delete!(inventory, item)
    return inventory
end

# 'by' argument not really needed, but I included it for clarity
list_inventory(inventory) = sort(
    collect(filter(x -> x[2] > 0, inventory)),
    by = x -> x[1]
)
