"""
    ispangram(input)

Return `true` if `input` contains every alphabetic character (case insensitive).

"""
function ispangram(input)
    alphabet = collect('a':'z')
    lc_input = lowercase(input)

    for letter in alphabet
        if !(letter in lc_input)
            # if letter ∉ lc_input
            return false
        end
    end

    return true
end

ispangram("the quick brown fox jumps over the lazy dog")
ispangram("a quick movement of the enemy will jeopardize five gunboats")
