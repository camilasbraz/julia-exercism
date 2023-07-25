function collatz_steps(number, steps=0)
    if number <= 0
        throw(DomainError("Invalid Number."))
    end
    if number == 1
        return steps
    else
        if number % 2 == 0
            number = number / 2
            steps += 1
            collatz_steps(number, steps)
        else
            number = number * 3 + 1
            steps += 1
            collatz_steps(number, steps)
        end
    end
end
collatz_steps(12)