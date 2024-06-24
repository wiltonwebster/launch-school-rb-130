=begin
Write a custom each() method. Note that each should return the calling object.

Our each method should be able to be called on an array.
=end

def each(array)
  index_counter = 0
  while index_counter < array.size
    yield(array[index_counter])
    index_counter += 1
  end
  
  array
end

p each([1, 2, 3, 4, 5]) {|num| "do nothing"}.select{ |num| num.odd? }     # => [1, 3, 5]