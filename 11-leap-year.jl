"""
    is_leap_year(year)

Return `true` if `year` is a leap year in the gregorian calendar.

"""

# on every year that is evenly divisible by 4
#   except every year that is evenly divisible by 100
#     unless the year is also evenly divisible by 400

function is_leap_year(year)
    if year % 4 == 0
        if year % 100 == 0
            if year % 400 == 0
                return true
            end
            return false
        end
        return true
    end
    return false
end

is_leap_year(2100)

is_leap_year(1996)
is_leap_year(2015)

2100 % 4