const E::Matrix{Int64} = [
        0 0 1 1 0 0 0 0 0 0 0 0 0 0 1 1 0 0;
        0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0;
        0 1 0 0 0 1 0 0 0 0 0 0 1 0 0 0 1 0;
        0 1 0 0 1 0 1 0 0 0 0 1 0 1 0 0 1 0;
        0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0;
        1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1;
        0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0;
        0 1 0 0 0 0 0 1 0 0 1 0 0 0 0 0 1 0;
        0 1 0 0 0 0 0 0 1 1 0 0 0 0 0 0 1 0;
        0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0;
        0 0 1 1 0 0 0 0 0 0 0 0 0 0 1 1 0 0;
]

function frown!(E)

    r7 = copy(E[7, :])
    r9 = copy(E[9, :])

    E[7, :] = r9
    E[9, :] = r7

    return E
end

function frown(E)
    Etemp = copy(E)
    frown!(Etemp)
    return Etemp
end

function stickerwall(E)
    Efrown = frown(E)

    upper_half = hcat(E, Efrown)
    lower_half = hcat(Efrown, E)

    cols = size(upper_half, 2)

    return vcat(upper_half, ones(Int8, 1, cols), lower_half)
end

function colpixelcount(E)

    Etemp = copy(E)

    for col in eachcol(Etemp)
        s = sum(col)
        col[col .== 1] .= s
    end

    return Etemp
end

function render(E)
    return begin
        eachrow(E) .|>
        (row -> map(x -> x !== 0 ? "X" : " ", row)) |>
        (rows -> join.(rows, "")) |>
        (lines -> join(lines, "\n"))
    end
end
