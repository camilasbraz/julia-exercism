# (NXX)-NXX-XXXX
# where N is any digit from 2 through 9 and X is any digit from 0 through 9.

function clean(phone_number)
    clean_str = replace(phone_number, r"\D" => "")
    # Check if the number is already in NANP format
    if occursin(r"^\+?1?\d{10}$", clean_str)
        if length(clean_str) == 10
            startswith(clean_str, "1") || startswith(clean_str, "0")
            throw(ArgumentError("Invalid Number."))
        end
        # Remove country code prefix
        if length(clean_str) == 11
            clean_str = clean_str[2:end]
        end

        return clean_str
    else
    end
end

clean("1223456789")
clean("12234567890")