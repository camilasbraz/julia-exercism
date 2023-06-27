# Plain:  abcdefghijklmnopqrstuvwxyz
# Cipher: zyxwvutsrqponmlkjihgfedcba

plain = "abcdefghijklmnopqrstuvwxyz"
cipher = "zyxwvutsrqponmlkjihgfedcba"

function separate_into_chunks(str, chunk_size)
    chunks = []
    for i in 1:chunk_size:length(str)
        remaining = min(chunk_size, length(str) - i + 1)
        chunk = str[i:i+remaining-1]
        push!(chunks, chunk)
    end
    return join(chunks, " ")
end

function encode(input)
    string_cipher = ""
    input = lowercase(replace(replace(input, r"\s+" => ""), r"[^A-Za-z0-9]+" => ""))
    num_chars = length(input)
    for char in input
        position = findfirst(x -> x == char, plain)
        if position === nothing
            string_cipher = string_cipher * char
        else
            position_rev = -(position - 27)
            char_rev = plain[position_rev]
            string_cipher = string_cipher * char_rev
        end
    end
    string_cipher = string_cipher[end-num_chars+1:end]
    if num_chars <= 5
        return string_cipher
    else
        return separate_into_chunks(string_cipher, 5)
    end
end

function decode(input)
    string_plain = ""
    input = lowercase(replace(replace(input, r"\s+" => ""), r"[^A-Za-z0-9]+" => ""))
    num_chars = length(input)
    for char in input
        position = findfirst(x -> x == char, cipher)
        if position === nothing
            string_plain = string_plain * char
        else
            position_rev = -(position - 27)
            char_rev = cipher[position_rev]
            string_plain = string_plain * char_rev
        end
    end
    string_plain = string_plain[end-num_chars+1:end]
end
