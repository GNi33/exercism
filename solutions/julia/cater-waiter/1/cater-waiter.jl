clean_ingredients(dish_name, dish_ingredients) = (dish_name, Set(dish_ingredients))

function check_drinks(drink_name, drink_ingredients)::String
    if isdisjoint(drink_ingredients, ALCOHOLS)
        drink_name *= " Mocktail"
    else 
        drink_name *= " Cocktail"
    end

    return drink_name
end

function categorize_dish(dish_name, dish_ingredients)::String
    if(dish_ingredients ⊆ VEGAN)
        return dish_name * ": VEGAN"
    end

    if(dish_ingredients ⊆ VEGETARIAN)
        return dish_name * ": VEGETARIAN"
    end

    if(dish_ingredients ⊆ PALEO)
        return dish_name * ": PALEO"
    end

    if(dish_ingredients ⊆ KETO)
        return dish_name * ": KETO"
    end

    if (dish_ingredients ⊆ OMNIVORE)
        return dish_name * ": OMNIVORE"
    end

    return dish_name
end

function tag_special_ingredients(dish)
    special_ingredients = Set(dish[2] ∩ SPECIAL_INGREDIENTS)

    return (dish[1], special_ingredients)
end

function compile_ingredients(dishes)
    all_ingredients = Set{String}()

    for dish in dishes
        all_ingredients = all_ingredients ∪ dish
    end

    return all_ingredients
end

separate_appetizers(dishes, appetizers) = setdiff(dishes, appetizers)

function singleton_ingredients(dishes, intersection)
    singletons = Set{String}()

    for dish in dishes
        singletons = singletons ∪ setdiff(dish, intersection)
    end

    return singletons
end
