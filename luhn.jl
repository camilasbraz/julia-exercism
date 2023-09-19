function luhn(number_str)
    number_str = replace(number_str, r"\s+" => "")
    if !all(isdigit, number_str) || length(number_str) <= 1
        return false
    end

    digits = parse.(Int, split(number_str, ""))

    for i in 2:2:length(digits)
        digits[end - i + 1] *= 2

        if digits[end - i + 1] > 9
            digits[end - i + 1] -= 9
        end
    end

    checksum = sum(digits)

    return checksum % 10 == 0
end

valid_number = "4539 3195 0343 6467"
invalid_number = "8273 1232 7352 0569"

println(luhn(valid_number))   
println(luhn(invalid_number)) 
