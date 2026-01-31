function rationalize(successes, trials)
    if length(successes) != length(trials)
        throw(ArgumentError("successes and trials must have the same length"))
    end

    return [successes[i] // trials[i] for i in eachindex(successes)]
end

function probabilities(successes, trials)
    if length(successes) != length(trials)
        throw(ArgumentError("successes and trials must have the same length"))
    end

    return [successes[i] / trials[i] for i in eachindex(successes)]
end

function checkmean(successes, trials)

    ns = length(successes)
    nt = length(trials)

    if ns != nt
        throw(ArgumentError("successes and trials must have the same length"))
    end

    real_probabilities = probabilities(successes, trials)
    mean_real_probability = sum(real_probabilities) / ns

    rational_probabilities = rationalize(successes, trials)
    mean_rational_probability = sum(rational_probabilities) // ns

    if mean_real_probability == float(mean_rational_probability)
        return true
    end

    return mean_rational_probability
end

function checkprob(successes, trials)
    if length(successes) != length(trials)
        throw(ArgumentError("successes and trials must have the same length"))
    end

    real_probabilities = probabilities(successes, trials)
    rational_probabilities = rationalize(successes, trials)

    prod_real = prod(real_probabilities)
    prod_rational = prod(rational_probabilities)

    if prod_real == float(prod_rational)
        return true
    end

    return prod_rational
end
