# Method to Proc

=begin
In our Ruby course content on blocks, we learn about "symbol to proc" and how it
works. To review briefly, consider this code:
=end

array = [5, 7, 2, 4]
comparator = proc { |a, b| b <=> a }

=begin
and the Array#sort method, which expects a block argument to express how the
Array will be sorted. If we want to use comparator to sort the Array, we have a
problem: it is a proc, not a block. The following code:
=end

# array.sort(comparator)

=begin
fails with an ArgumentError. To get around this, we can use the proc to block
operator & to convert comparator to a block:
=end

array.sort(&comparator)

=begin
This now works as expected, and we sort the Array in reverse order.

When applied to an argument object for a method, a lone & causes ruby to try to 
convert that object to a block. If that object is a proc, the conversion happens
automatically, just as shown above. If the object is not a proc, then & attempts
to call the #to_proc method on the object first. Used with symbols, e.g., 
&:to_s, Ruby creates a proc that calls the #to_s method on a passed object, and 
then converts that proc to a block. This is the "symbol to proc" operation 
(though perhaps it should be called "symbol to block").

Did you know that you can perform a similar trick with methods? You can apply 
the & operator to an object of the Method class, which is created by 
Object#method. In doing so, Ruby can call Method#to_proc.

Using this information, together with the course page linked above, fill in the
missing part of the following code so we can convert an array of integers to 
base 8 (octal numbers). Use the comments for help in determining where to make 
your modifications, and make sure to review the "Approach/Algorithm" section for
this exercise; it should prove useful.
=end

# Replace the two `method_name` placeholders with actual method calls
def convert_to_base_8(n)
  n.to_s(8).to_i
end

# Replace `argument` with the correct argument below
# `method` is `Object#method`, not a placeholder
base8_proc = method(:convert_to_base_8).to_proc

# We'll need a Proc object to make this code work
# Replace `a_proc` with the correct object
p [8, 10, 12, 14, 16, 33].map(&base8_proc) == [10, 12, 14, 16, 20, 41]