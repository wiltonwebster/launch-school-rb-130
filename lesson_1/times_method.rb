=begin
Write a times() method that mimics the Integer#times method.

This method should iterate the block argument from 0 to the caller minus 1.
Then it should return the calling object.

Our method will have an argument instead of a calling object, since we are not
defining a new method on the Integer class.
=end

def times(num)
  completed_iterations = 0
  loop do
    yield(completed_iterations) if completed_iterations < num
    completed_iterations += 1
  end
  num
end

times(5) do |num|
  puts num
end