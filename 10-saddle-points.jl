# The best tree will be the tallest tree compared to all the other trees to the east and west, so that you have the best possible view of the sunrises and sunsets.
# You don't like climbing too much, so the perfect tree will also be the shortest among all the trees to the north and to the south.

# Max on row
# Min on column

function saddlepoints(M)
    if isempty(M)
        return []
    end
    # empty array of tuples
    saddle_points = Tuple{Int,Int}[]
    m, n = size(M)

    for i in 1:m
        row_max = maximum(M[i, :])
        for j in 1:n
            element = M[i, j]
            col_min = minimum(M[:, j])
            if element == row_max && element == col_min
                push!(saddle_points, (i, j))
            end
        end
    end
    return saddle_points
end



M = [9 8 7; 5 3 2; 6 6 7]
saddlepoints(M) == [(2, 1)]

M = []
saddlepoints(M) == []

M = [1 2 3; 3 1 2; 2 3 1]
saddlepoints(M) == []

M = [4 5 4; 3 5 5; 1 5 4]
saddlepoints(M) == [(1, 2), (2, 2), (3, 2)]

M = [6 7 8; 5 5 5; 7 5 6]
saddlepoints(M) == [(2, 1), (2, 2), (2, 3)]

M = [8 7 9; 6 7 6; 3 2 5]
saddlepoints(M) == [(3, 3)]

M = [3 1 3; 3 2 4]
saddlepoints(M) == [(1, 1), (1, 3)]

M = reshape([2, 1, 4, 1], :, 1)
saddlepoints(M) == [(2, 1), (4, 1)]

M = [2 5 3 5]
saddlepoints(M) == [(1, 2), (1, 4)]
