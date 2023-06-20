
# https://en.wikipedia.org/wiki/Methods_of_computing_square_roots
# Babylonian method
function square_root(n)
    if n <= 0
        throw(DomainError("Square root not defined for non-positive numbers."))
    else 
        attempt = n/2
        while true
            attempt_aux = (attempt + n/attempt)/2
            if abs(attempt_aux - attempt) < 0.000001
                return(round(attempt))
            end
            attempt = attempt_aux
        end
    end
end

s = rand(1:isqrt(typemax(Int64)))
square_root(s^2)
