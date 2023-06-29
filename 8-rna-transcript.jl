function to_rna(dna)
    reverse = ""
    for character in dna
        if (character != 'A' && character != 'C' && character != 'G' && character != 'T')
            throw(ErrorException("Invalid DNA input"))
        elseif character == 'A'
            reverse = reverse * 'U'
        elseif character == 'C'
            reverse = reverse * 'G'
        elseif character == 'G'
            reverse = reverse * 'C'
        elseif character == 'T'
            reverse = reverse * 'A'
        end
    end
    return reverse
end

to_rna("ACGTGGTCTTAA") == "UGCACCAGAAUU"