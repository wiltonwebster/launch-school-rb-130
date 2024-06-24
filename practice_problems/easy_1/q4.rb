# Divisors

=begin
Write a method that returns a list of all of the divisors of the positive 
integer passed in as an argument. The return value can be in any sequence you 
wish.
=end

def divisors(num)
  max = Math::sqrt(num)
  counter = 1
  result = []
  while counter <= max 
    if num % counter == 0
      result << counter
      result << num / counter
    end
    counter += 1
  end
  result.uniq.sort
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute