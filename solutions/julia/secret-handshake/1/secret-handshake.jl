const gestures = ["wink", "double blink", "close your eyes", "jump"]

function secret_handshake(code::Integer)::Vector{String}

    handshake = String[]
    idx = 1

    while code > 0

        if code & 1 == 1

            if (idx < length(gestures) + 1)
                push!(handshake, gestures[idx])
            else
                handshake = reverse(handshake)
            end
        end 

        code >>= 1
        idx += 1
    end

    return handshake
end
