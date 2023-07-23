# http://mathandmultimedia.com/2010/09/15/sum-first-n-positive-integers/
"Square the sum of the first `n` positive integers"
function square_of_sum(n)
    return (n * (n + 1) ÷ 2)^2
end

"Sum the squares of the first `n` positive integers"
function sum_of_squares(n)
    return sum(i^2 for i in 1:n)
end

"Subtract the sum of squares from square of the sum of the first `n` positive integers"
function difference(n)
    if n == 0
        return 0
    end
    return square_of_sum(n) - sum_of_squares(n)
end
