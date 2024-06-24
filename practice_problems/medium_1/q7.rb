# Bubble Sort with Blocks

=begin
In an earlier exercise, you were asked to construct a #improved_bubble_sort! method that
used the bubble sort algorithm to sort Arrays in place. Our solution was this:
=end

def bubble_sort!(array)
  loop do
    swapped = false
    1.upto(array.size - 1) do |index|
      next if array[index - 1] <= array[index]
      array[index - 1], array[index] = array[index], array[index - 1]
      swapped = true
    end

    break unless swapped
  end
end

=begin
The problem with this solution is that it doesn't give you any freedom in terms 
of the criteria used for the sort. For example, perhaps you want to sort the 
Array in reverse order from usual, or perhaps you want to sort a list of names 
in a case-insensitive manner.

Your task in this assignment is to modify #improved_bubble_sort! so it takes an optional
block that determines which of two consecutive elements will appear first in the
results.

If you still have a copy of your #improved_bubble_sort! method, you may use that method
as the basis for this exercise. Otherwise, you can use the above solution.
=end

def improved_bubble_sort!(array)
  loop do
    swapped = false
    1.upto(array.size - 1) do |index|
      if block_given?
        next if yield(array[index - 1], array[index])
      else
        next if array[index - 1] <= array[index]
      end
      
      array[index - 1], array[index] = array[index], array[index - 1]
      swapped = true
    end

    break unless swapped
  end
end


array = [5, 3]
improved_bubble_sort!(array)
p array == [3, 5]

array = [5, 3, 7]
improved_bubble_sort!(array) { |first, second| first >= second }
p array == [7, 5, 3]

array = [6, 2, 7, 1, 4]
improved_bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = [6, 12, 27, 22, 14]
improved_bubble_sort!(array) { |first, second| (first % 7) <= (second % 7) }
p array == [14, 22, 12, 6, 27]

array = %w(sue Pete alice Tyler rachel Kim bonnie)
improved_bubble_sort!(array)
p array == %w(Kim Pete Tyler alice bonnie rachel sue)

array = %w(sue Pete alice Tyler rachel Kim bonnie)
improved_bubble_sort!(array) { |first, second| first.downcase <= second.downcase }
p array == %w(alice bonnie Kim Pete rachel sue Tyler)

=begin
Modify your solution so it only passes one element to the block at a time; the 
block should perform some sort of transformation to the argument, and
#bubble_sort! itself should just use <= to compare two values. In other words, 
you should be able to call #bubble_sort! like this:
=end

def further_improved_bubble_sort!(array)
  loop do
    swapped = false
    1.upto(array.size - 1) do |index|
      if block_given?
        next if yield(array[index - 1]) <= yield(array[index])
      else
        next if array[index - 1] <= array[index]
      end
      
      array[index - 1], array[index] = array[index], array[index - 1]
      swapped = true
    end

    break unless swapped
  end
end
  

array = %w(sue Pete alice Tyler rachel Kim bonnie)
further_improved_bubble_sort!(array) { |value| value.downcase }
p array == %w(alice bonnie Kim Pete rachel sue Tyler)