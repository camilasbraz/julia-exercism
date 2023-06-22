# Change any of the following NamedTuple values to true to 
# enable testing different bonus tasks
tested_bonus_tasks = (rev = false, by = false, lt = false, multiple_matches = false)

# Falta lt e multiple_matches
function binarysearch(list, victim; low = 1, high = length(list), rev = false, by = "", lt = (<), multiple_matches = false)
    # Handle the case when the list is empty
    if isempty(list)
        return 1:0
    end
    
    list = sort(list, rev = rev)
    
    if by ==  round
        list = [round(x) for x in list]
        victim = round(victim)
    end

    if by == abs2 ∘ round
        list = [round(x)^2 for x in list]
        victim = round(victim)^2
    end

    while high >= low
        mid = div(low + high, 2)
        if list[mid] == victim
            left = rev ? mid : searchsortedfirst(list[low:mid], victim) + low - 1
            right = rev ? searchsortedfirst(list[low:mid], victim) + low - 1 : searchsortedlast(list[mid:high], victim)  + low - 1 
            if multiple_matches
                return left:right
            else
                return left:left
            end
        elseif (lt == (<) ? list[mid] < victim : list[mid] > victim)
            if rev
            # numero esta para tras
                high = mid - 1
                
            else
                low = mid + 1
            end
        else
            if rev
            # numero esta para frente
                low = mid + 1
            else
                high = mid - 1
            end
        end
    end
    # Victim not found  
    return low:high-1  
end


binarysearch([1, 3, 4, 6, 6, 9, 11], 6)

