# Get n palindromic prime numbers

def _prime?(n)
    is_prime = true
    for x in (2..n)
        break if x*x > n
        return false if n % x == 0
    end
    is_prime
end

def _palindrome?(n)
    n.to_s == n.to_s.reverse
end

def prime(c)
    2.upto(Float::INFINITY).lazy.reject {|n| n if not _palindrome?(n)}.reject { |n| n if not _prime?(n)}.first(c)
end

def main
    n = gets
    print prime n.gsub(/\n/, '').to_i 
end

main
