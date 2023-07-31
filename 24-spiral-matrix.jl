# generate a square matrix filled with natural numbers in a clockwise spiral pattern.
function spiral_matrix(n)
    if n < 0
        throw(ArgumentError("Matrix size should be at least 1."))
    end

    matrix = zeros(Int, n, n)
    #  right, down, left, and up (x,y)
    directions = [(0, 1), (1, 0), (0, -1), (-1, 0)]
    direction_idx = 1
    current = (1, 1)

    for num in 1:(n*n)
        matrix[current[1], current[2]] = num

        next_pos = (current[1] + directions[direction_idx][1], current[2] + directions[direction_idx][2])

        if (next_pos[1] < 1 || next_pos[1] > n || next_pos[2] < 1 || next_pos[2] > n || matrix[next_pos[1], next_pos[2]] != 0)
            # Change direction if the next position is out of bounds or already filled.
            direction_idx = rem(direction_idx, 4) + 1
            next_pos = (current[1] + directions[direction_idx][1], current[2] + directions[direction_idx][2])
        end

        current = next_pos
    end

    return matrix
end


spiral_matrix(2)
#[1 2; 4 3]