demote(n::Float64)::UInt8 = ceil(UInt8, n)
demote(n::Integer)::Int8 = Int8(n)

function demote(n)
    throw(MethodError(demote, (n,)))
end

preprocess(coll::Vector) = [demote(n) for n in coll] |> reverse
preprocess(coll::AbstractSet) = [demote(n) for n in coll] |> (s-> sort(s, rev=true))

function preprocess(coll)
    throw(MethodError(preprocess, (coll,)))
end
