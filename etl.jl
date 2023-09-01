using Base.Iterators: product

# Define the old mapping of letters and scores
mapping = Dict(
    1 => ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"],
    2 => ["D", "G"],
    3 => ["B", "C", "M", "P"],
    4 => ["F", "H", "V", "W", "Y"],
    5 => ["K"],
    8 => ["J", "X"],
    10 => ["Q", "Z"]
)

function transform(input::AbstractDict)
    mapping = Dict{Char,Int}()

    # Iterate through the old mapping and create the new one-to-one mapping
    for (score, letters) in input
        for letter in letters
            # Convert the letter to lowercase and store it in the new mapping
            mapping[lowercase(letter[1])] = score
        end
    end

    return mapping
end

input = Dict(1 => ['A', 'E'], 2 => ['D', 'G'])
output_real = transform(input)
output_esperado = Dict('g' => 2, 'e' => 1, 'a' => 1, 'd' => 2)

output_esperado == output_real