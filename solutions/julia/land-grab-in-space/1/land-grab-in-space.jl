struct Coord
    x::UInt16
    y::UInt16
end

@kwdef struct Plot
    bottom_left::Coord
    top_right::Coord
end

is_claim_staked(claim::Plot, register::Set{Plot})::Bool = claim ∈ register

function stake_claim!(claim::Plot, register::Set{Plot})::Bool
    if is_claim_staked(claim, register)
        return false
    end

    push!(register, claim)
    return true
end

function get_longest_side(claim::Plot)
    width = claim.top_right.x - claim.bottom_left.x
    height = claim.top_right.y - claim.bottom_left.y

    return max(width, height)
end

function get_claim_with_longest_side(register::Set{Plot})::Set{Plot}
    longest_side_claim = Set()
    longest_side_length = 0

    for claim in register
        side_length = get_longest_side(claim)
        if side_length > longest_side_length
            empty!(longest_side_claim)

            longest_side_length = side_length
            push!(longest_side_claim, claim)
        elseif side_length == longest_side_length
            push!(longest_side_claim, claim)
        end
    end

    return longest_side_claim
end
