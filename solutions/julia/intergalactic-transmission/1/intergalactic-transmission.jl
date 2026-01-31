get_transmit_sequence(message::Vector{Any}) = []

function get_transmit_sequence(message::Vector{UInt8})::Vector{UInt8}

    if(length(message) == 0)
        return UInt8[]
    end
    
    message_with_parity = add_parity_bit(message)

    for i in 1:length(message_with_parity)
        byte = message_with_parity[i]

        if(ham_weight(byte) % 2 != 0)
            message_with_parity[i] |= (0x01 << 0)  # Set parity bit to 1
        end
    end

    return message_with_parity
end

decode_sequence(received_seq::Vector{Any}) = []

function decode_sequence(received_seq::Vector{UInt8})::Vector{UInt8}

    if(length(received_seq) == 0)
        return UInt8[]
    end

    # Flatten received bytes into bit array
    bits = Bool[]
    for byte in received_seq
        for i in 7:-1:0  # MSB to LSB
            push!(bits, (byte >> i) & 0x01 == 1)
        end
    end

    # Check parity bits
    for i in 1:8:length(bits)
        byte_bits = bits[i:i+7]
        data_bits = byte_bits[1:7]
        parity_bit = byte_bits[8]

        if sum(data_bits) % 2 == 0 && parity_bit != false
            throw(ErrorException("Parity check failed for byte starting at bit index $i"))
        elseif sum(data_bits) % 2 == 1 && parity_bit != true
            throw(ErrorException("Parity check failed for byte starting at bit index $i"))
        end
    end

    # Remove parity bits
    data_bits = Bool[]
    for i in 1:length(bits)
        if i % 8 != 0
            push!(data_bits, bits[i])
        end
    end

    # Pad to complete the last byte if needed
    while length(data_bits) % 8 != 0
        push!(data_bits, false)
    end

    # Reconstruct bytes from data bits
    result = UInt8[]
    for i in 1:8:length(data_bits)
        byte = 0x00
        for j in 0:7
            if data_bits[i + j]
                byte |= (0x01 << (7 - j))
            end
        end
        push!(result, byte)
    end

    # Remove the extra byte if it was added due to padding
    if length(result) > 0 && result[end] == 0x00
        pop!(result)
    end

    return result

end

function ham_weight(byte::UInt8)
    count = 0
    for i in 0:7
        count += (byte >> i) & 0x01
    end
    return count
end

function add_parity_bit(bytes::Vector{UInt8})
    # Step 1: Flatten bytes into bit array
    bits = Bool[]
    for byte in bytes
        for i in 7:-1:0  # MSB to LSB
            push!(bits, (byte >> i) & 0x01 == 1)
        end
    end

    # Step 2: Insert a 0 bit after every 7 bits
    new_bits = Bool[]
    for i in 1:length(bits)
        push!(new_bits, bits[i])
        if i % 7 == 0
            push!(new_bits, false)  # Insert 0 bit
        end
    end

    # Step 3: Pad to complete the last byte if needed
    while length(new_bits) % 8 != 0
        push!(new_bits, false)
    end

    result = UInt8[]
    for i in 1:8:length(new_bits)
        byte = 0x00
        for j in 0:7
            if new_bits[i + j]
                byte |= (0x01 << (7 - j))
            end
        end
        push!(result, byte)
    end
    
    return result
end

# Method used for debugging
function split_byte_at_7bits(byte::UInt8)

    println("Input:  ", bitstring(byte))
    println(bitstring(byte))

    first_7bits = byte & 0xFE  # Extract bits 0-7
    lsb = byte & 0x01  # Extract bit 7 and shift it down

    println(bitstring(first_7bits))
    println(bitstring(lsb))

    println("------")
    return (first_7bits, lsb)
end
