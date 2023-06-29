"""
    count_nucleotides(strand)

The count of each nucleotide within `strand` as a dictionary.

Invalid strands raise a `DomainError`.

"""
function count_nucleotides(strand)

    for character in strand
        if (character != 'A' && character != 'C' && character != 'G' && character != 'T')
            throw(DomainError("String with characters other than ACGT."))
        end
    end

    str = Dict('A' => count(==('A'), strand), 
    'C' => count(==('C'), strand),
    'G' => count(==('G'), strand),
    'T' => count(==('T'), strand) )
    # str = string("'A':", count(==('A'), strand), ",",
    # "'C':", count(==('C'), strand), ",",
    # "'G':", count(==('G'), strand), ",",
    # "'T':", count(==('T'), strand), ",")

    return str
end
count_nucleotides("ACCCACT")

