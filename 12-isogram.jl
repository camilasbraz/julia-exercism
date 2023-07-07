function isisogram(s)
    # Remove non-letter characters
    cleaned_s = filter(isletter, lowercase(s))
    # store the count of each character encountered in the word
    n_char = Dict{Char,Int}()
    for char in lowercase(cleaned_s)
        # checks if the character already exists as a key in the n_char
        if haskey(n_char, char)
            return false
        end
        n_char[char] = 1
    end
    return true
end

isisogram("eleven")
isisogram("subdermatoglyphic")

isisogram("Emily Jung Schwartzkopf")

isisogram("Hjelmqvist-Gryb-Zock-Pfund-Wax")