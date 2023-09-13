function distance(a, b)
    if length(a) != length(b)
        throw(ArgumentError("Inputs must have the same length"))
    end
    distance = 0
    for (char1, char2) in zip(a, b)
        if char1 != char2
            distance += 1
        end
    end
    return distance
    enddistance
end

distance("AT", "CT") == 1

strand1 = "GAGCCTACTAACGGGAT"
strand2 = "CATCGTAATGACGGCCT"
result = distance(strand1, strand2)
println("Hamming Distance: ", result)
