using Plots

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

function visualize_saddle_points(matrix, saddle_points)
    m, n = size(matrix)

    color_scale = cgrad(:magma, range(0, stop=1, length=256))
    color_scale = reverse(color_scale)
    heatmap(matrix, aspect_ratio=:equal, color=color_scale)

    for point in saddle_points
        x, y = point
        scatter!([y], [x], color=:red)
    end

    title!("Saddle Points")
    xticks!(1:n)
    yticks!(1:m)

    return
end

gr()  # Set the GR backend

matrix = [6 7 8; 5 5 5; 7 5 6]
saddle_points = saddlepoints(matrix)
visualize_saddle_points(matrix, saddle_points)

plot!()  # Display the plot