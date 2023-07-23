"""Calculate the number of grains on square `square`."""
function on_square(square)
    if square <= 0 || square > 64
        throw(DomainError("Values should be in the 1 - 64 range"))
    end
    return big(2)^(square - 1)

end

"""Calculate the total number of grains after square `square`."""
function total_after(square)
    if square <= 0 || square > 64
        throw(DomainError("Values should be in the 1 - 64 range"))
    end
    total = 0
    grains_on_square = 1

    for _ in 1:square
        total += grains_on_square
        grains_on_square *= 2
    end

    return total
end

total_after(64)
total_after(3)
on_square(1) + on_square(2) + on_square(3)
