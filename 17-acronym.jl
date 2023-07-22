function acronym(phrase)
    words = split(phrase, ['-', ' ', '_'])
    acronym = join(uppercase.(first.(filter(x -> !isempty(x), words))))
    return acronym
end


print(acronym("Something - I made up from thin air"))