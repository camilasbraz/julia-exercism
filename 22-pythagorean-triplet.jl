# Define the pythagorean_triplets(N) function
# Triplets whose sum is N

function pythagorean_triplets(N)
    triplets = []
    for a in 1:N
        for b in a:N
            c = N - a - b
            if c >= b && a^2 + b^2 == c^2
                push!(triplets, (a, b, c))
            end
        end
    end
    return triplets
end

N = 12
triplets = pythagorean_triplets(N)