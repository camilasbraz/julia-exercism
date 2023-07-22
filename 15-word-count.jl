function wordcount(sentence)
    # Step 1: Tokenize the sentence into individual words
    words = split(lowercase(sentence))  # Convert to lowercase for case-insensitivity

    # Check if there are no words in the sentence
    if isempty(words)
        return Dict{Any,Any}()
    end

    # Step 2: Create a dictionary to store word counts
    word_counts = Dict{String,Int}()

    # Step 3: Iterate through the words and update the counts in the dictionary
    for word in words
        if haskey(word_counts, word)
            word_counts[word] += 1
        else
            word_counts[word] = 1
        end
    end

    return word_counts
end


# Example usage:
sentence = " .\n,\t!^&*()~@#\$%{}[]:;'/<>"
word_counts = wordcount(sentence)
println(word_counts)
