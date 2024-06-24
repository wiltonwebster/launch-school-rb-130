=begin
Assignment: Build a 'reduce' method

Try to write a reduce method on your own that models Enumerable#reduce. Your 
reduce should take at least 1 argument that represents the array we'll operate
on. It should also take an optional second argument that represents the default 
value for the accumulator. Here's a few examples that we should be able to call 
on your method.
=end


=begin
Notes:
 - The reduce method needs to track the accumulator and the iterator
 - On each iteration, the iterator needs to be combined with the accmulator,
   returning the accumulator.
 - This behavior of combining needs to be accomplished with a yield.
=end

def reduce(arr, starting_value = 0)
  accumulator = starting_value
  counter = 0
  
  while counter < arr.size
    curr_element = arr[counter]
    accumulator = yield(accumulator, curr_element)
    counter += 1
  end
  
  accumulator
end

array = [1, 2, 3, 4, 5]

# p reduce(array) { |acc, num| acc + num }                    # => 15
# p reduce(array, 10) { |acc, num| acc + num }                # => 25
# p reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError

=begin
The real reduce method is much more powerful and flexible than this, but we are
intentionally omitting much of its additional functionality since it does not
benefit this particular lesson.

However...

One thing you may notice is that we use a number (0) as the default initial 
value for the accumulator, which limits us: we can't use our version with a 
default value if the data is non-numeric. Compare this to Enumerable#reduce 
where the default initial value is the first element of the collection.

For an extra challenge, how would you implement this improved default behavior? 
Try it on your own.
=end

def improved_reduce(arr, starting_value = nil)
  counter = 0
  
  if starting_value
    accumulator = starting_value
  else
    accumulator = arr[0]
    counter += 1
  end
  
  while counter < arr.size
    curr_element = arr[counter]
    accumulator = yield(accumulator, curr_element)
    counter += 1
  end
  
  accumulator
end

p improved_reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p improved_reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']