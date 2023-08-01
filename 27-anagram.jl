function detect_anagrams(original_word, candidates)
    anagrams = Vector{AbstractString}()

    function is_anagram(candidate::AbstractString)::Bool
        original_word_lower = lowercase(original_word)
        candidate_lower = lowercase(candidate)

        # Convert strings to arrays of characters and sort the characters
        original_word_chars = sort(collect(original_word_lower))
        candidate_chars = sort(collect(candidate_lower))

        return original_word_chars == candidate_chars && original_word_lower != candidate_lower
    end

    for candidate in candidates
        if is_anagram(candidate)
            push!(anagrams, candidate)
        end
    end

    return anagrams
end


