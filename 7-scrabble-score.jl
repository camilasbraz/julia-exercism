# Letter                           Value
# A, E, I, O, U, L, N, R, S, T       1
# D, G                               2
# B, C, M, P                         3
# F, H, V, W, Y                      4
# K                                  5
# J, X                               8
# Q, Z                               10

letter_df = [("A", "E", "I", "O", "U", "L", "N", "R", "S", "T"), ("D", "G"), ("B", "C", "M", "P"), ("F", "H", "V", "W", "Y"), ("K"), ("J", "X"), ("Q", "Z")]
value_df = [1, 2, 3, 4, 5, 8, 10]

function score(str)
    score_value = 0
    str = uppercase(str)
    for letter in str
        println(letter)
        for (index, group) in enumerate(letter_df)
            println(group)
            println(index)
            if any(x -> letter in x, group)
                println("achou")
                score_value += value_df[index]
            end
        end
    end
    return score_value
end

score("abcdefghijklmnopqrstuvwxyz")