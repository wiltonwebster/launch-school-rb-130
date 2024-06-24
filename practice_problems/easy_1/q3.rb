# Find Missing Numbers

=begin
Write a method that takes a sorted array of integers as an argument, and returns
an array that includes all of the missing integers (in order) between the first 
and last elements of the argument.
=end

def missing(array)
  curr_val = array.first
  end_val = array.last
  result = []
  while curr_val < end_val
    result << curr_val unless array.include?(curr_val)
    curr_val += 1
  end
  result
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []