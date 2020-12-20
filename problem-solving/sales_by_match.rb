#!/bin/ruby

require 'json'
require 'stringio'

# Complete the sockMerchant function below.
def sockMerchant(n, ar)
    count = 0
    while ar.size > 0
        e = ar.shift
        if ar.include?(e)
            count += 1
            i = ar.find_index(e)
            ar.delete_at(i)
        end
    end
    count
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

n = gets.to_i

ar = gets.rstrip.split(' ').map(&:to_i)

result = sockMerchant n, ar

fptr.write result
fptr.write "\n"

fptr.close()
