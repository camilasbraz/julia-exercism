function bob(stimulus::AbstractString)::AbstractString

    stimulus = replace(stimulus, r"\s+" => "")

    # Check if the input is empty or contains only whitespaces
    if isempty(strip(stimulus))
        return "Fine. Be that way!"
    end

    # Check if the input is a question
    if endswith(stimulus, "?")
        # Check if the input is a yelling question
        if stimulus == uppercase(stimulus) && any(isletter, stimulus)
            return "Calm down, I know what I'm doing!"
        else
            return "Sure."
        end
    end

    # Check if the input is yelling (in all capitals)
    if stimulus == uppercase(stimulus) && any(isletter, stimulus)
        return "Whoa, chill out!"
    end

    # If none of the previous conditions match, respond with 'Whatever.'
    return "Whatever."
end
