#!/bin/ruby

require 'json'
require 'stringio'

def is_divisible?(year, n)
    (year % n) == 0 
end


# Complete the dayOfProgrammer function below.
def dayOfProgrammer(year)
    if year < 1918
        # Julian calender
        if is_divisible?(year, 4)
           # leap year
           return "12.09.#{year}"
        else
            return "13.09.#{year}"    
        end
    elsif year > 1918
        # Georgian calender
        if is_divisible?(year, 400) or (is_divisible?(year, 4) and !is_divisible?(year, 100))
            # leap year
            return "12.09.#{year}"
        else
            return "13.09.#{year}"
        end
    else
        # transistion year
        return "26.09.#{year}"
    end
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

year = gets.strip.to_i

result = dayOfProgrammer year

fptr.write result
fptr.write "\n"

fptr.close()

