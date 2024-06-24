# Passing Parameters Part 2

=begin
Ruby gives us a lot of flexibility when assigning arrays to variables. If 
want to assign the entire array to a single variable, we can do that:
=end

birds = %w(raven finch hawk eagle)
p birds # => ['raven','finch','hawk','eagle']

=begin
If we want to assign every element to a separate variable, we can do that too:
=end

raven, finch, hawk, eagle = %w(raven finch hawk eagle)
p raven # => 'raven'
p finch # => 'finch'
p hawk # => 'hawk'
p eagle # => 'eagle'

=begin
Suppose we want to organize our array contents into groups, where variables 
represent category names. Can we do that without extracting items directly from 
the array based on their indices?

We can use the splat operator(*) to do something like this:
=end

raven, finch, *raptors = %w(raven finch hawk eagle)
p raven # => 'raven'
p finch # => 'finch'
p raptors  # => ['hawk','eagle']

=begin
Based on the examples shown above, write a method that takes an array as an 
argument. The method should yield the contents of the array to a block, which 
should assign your block parameters in such a way that it ignores the first two 
elements, and groups all remaining elements as a raptors array.
=end

def method(array)
  yield array
end

method(array) do |_, _, *raptors|
  #block something or other
end