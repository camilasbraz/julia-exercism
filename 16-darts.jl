function score(x, y)
    # Calculate the distance from the origin (0, 0) using the distance formula
    distance = sqrt(x^2 + y^2)

    # Determine the earned points based on the distance
    if distance > 10
        return 0  # Outside the target
    elseif distance <= 10 && distance > 5
        return 1  # Outer circle
    elseif distance <= 5 && distance > 1
        return 5  # Middle circle
    else
        return 10  # Inner circle
    end
end
