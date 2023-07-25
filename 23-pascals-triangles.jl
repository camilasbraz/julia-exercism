function triangle(n)
    if n < 0
        throw(DomainError("Invalid Number."))
    end
    triangle = Vector{Vector{Int}}(undef, n)

    for i in 1:n
        triangle[i] = Vector{Int}(undef, i)
        for j in 1:i
            if j == 1 || j == i
                triangle[i][j] = 1
            else
                triangle[i][j] = triangle[i-1][j-1] + triangle[i-1][j]
            end
        end
    end

    return triangle
end
