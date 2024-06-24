# Passing Parameters Part 3

=begin
Given this code:
=end

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

=begin
Fill out the following method calls for gather so that they produce the 
corresponding output shown in numbers 1-4 listed below:
=end

=begin
(1)
Let's start gathering food.
apples, corn, cabbage
wheat
We've finished gathering!
=end

gather(items) do |*produce, wheat|
  puts produce.join(', ')
  puts wheat
end

=begin
(2)
Let's start gathering food.
apples
corn, cabbage
wheat
We've finished gathering!
=end

gather(items) do |fruit, *vegetables, wheat|
  puts fruit
  puts vegetables.join(', ')
  puts wheat
end

=begin
Let's start gathering food.
apples
corn, cabbage, wheat
We've finished gathering!
=end

gather(items) do |apples, *not_apples|
  puts apples
  puts not_apples.join(', ')
end

=begin
(4)
Let's start gathering food.
apples, corn, cabbage, and wheat
We've finished gathering!
=end

gather(items) do |apples, corn, cabbage, wheat|
  puts "#{apples}, #{corn}, #{cabbage}, and #{wheat}"
end