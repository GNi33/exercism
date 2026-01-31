function count_nucleotides(strand::String)::Dict{Char, Int}
    valid_nucleotides = Set(['A', 'C', 'G', 'T'])
    counts = Dict('A' => 0, 'C' => 0, 'G' => 0, 'T' => 0)

    single_nucleotides = collect(strand)

    if single_nucleotides ⊈ valid_nucleotides
        throw(DomainError("Invalid nucleotide found in strand"))
    end

    for nucleotide in strand
        counts[nucleotide] += 1
    end

    return counts
end
