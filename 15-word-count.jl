# function wordcount(sentence)
#     # Step 1: Tokenize the sentence into individual words
#     words = split(lowercase(sentence))  # Convert to lowercase for case-insensitivity

#     # Check if there are no words in the sentence
#     if isempty(words)
#         return Dict{Any,Any}()
#     end

#     # Step 2: Create a dictionary to store word counts
#     word_counts = Dict{String,Int}()

#     # Step 3: Iterate through the words and update the counts in the dictionary
#     for word in words
#         if haskey(word_counts, word)
#             word_counts[word] += 1
#         else
#             word_counts[word] = 1
#         end
#     end

#     return word_counts
# end


# # Example usage:
# sentence = " .\n,\t!^&*()~@#\$%{}[]:;'/<>"
# word_counts = wordcount(sentence)
# println(word_counts)

function wordcount(sentence)
    # Remove all punctuation except the apostrophe in contractions
    cleaned_subtitle = replace(lowercase(sentence), r"[^\w\d' ]" => "")

    # Split the cleaned subtitle into individual words
    words = split(cleaned_subtitle, ' ')  # Split on space characters

    # Create a dictionary to store word counts
    word_counts = Dict{String,Int}()

    # Count the occurrences of each word
    for word in words
        word_counts[word] = get(word_counts, word, 0) + 1
    end

    return word_counts
end


# Test the function with the provided example
subtitle = "That's the password: 'PASSWORD 123'!, cried the Special Agent.\nSo I fled."
word_counts = wordcount(subtitle)
println(word_counts)

